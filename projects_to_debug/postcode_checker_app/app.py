import os
from lib.postcode_checker import PostcodeChecker
from flask import Flask, request, render_template

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html.jinja2')


@app.route('/check', methods=['POST'])
def check():
    checker = PostcodeChecker()
    postcode = request.form.get('postcode')
    is_valid = checker.check(postcode)
    return render_template('result.html.jinja2', postcode=postcode, is_valid=is_valid)


if __name__ == '__main__':
    app.run(debug=True, port=int(os.environ.get('PORT', 5000)))
