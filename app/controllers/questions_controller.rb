class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by{ |q| q.created_at}
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.sort_by{ |q| q.created_at}
    @comment = Comment.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = 'Question successfully added'
      redirect_to @question
    else
      render :new
    end
  end

  protected

    def question_params
      params.require(:question).permit(:title, :description)
    end
  end
