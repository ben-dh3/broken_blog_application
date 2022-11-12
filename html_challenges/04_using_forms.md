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

```ruby
get '/posts/new' do
  # This route doesn't do much,
  # it returns the view with the HTML form.
  return erb(:new_post)
end

post '/posts' do
  # Get request body parameters
  title = params[:title]
  content = params[:content]

  # Do something useful, like creating a post
  # in a database.
  new_post = Post.new
  new_post.title = title
  new_post.content = content
  PostRepository.new.create(new_post)

  # Return a view to confirm
  # the form submission or resource creation
  # to the user.
  return erb(:post_created)
end
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

Note that the values of the `name` attributes in the HTML form must match the parameters' names the Sinatra route expects — this is also called having a "contract" between the client (the web browser sending the form data) and the server (our Sinatra application, which is expecting some specific parameters).

A way of enforcing this contract, and avoiding the client to send wrong values, is to add some validation to the `POST` route — here's an example:

```ruby
# app.rb

post '/posts' do
  if invalid_request_parameters?
    # Set the response code
    # to 400 (Bad Request) - indicating
    # to the client it sent incorrect data
    # in the request.
    status 400

    return ''
  end

  # Parameters are valid,
  # the rest of the route can execute.
end

def invalid_request_parameters?
  params[:title] == nil || params[:content] == nil
end
```

## Test-driving a form

Since there are two routes, we need to test-drive these two routes. It's fine to test-drive them one by one.

```ruby
context "GET /posts/new" do
  it 'returns the form page' do
    response = get('/posts/new')

    expect(response.status).to eq(200)
    expect(response.body).to include('<h1>Add a post</h1>')

    # Assert we have the correct form tag with the action and method.
    expect(response.body).to include('<form action="/posts" method="POST">')

    # We can assert more things, like having
    # the right HTML form inputs, etc.
  end
end

context "POST /posts" do
  it 'returns a success page' do
    # We're now sending a POST request,
    # simulating the behaviour that the HTML form would have.
    response = post(
      '/posts',
      title: 'Welcome',
      content: 'I am a post'
    )

    expect(response.status).to eq(200)
    expect(response.body).to include('<p>Your post has been added!</p>')
  end

  it 'responds with 400 status if parameters are invalid' do
    # ...
  end
end
```

## On Route Priority

Remember that Sinatra uses the first route that matches a request. When creating a route such as `/albums/new`, a common problem you could run into would be to have another route `/albums/:id`, containing a dynamic path parameter, being used - as the parameter `:id` will "capture" the value `"new"` in the URL.

```ruby
# For a request with path `/albums/new`

# This route will be used - which is probably not what we want.
get '/albums/:id' do

end

# And this one is skipped
get '/albums/new' do 

end
```

An easy way to fix this is to define the routes in the reverse order - this way `/albums/new` will be used first, and then any request to a path such as `/albums/12` will get to the other route. Another way, a bit more complex, is [to configure the route parameter to match a certain format](http://sinatrarb.com/intro.html#:~:text=Route%20matching%20with%20Regular%20Expressions%3A), such as a numeric value.

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
