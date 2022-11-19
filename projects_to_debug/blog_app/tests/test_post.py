from lib.post import Post

"""
Post constructs with an id, title, content, and tags
"""
def test_post_constructs():
    post = Post(1, "Test Title", "Test Content", ["tag1", "tag2"])
    assert post.id == 1
    assert post.title == "Test Title"
    assert post.content == "Test Content"
    assert post.tags == ["tag1", "tag2"]


"""
We can format posts to strings nicely
"""
def test_posts_format_nicely():
    post = Post(1, "Test Title", "Test Author", ["tag1", "tag2"])
    assert str(post) == "Post(1, Test Title, Test Author, ['tag1', 'tag2'])"

"""
We can compare two identical posts
And have them be equal
"""
def test_posts_are_equal():
    post1 = Post(1, "Test Title", "Test Author", ["tag1", "tag2"])
    post2 = Post(1, "Test Title", "Test Author", ["tag1", "tag2"])
    assert post1 == post2
