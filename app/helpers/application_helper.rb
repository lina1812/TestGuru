module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to repo.to_s, "https://github.com/#{author}/#{repo}/", { target: '_blank', rel: 'nofollow' }
  end

  def flash_alerts
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
