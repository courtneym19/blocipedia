class CollaboratorsController < ApplicationController
    def create
      wiki = Wiki.find(params[:id])
    end

    def destroy
      @wiki = Wiki.find(params[:id])
      collaborator = Collaborator.find(params[:id])

      if collaborator.destroy
        flash[:notice] = "Collaborator successfully deleted."
        redirect_to @wiki
      else
        flash.now[:alert] = "There was an error removing the collaborator."
        redirect_to @wiki
      end
    end
end
