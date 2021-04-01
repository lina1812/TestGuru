class QuestionsController < ApplicationController
  
  before_action :find_test
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    render json: @test.questions.to_json
  end
  
  
  def show
    @question = @test.questions.find(params[:id])
    render json: @question.to_json
  end
  
  def new
    
  end
  
  def create  
    @question = @test.questions.create(question_params)
    render  plain: @question.inspect
  end
  
  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    render  plain: 'Question was deleted'
  end
  
  private
  
  def find_test
    @test = Test.find(params[:test_id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end
  
  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
