class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result finish]

  def show; end

  def result
    @counting_result = @test_passage.counting_result
  end

  def update
    if @test_passage.timer_out?
      redirect_to finish_test_passage_path(@test_passage) 
      return
    end

    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to finish_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  
  def finish
    @test_passage.update(win: true) if @test_passage.successful?
    GettingBadgeService.new(@test_passage).call
    TestsMailer.completed_test(@test_passage).deliver_now
    redirect_to result_test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
