class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by{ |q| q.created_at}
  end
end
