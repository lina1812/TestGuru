class GistQuestionService
  Result = Struct.new(:html_url, :id) do
    def success?
      html_url.present?
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    result = @client.create_gist(gist_params)
    Result.new(result[:html_url], result[:id])
  end

  private

  def gist_params
    {
      description: I18n.t('test_passages.gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
