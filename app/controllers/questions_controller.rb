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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      flash[:success] = 'Question successfully updated'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = 'Question successfully deleted'
    redirect_to questions_path
  end

  protected

    def question_params
      params.require(:question).permit(:title, :description)
    end
  end
