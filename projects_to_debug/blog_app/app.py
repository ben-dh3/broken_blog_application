import os
from lib.post_repository import PostRepository
from lib.post import Post
from flask import Flask, request, render_template, redirect, url_for

app = Flask(__name__)
repository = PostRepository()

@app.route('/', methods=['GET'])
def get_posts():
    posts = repository.all()
    return render_template('index.html.jinja2', posts=posts)


@app.route('/', methods=['POST'])
def create_post():
    post = Post(None,
                request.form['title'],
                request.form['content'],
                request.form['tags'].split(','))
    post = repository.create(post)
    return redirect(url_for('get_posts'))


@app.route('/tags/<tag>', methods=['GET'])
def get_posts_by_tag(tag):
    posts = repository.all_by_tag(tag)
    return render_template('index.html.jinja2', posts=posts)


if __name__ == '__main__':
    app.run(debug=True, port=int(os.environ.get('PORT', 5000)))
