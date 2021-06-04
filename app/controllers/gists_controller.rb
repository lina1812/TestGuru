class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      Gist.create(
        user: current_user,
        question: @test_passage.current_question,
        url: result.html_url,
        gist_id: result.id
      )
      flash_options = { notice: t('.success_html', url: result.html_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
