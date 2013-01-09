module PostsHelper
  def display_url_link(post)
    if post.url.starts_with?("http://") || post.url.starts_with?("https://") 
      return link_to post.title, post.url
    else
      return link_to post.title, "http://" + post.url
    end
  end
end