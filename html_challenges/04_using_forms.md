# Using forms

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Use HTML forms to make the browser send `POST` requests.

## Intro

A form is used to send a `POST` request, usually with some additional data, as request parameters.

A form is usually implemented over two routes:

* The first one, a `GET` route, only returns an HTML page with the form, so the
  user can fill in and submit it.
  
* The second one, a `POST` route, handles the body parameters sent by the
  browser, and returns a response (usually to indicate whether the form data has
  been successfully handled or saved).

[You can see an example in the starter app.](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/example_routes.py#L28-L58)

## HTML forms

Like links, we can use forms to make the browser send an HTTP request.

[You can see an example in the starter app](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/templates/books/new.html)

When the user submits this form, the browser sends a `POST` request to the path
`/books`. The `action` and `method` attributes are used to tell the browser
which method and path to send the new request to. The content of each form input
is sent as body parameters with the `name` HTML attribute being the name of the
parameter.

## Validation

Note that the values of the `name` attributes in the HTML form must match the
parameters' names the Flask route expects — this is also called having a
"contract" between the client (the web browser sending the form data) and the
server (our Flask application, which is expecting some specific parameters).

A way of enforcing this contract, and avoiding the client sending wrong values,
is to add some validation to the `POST` route.

You can see an example of this in the starter app:

1. [The route checks whether the book is
   valid](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/example_routes.py#L50-L52)
2. [Using the `is_valid` method on
   `Book`](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/lib/book.py#L20-L25)
3. If not, [it
  renders](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/example_routes.py#LL52)
  the new form again instead, passing in the result of
  [`Book#generate_errors](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/lib/book.py#L27-L36)
4. And the form [displays the errors at the top of the
   form](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/templates/books/new.html#L13-L18)

<details>
  <summary>:speech_balloon: What does `new.html` mean by 'These `label` tags are important for accessibility'?</summary>

  ---

  Accessibility is about making sure that everyone can use your website,
  including people with disabilities.

  The `label` tag is one important technique. It enables visually impaired
  people to use applications that read out the screen called 'screen readers'.
  With the `label` tag the screen reader can read out the label of the input
  field when the user reaches it.

  It is also helpful in another way: when you click the label the input field
  will be focused. Try it out!

  To learn more, read [this resource from the Harvard University digital
  accessibility
  resource](https://accessibility.huit.harvard.edu/technique-input-labels).

  ---

</details>

## Test-driving a form

We also need some tests for this behaviour:

* [A test for loading and submitting the form, then checking that the next
  page reflects that
  submission](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_example_routes.py#L52-L79)
* [A test for submitting an invalid form and displaying
  errors](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_example_routes.py#L81-L91)
* [Plus unit tests for the new methods on `Book` `#is_valid` and
  `#generate_errors`](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/tests/test_book.py#L32-L54)

## On Route Priority

Let's consider the following situation:

```python
@app.route('/albums/<id>')
def get_album(id):
    pass

@app.route('/albums/new')
def get_new_album():
    pass
```

How does Flask tell the difference between these routes? How does it know to
route `/albums/new` to `get_new_album` and not to `get_album`, which it
technically will also match.

Flask tries to be smart about which is used. In this case, it picks routes
without parameters before routes with parameters — so if `/albums/new` matches
it will always win even if it is the last route in the list.

If you'd like to make your routes even more precise, you can [can configure the
route parameter to match a certain
format](https://flask.palletsprojects.com/en/2.0.x/quickstart/#variable-rules),
such as a numeric value. [The starter app does this, as you can see
here.](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/example_routes.py#L18-L32)

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=1GcIg1lDTC4&t=2348s)

## Exercise

Test-drive and implement a form page to add a new album.

You should then be able to use the form in your web browser to add a new album, and see this new album in the albums list page.

[Example solution](https://www.youtube.com/watch?v=1GcIg1lDTC4&t=4140s)

## Challenge

Test-drive and implement a form page to add a new artist.

You should then be able to use the form in your web browser to add a new artist, and see this new artist in the artists list page.


[Next Challenge](05_debugging.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
