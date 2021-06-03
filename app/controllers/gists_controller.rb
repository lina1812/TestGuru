class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.present?
                      Gist.create(
                        user: current_user,
                        question: @test_passage.current_question,
                        url: result[:html_url],
                        gist_id: result[:id]
                      )
                      { notice: t('.success_html', url: result.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
