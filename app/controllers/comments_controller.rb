class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    
    if @comment.save
        redirect_to "/prototypes/#{@comment.prototype.id}"
    else
        @comments = @prototype.comments.includes(:user)
        render "prototypes/show"
    end
    
        
  end

  private
   
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id ,prototype_id: params[:prototype_id])
  end


end
