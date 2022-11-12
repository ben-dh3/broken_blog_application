class PostManager
  def self.instance
    @instance ||= self.new
  end

  def initialize
    @posts = []
  end

  def add_post(post)
    @posts << post
  end

  def all_posts
    @posts
  end

  def all_posts_by_tag(tag)
    @posts.select do |post|
      post.title.include?(tag)
    end
  end
end