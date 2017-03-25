class IdeasController < ApplicationController
   def index
     @idea = Idea.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
   end
   def create
        @idea=Idea.create(idea_params)
        if @idea.valid?
            #Implement later
        else
            #Implement later
        end
        redirect_to_root_path
   end
    def edit
        @idea=Idea.find(params[:id])
    end
    def update
        @idea=Idea.find(params[:id])
        if @idea.update(idea_params)
            redirect_to_root_path
        else
            redirect_to_edit__idea_path(params[:id])
        end
    end
    def destroy
        @idea=Idea.find(params[:id])
        @idea.destroy
        redirect_to_root_path
    end
    
    private
    def idea_params
        params.require(:idea).permit(:description,:author)
    end
end