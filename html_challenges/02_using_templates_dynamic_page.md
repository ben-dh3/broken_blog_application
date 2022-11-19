# Using Templates to return dynamic HTML

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to use Templates to dynamically generate HTML responses.

## Intro

The HTML content we put in views is static by default.

We can use Jinja Templates to generate dynamically the HTML that is sent to the
client, by replacing the dynamic parts of the HTML, which are delimited by Jinja
tags (in between `{{` and `}}`).

The following example shows how a variable `name` can be used to change the view
HTML content:

```python
# file: app.py

from flask import Flask, render_template

app = Flask(__name__)

# Example request:
#   GET /greet?name=Kay
@app.route('/greet')
def greet():
    # We'll get the name parameter
    name = request.args.get('name')

    # We then use `render_template` with a filename and some parameters
    # to generate some HTML content.
    return render_template('greet.html', name=name)

    # The process is the following:
    #
    # 1. Python reads the greet.html view file
    # 2. It looks for any Jinja tags and replaces them with the value you gave
    # 3. The final generated HTML is sent in the response

```

Here's the template file:

```html
<!-- file: templates/greet.html -->
<html>
  <head></head>
  <body>
    <!-- the Jinja tag below will be replaced by the value of `name` -->
    <h1>Hello {{ name }}!</h1>
  </body>
</html>
```

[Use this guidance as reference material on Jinja syntax](../pills/just_enough_jinja_templates.md) for the following challenges.

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=2Z4m4lnjxkY) <!-- OMITTED -->

## Exercise

Test-drive a `GET /albums` route that connects with an `AlbumRepository` and the
database to return a result like this:

```html
<!-- GET /albums -->

<html>
  <head></head>
  <body>
    <h1>Albums</h1>

    <div>
      Title: Doolittle
      Released: 1989
    </div>

    <div>
      Title: Surfer Rosa
      Released: 1988
    </div>

    <!-- ... -->
  </body>
</html>
```

_(Don't forget to run the app using `python app.py`)._

Use your web browser to access the page and check that it works in the browser
too.

[Example solution](https://www.youtube.com/watch?v=2Z4m4lnjxkY) <!-- OMITTED -->

## Challenge

In your project `music_web_app`.

Test-drive and implement a `GET /albums/:id` route so it returns the HTML content for a single album:

```html
<!-- Example for GET /albums/1 -->

<html>
  <head></head>
  <body>
    <h1>Doolittle</h1>
    <p>
      Release year: 1989
      Artist: Pixies
    </p>
  </body>
</html>

<!-- Example for GET /albums/2 -->

<html>
  <head></head>
  <body>
    <h1>Surfer Rosa</h1>
    <p>
      Release year: 1988
      Artist: Pixies
    </p>
  </body>
</html>
```


[Next Challenge](03_using_links.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_templates_dynamic_page.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_templates_dynamic_page.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_templates_dynamic_page.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_templates_dynamic_page.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_templates_dynamic_page.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
