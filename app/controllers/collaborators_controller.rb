class CollaboratorsController < ApplicationController
    before_action :find_wiki

    def new
      @collaborator = Collaborator.new
    end

    def create
      @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])


      if @collaborator.save
        flash[:notice] = "Collaborator added."
      else
        flash[:alert] = "There was an error adding the collaborator."
      end

    	redirect_to @wiki
    end

    def show
      collaborators = Collaborator.where(user_id: @user.id)
      wiki_collabs = Wiki.where(id: collaborators.pluck(:collaborator_id))
    end

    def destroy
      @collaborator = Collaborator.find(params[:id])

      if collaborator.destroy
        flash[:notice] = "Collaborator successfully deleted."
        redirect_to @wiki
      else
        flash.now[:alert] = "There was an error removing the collaborator."
        redirect_to edit_wiki_path
      end
    end

    def find_wiki
      @wiki = Wiki.find(params[:wiki_id])
    end
end
