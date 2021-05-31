class GitHubClient
  
  ACCESS_TOKEN = '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'

  def initialize
    @client = setup_client
  end
  
  def create_gist(params)
    @client.create_gist(params)
  end
  
  private 
  
  def setup_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end




