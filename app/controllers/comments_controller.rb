class CommentsController < ApplicationController
  def create
    @mer = Mer.find(params[:mer_id])
    @comment = @mer.comments.create(comment_params)
    redirect_to mer_path(@mer)
  end
  
  def edit
    @mer = Mer.find(params[:mer_id])
    @comment = @mer.comments.find(params[:id])
    if @comment.commenter != current_user.name
      redirect_to mer_path(@mer)
    end
  end
  
  def update
    @mer = Mer.find(params[:mer_id])
    @comment = @mer.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to mer_path(@mer)
    end
  end
  
  def destroy
    @mer = Mer.find(params[:mer_id])
    @comment = @mer.comments.find(params[:id])
    @comment.destroy    
    redirect_to mer_path(@mer)
  end
  
  private
   def comment_params
     params.require(:comment).permit(:commenter, :body)
   end
end
