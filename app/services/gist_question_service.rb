class GistQuestionService
  include Dry::Monads[:result]

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    Success(@client.create_gist(gist_params))
  rescue Faraday::ConnectionFailed, Octokit::Unauthorized
    Failure(:connection_error)
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
