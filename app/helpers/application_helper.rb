module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to repo.to_s, "https://github.com/#{author}/#{repo}/", { target: '_blank', rel: 'nofollow' }
  end
  
  def flash_key_to_class(key)
    case key.to_sym
    when :alert
      "danger"
    when :notice
      "info"
    end  
  end
end
