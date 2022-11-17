# Using forms

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Use HTML forms to make the browser send `POST` requests.

## Intro

A form is used to send a `POST` request, usually with some additional data, as request parameters.

A form is usually implemented over two routes:
  * The first one, a `GET` route, only returns an HTML page with the form, so the user can fill in and submit it.
  * The second one, a `POST` route, handles the body parameters sent by the browser, and returns a response (usually to indicate whether the form data has been successfully handled or saved).

Here's an example:

```python
@app.route('/posts/new', methods=['GET'])
def new_post():
    # This route doesn't do much,
    # it returns the view with the HTML form.
    return render_template('new_post.html')

@app.route('/posts', methods=['POST'])
def create_post():
    # Get request body parameters
    title = request.form['title']
    content = request.form['content']

    # Do something useful, like creating a post
    # in a database.
    new_post = Post()
    new_post.title = title
    new_post.content = content
    PostRepository().create(new_post)

    # Return a view to confirm
    # the form submission or resource creation
    # to the user.
    return render_template('post_created.html')
```

## HTML forms

Like links, we can use forms to make the browser send an HTTP request.

```html
<form action="/posts" method="POST">
  <input type="text" name="title">
  <input type="text" name="content">

  <input type="submit" value="Submit the form">
</form>
```

When the user submits this form, the browser sends a `POST` request to the path `/posts`. The `action` and `method` attributes are used to tell the browser which method and path to send the new request to. The content of each form input is sent as body parameters.

## Validation

Note that the values of the `name` attributes in the HTML form must match the parameters' names the Flask route expects — this is also called having a "contract" between the client (the web browser sending the form data) and the server (our Flask application, which is expecting some specific parameters).

A way of enforcing this contract, and avoiding the client to send wrong values, is to add some validation to the `POST` route — here's an example:

```python
# app.py

    @app.route('/posts', methods=['POST'])
    def create_post():
        if invalid_request_parameters():
            # Set the response code
            # to 400 (Bad Request) - indicating
            # to the client it sent incorrect data
            # in the request.
            return '', 400

        # Parameters are valid,
        # the rest of the route can execute.

    def invalid_request_parameters():
        return request.form['title'] == None or request.form['content'] == None
```
## Test-driving a form

Since there are two routes, we need to test-drive these two routes. It's fine to test-drive them one by one.

```python
"""
GET /posts/new
Returns the form page
"""
def test_get_posts_new(client):
    response = client.get('/posts/new')

    assert response.status_code == 200
    assert '<h1>Add a post</h1>' in response.data.decode()

    # Assert we have the correct form tag with the action and method.
    assert '<form action="/posts" method="POST">' in response.data.decode()

    # We can assert more things, like having
    # the right HTML form inputs, etc.

"""
POST /posts
Returns a success page
"""
def test_post_posts(client):
    # We're now sending a POST request,
    # simulating the behaviour that the HTML form would have.
    response = client.post(
        '/posts',
        data={
            'title': 'Welcome',
            'content': 'I am a post
        }
    )

    assert response.status_code == 200
    assert '<p>Your post has been added!</p>' in response.data.decode()

"""
POST /posts
Responds with 400 status if parameters are invalid
"""
def test_post_posts_invalid_parameters(client):
    # ...
    pass
```

## On Route Priority

Remember that Flask uses the first route that matches a request. When creating a route such as `/albums/new`, a common problem you could run into would be to have another route `/albums/<id>`, containing a dynamic path parameter, being used - as the parameter `<id>` will "capture" the value `"new"` in the URL.

```python
# For a request with path `/albums/new`

# This route will be used - which is probably not what we want.
@app.route('/albums/<id>')
def get_album(id):
    pass

# And this one is skipped
@app.route('/albums/new')
def get_new_album():
    pass
```

An easy way to fix this is to define the routes in the reverse order - this way `/albums/new` will be used first, and then any request to a path such as `/albums/12` will get to the other route. Another way, a bit more complex, is [to configure the route parameter to match a certain format](https://flask.palletsprojects.com/en/2.0.x/quickstart/#variable-rules), such as a numeric value.

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=A6xZFvUGJXs)

## Exercise

In the project `music_library_database_app`.

Test-drive and implement a form page to add a new album.

You should then be able to use the form in your web browser to add a new album, and see this new album in the albums list page.

[Example solution](https://www.youtube.com/watch?v=A6xZFvUGJXs&t=1220s)

## Challenge

In the project `music_library_database_app`.

Test-drive and implement a form page to add a new artist.

You should then be able to use the form in your web browser to add a new artist, and see this new artist in the artists list page.


[Next Challenge](05_debugging.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F04_using_forms.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
