class GistQuestionService
  def initialize(question, user, client: nil)
    @question = question
    @test = @question.test
    @user = user
    @client = client || GitHubClient.new
  end

  def call
    result = @client.create_gist(gist_params)
    Gist.create(user: @user, question: @question, url: result[:html_url], gist_id: result[:id])
  rescue StandardError
    nil
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
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
