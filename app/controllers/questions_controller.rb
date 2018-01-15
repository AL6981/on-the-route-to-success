class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by{ |q| q.created_at}
  end

  def show
    @question = Question.find(params[:id])
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
      flash[:errors] = 'Failed to save'
      render action: 'new'
    end
  end

  private

    def question_params
      params.require(:question).permit(:title, :description)
    end
  end
