import pytest
from lib.post_repository import PostRepository
from lib.post import Post

"""
When we call PostRepository#all
We get an empty list
"""
def test_get_all_records():
    repository = PostRepository()
    posts = repository.all()

    assert posts == []

"""
When we call PostRepository#create
We see the post reflected in #all
"""
def test_create_record():
    repository = PostRepository()
    post = Post(None, "Test Title", "Test Content")
    created_post = repository.create(post)
    assert created_post == Post(1, "Test Title", "Test Content")

    result = repository.all()
    assert result == [
        Post(1, "Test Title", "Test Content")
    ]

