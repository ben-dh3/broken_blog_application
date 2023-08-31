# Using HTML to create webpages

_**This is a Makers Vine.** Vines are designed to gradually build up
sophisticated skills. They contain a mixture of text and video, and may contain
some challenge exercises without proposed solutions. [Read more about how to use
Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to return HTML responses to be viewed in a web browser.

<!-- OMITTED -->

## Intro

_Note that this phase uses a [new starter
codebase](https://github.com/makersacademy/web-applications-in-python-project-starter-html)
and so some parts will look new. You'll be asked to set this up in the exercise
at the end._

[Video Alternative](https://www.youtube.com/watch?v=hiQtX-3G_f0&t=0s)

Web browsers are clients. When a web browser sends a request and receives a
response, that response is displayed to the user.

If that response contains HTML code, that code is interpreted and transformed
into a user-friendly web page.

Whenever you visit a website using your web browser, the following happens
behind the scenes:

1. The web browser sends a `GET` request to the server.
2. The web browser receives the response.
3. The web browser interprets the HTML code to know what to display.
4. The web browser shows a graphical web page (with text, images, buttons, etc)
   to the user.

It's important to note that this process happens **again for every new page**.
If we reload the page, the same process happens. If we visit a different page,
the same process happens.

Every time we visit a URL, the web browser acts as a client — it sends a `GET`
request to this URL and path, gets the response, and interprets the HTML as a
user-friendly web page. It is really important that you keep this in mind when
building, using and debugging your web applications, to have a good idea of what
is happening.

[Use this guidance as HTML reference material](../pills/just_enough_html.md)
for the following challenges.

## Returning HTML

We don't want to put HTML code in the middle of our Flask application. That's
because we want to keep these two concerns separated — the program logic (in
Python files) and the response content (the HTML code which will be sent to the
browser).

To avoid putting HTML code in our app file, we write the HTML in a separate
file, also called a _template file_.

This file is in a `templates/` directory and has a `.html` extension.

Take a look at the `get_emoji` function in
[`app.py`](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/app.py#L12-L21)
and
[`templates/emoji.html`](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/templates/emoji.html)
to see how they work together.

You will see some tags that look like `{{ ... }}`. You'll learn about these in
the next step.

## Testing for HTML content

Previously we tested our endpoints by calling them and then asserting on what
they responded. Testing HTML pages in this way can be difficult because they are
long and represent complex interactions between the user and the application.

So we're going to adjust our testing approach to represent things the user might
do rather than raw HTML. For example, clicking a button or filling in a form.

We'll use a library called [Playwright](https://playwright.dev) to do this. It
works by opening a virtual web browser and interacting with it as a user would.

You can see a simple example in
[`tests/test_app.py`](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_app.py#L7-L18).

And a few more sophisticated examples:

* [Looking for a list of items on a page](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_example_routes.py#L6-L23)
* [Clicking a link](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_example_routes.py#L29-L49)
* [Completing a form](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_example_routes.py#L56-L79)

Playwright is a new library and has quite a bit in it. Here are some good
reference materials:

* [The basics of writing
  tests](https://playwright.dev/python/docs/writing-tests)
* [A list of assertions (e.g. `to_have_text`, `to_be_empty`, etc.
  )](https://playwright.dev/python/docs/test-assertions)
* [A list of selectors (e.g. `h2`, `.t-errors`,
  etc)](https://playwright.dev/python/docs/selectors)
* [A list of actions (e.g. `click`, `fill`,
  etc)](https://playwright.dev/python/docs/input) — note that most of these have
  equivalents on the [`page`
  object](https://playwright.dev/python/docs/api/class-page) too

## Exercise One

For this HTML phase, we'll be using a **new starter**. [You can find it
here](https://github.com/makersacademy/web-applications-in-python-project-starter-html).

Set up the new starter and get it running by using the instructions in the
README file.

Find and look at the following files, to see how these are working for the
`/emoji` route that's used as the final step in the starter project's setup:

* `test_app.py`
* `app.py`
* `emoji.html`

## Exercise Two

Create a `GET /goodbye` route that returns a farewell message as an HTML page.
Write a test for it too.

The route should return this:

```html
<html>
  <head></head>
  <body>
    <strong>Bye!</strong>
  </body>
</html>
```

Then, make sure your server is running using `python app.py` and use your
web browser to access the page.

<details>
  <summary>:speech_balloon: I want a bit more challenge.</summary>

  ---

  The above HTML document is invalid in three separate ways.
  
  Find out what they are and fix them.

  You might start by looking for an HTML validator online.

  ---

</details>

[Example Solution](https://www.youtube.com/watch?v=hiQtX-3G_f0&t=1080s)


[Next Challenge](02_using_templates_dynamic_page.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
