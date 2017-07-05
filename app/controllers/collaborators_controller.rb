class CollaboratorsController < ApplicationController

    before_action :find_wiki

    def index
      @users = User.all
    end

    def create
      @collaborator = Collaborator.new(user_id: params[:user_id])

      if @collaborator.save
        flash[:notice] = "Collaborator added."
      else
        flash[:alert] = "There was an error adding the collaborator."
      end

    	redirect_to @wiki
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
