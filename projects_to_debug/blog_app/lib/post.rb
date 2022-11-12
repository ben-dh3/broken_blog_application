class Post
  attr_accessor :title, :content, :tags

  def initialize(title, content, tags = [])
    @title = title
    @content = content
    @tags = tags
  end
end