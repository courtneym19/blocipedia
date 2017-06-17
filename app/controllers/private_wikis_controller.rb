class PrivateWikisController < ApplicationController
before_action :authorize_user

  def index
    @private_wikis = PrivateWiki.all
  end

  def show
    @private_wiki = PrivateWiki.find(params[:id])
  end

  def new
    @private_wiki = PrivateWiki.new
  end

  def create
     @private_wiki = PrivateWiki.new
     @private_wiki.title = params[:private_wiki][:title]
     @private_wiki.body = params[:private_wiki][:body]

     if @private_wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @private_wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

  def edit
    @private_wiki = PrivateWiki.find(params[:id])
  end

  def update
     @private_wiki = PrivateWiki.find(params[:id])
     @private_wiki.title = params[:private_wiki][:title]
     @private_wiki.body = params[:private_wiki][:body]

     if @private_wiki.save
       flash[:notice] = "Wiki was updated."
       redirect_to @private_wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

   def destroy
     @private_wiki = PrivateWiki.find(params[:id])

     if @private_wiki.destroy
       flash[:notice] = "\"#{@private_wiki.title}\" was deleted successfully."
       redirect_to private_wikis_index_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end

   private
   def authorize_user
     unless current_user.premium?
       flash[:alert] = "You must sign up for a premium account to access that page."
       redirect_to root_path
     end
   end
end
