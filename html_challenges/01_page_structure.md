# HTML Responses

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

We don't want to put HTML code in the middle of our Sinatra application class. That's because we want to keep these two concerns separated - the program logic (in Ruby files) and the response content (the HTML code which will be sent to the browser).

To avoid putting HTML code in our app file, we write the HTML in a separate file, also called a _view file_.

This file is in a `views/` directory and has a `.erb` extension. We'll see later why.

```
app.rb
lib/
  ...
views/
  index.erb
```

```ruby
# file: app.rb
require 'sinatra/base'

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # The erb method takes the view file name (as a Ruby symbol)
    # and reads its content so it can be sent 
    # in the response.
    return erb(:index)
  end
end
```

```html
<!-- file: views/index.erb -->

<html>
  <head></head>
  <body>
    <h1>Welcome to my page</h1>
  </body>
</html>
```

## Testing for HTML content

We test HTML responses the same way we would for regular text responses - we can also use the `include` matcher to only assert a specific piece of HTML is present in the content.  

```ruby
context "GET to /" do
  it 'contains a h1 title' do
    response = get('/')

    expect(response.body).to include('<h1>Hello</h1>')
  end
  
  it 'contains a div' do
    response = get('/')

    expect(response.body).to include('<div>')
  end
end
```

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=R_8PnCQk1kw)

## Exercise

In the project `hello_web_project`.

Test-drive and update the `GET /hello` route so it returns the greeting message as an HTML page:

```html
<html>
  <head></head>
  <body>
    <h1>Hello!</h1>
  </body>
</html>
```

Then, make sure your server is running using `rackup` and use your web browser to access the page.


[Next Challenge](02_using_erb_dynamic_page.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F01_page_structure.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
