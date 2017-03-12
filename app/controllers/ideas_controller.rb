class IdeasController < ApplicationController
    def index
        @ideas=Idea.all
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
    private
    def idea_params
        params.require(:idea).permit(:description,:author)
    end
end