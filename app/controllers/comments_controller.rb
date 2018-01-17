class CommentsController < ApplicationController

  def index
      @question = Question.find(params[:question_id])
      @comments = @question.comments
  end

  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.create(comment_params)
    @comment.question = @question


    if @comment.save
      flash[:notice] = 'Comment successfully added'
      redirect_to @question
    else
      render :new
    end

  end

  protected

  def comment_params
    params.require(:comment).permit(:comment, :question_id)
  end
end
