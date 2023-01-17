class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @visual = Visual.find(params[:visual_id])
      @comment = @visual.comments.create(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      redirect_to root_path
    end
  
    private
  
      def comment_params
        params.require(:comment).permit(:content, :user_id)
      end
  end