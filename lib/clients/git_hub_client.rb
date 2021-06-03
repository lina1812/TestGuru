class GitHubClient
  def initialize
    @client = setup_client
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end
end
