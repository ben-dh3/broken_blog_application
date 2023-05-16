# Using Templates to return dynamic HTML

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to use Templates to dynamically generate HTML responses.

## Intro

_This is also covered in the [video
alternative](https://www.youtube.com/watch?v=hiQtX-3G_f0&t=0s) in the previous
step._

The HTML content we put in pages is static by default.

We can use Jinja Templates to dynamically generate the HTML that is sent to the
client, by replacing the dynamic parts of the HTML, which are delimited by Jinja
tags (in between `{{` and `}}`).

The following example shows how a variable `name` can be used to change the HTML
content:

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
    # 1. Python reads the greet.html file
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

<details>
  <summary>How does `name=name` work in the call to render_template()? How can they both be `name`?!</summary>

  ---

  The two "name" instances refer to different things.

  The first is the input parameter to the HTML file - it's the part that's going
  to match `{{ name }}` in the Jinja tag. If we changed that tag, say to
  "my_name", then we'd need to update the parameter name in the call to
  render_template i.e. `my_name=name`.

  The second is our variable in the greet() route we have defined. If we changed
  that one as well, say to "request_name", then we'd be updating the code to say
  `my_name=request_name`.

  It might be convenient to have them use the same naming convention, but it's
  useful to understand that they mean different things.

  ---
</details>

[Use this guidance as reference material on Jinja syntax](../pills/just_enough_jinja_templates.md) for the following challenges.

## Exercise

Create a new project `music_web_app_html` using [the new HTML starter for this
phase](https://github.com/makersacademy/web-applications-in-python-project-starter-html).

You can copy over your albums-related code from the previous challenges if you want
to, rather than starting over from scratch. You'll probably want these files
(although your chosen filenames might differ!):

* From `lib`: `album.py`, `album_repository.py`, `artist.py`, `artist_repository.py`
* From `tests`: `test_album.py`, `test_album_repository.py`, `test_artist.py`,
  `test_artist_repository.py`
* Optionally copy the album- and artist-related routes from your previous
  `app.py` challenge (plus repository class imports), into the new `app.py`
  file from the new starter project, noting *you will need to change at least
  some of the routes*
* Copy your related seed file over too, into `seeds`; make sure to seed your new
  databases
* Finally, check your original route(s) work in the new project e.g. check `GET
  /albums` by using a browser

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

<details>
  <summary>:speech_balloon: I want a bit more challenge.</summary>

  ---

  The above HTML document isn't very easy for a human to read. In the
  web-browser the Title and Release Date are all on one line. Improve this
  formatting using HTML.

  Finally, ensure the HTML validates using an online HTML validator.

  ---

</details>

[Example solution](https://www.youtube.com/watch?v=1GcIg1lDTC4&t=0s)

## Challenge

In your project `music_web_app_html`.

Test-drive and implement a route that returns the HTML content for a single
album. It should work like this:

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
