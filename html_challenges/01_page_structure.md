# Using HTML to create webpages

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to return HTML responses to be viewed in a web browser.

<!-- OMITTED -->

## Intro

Web browsers are clients. When a web browser sends a request and receives a response, that response is displayed to the user.

If that response contains HTML code, that code is interpreted and transformed into a user-friendly web page.

Whenever you visit a website using your web browser, the following happens behind the scenes:
  1. the web browser sends a `GET` request to the server.
  2. the web browser receives the response.
  3. the web browser interprets the HTML code to know what to display.
  4. the web browser shows a graphical web page (with text, images, buttons, etc) to the user.

It's important to note that this process happens **again for every new page**. If we reload the page, the same process happens. If we visit a different page, the same process happens.

Every time we visit a URL, the web browser acts as a client — it sends a `GET` request to this URL and path, gets the response, and interprets the HTML as a user-friendly web page. It is really important that you keep this in mind when building, using and debugging your web applications, to have a good idea of what is happening.

[Use this guidance as HTML reference material](../pills/just_enough_html.md) for the following challenges.

## Returning HTML

We don't want to put HTML code in the middle of our Flask application. That's because we want to keep these two concerns separated - the program logic (in Python files) and the response content (the HTML code which will be sent to the browser).

To avoid putting HTML code in our app file, we write the HTML in a separate file, also called a _template file_.

This file is in a `templates/` directory and has a `.html` extension.

```
app.py
lib/
  ...
templates/
  index.html
```

```python
# file: app.py

# NOTE: We must import `render_template` from Flask
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    # The `render_template` function takes the template file name as a string,
    # reads its content, and returns the response
    return render_template('index.html')
```

```html
<!-- file: templates/index.html -->

<html>
  <head></head>
  <body>
    <h1>Welcome to my page</h1>
  </body>
</html>
```

## Testing for HTML content

We can test HTML responses in a similar way to testing plain text responses. However they can get quite long, so we can use the `in` operator to assert that the response contains a particular string.

```python

import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True # This gets us better errors
    with app.test_client() as client:
        yield client


"""
Request: GET /
Has a h1 title
"""
def test_index_contains_h1_title(client):
    response = client.get('/')
    assert "<h1>Hello</h1>" in response.data.decode('utf-8')

"""
Request: GET /
Contains a div
"""
def test_index_contains_div(client):
    response = client.get('/')
    assert "<div>" in response.data.decode('utf-8')
```

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=Z8Y2J9Z8Z0o) <!-- OMITTED -->

## Exercise

In your `hello_web_project` project.

Test-drive and update the `GET /hello` route so it returns the greeting message as an HTML page:

```html
<html>
  <head></head>
  <body>
    <h1>Hello!</h1>
  </body>
</html>
```

Then, make sure your server is running using `flask --debug run` and use your web browser to access the page.





[Next Challenge](02_using_templates_dynamic_page.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
