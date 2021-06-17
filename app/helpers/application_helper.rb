module ApplicationHelper
  FLASH_CLASS = {
    alert: 'danger',
    notice: 'info'
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to repo.to_s, "https://github.com/#{author}/#{repo}/", { target: '_blank', rel: 'nofollow' }
  end

  def flash_key_to_class(key)
    FLASH_CLASS[key.to_sym]
  end

  def method_for_submit_form(object)
    object.new_record? ? '.create' : '.update'
  end

  def progress_bar(max, current)
    content_tag(:div,
                content_tag(:div,
                            nil,
                            class: 'progress-bar',
                            data: {
                              max_value: max,
                              now_value: current
                            }),
                class: 'progress')
  end
end
