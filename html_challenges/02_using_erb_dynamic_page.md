# HTML and ERB Responses

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to use Embedded Ruby (ERB) syntax to dynamically generate HTML responses. 

## Intro

The HTML content we put in views is static by default.

We can use ERB (for Embedded Ruby) syntax to generate dynamically the HTML that is sent to the client, by replacing the dynamic parts of the HTML, which are delimited by ERB tags (in between `<%=` and `%>`).

The following example shows how a variable `@name` can be used to change the view HTML content:

```ruby
# file: app.rb
require 'sinatra/base'

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do
    # Set an instance variable in the route block.
    @name = params[:name]

    # The process is then the following:
    #
    # 1. Ruby reads the .erb view file
    # 2. It looks for any ERB tags and replaces it by their final value
    # 3. The final generated HTML is sent in the response

    return erb(:index)
  end
end
```

The value of the instance variable is then accessible in the `view` file:

```erb
<!-- file: views/index.erb -->
<html>
  <head></head>
  <body>
    <!-- the ERB tag below will be replaced by the value of @name -->
    <h1>Hello <%= @name %>!</h1>
  </body>
</html>
```

[Use this guidance as reference material on ERB syntax](../pills/just_enough_erb.md) for the following challenges.

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=R_8PnCQk1kw&t=710s)

## Exercise

In the project `music_library_database_app`.

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

[Example solution](https://www.youtube.com/watch?v=R_8PnCQk1kw&t=1560s)

## Challenge

In the project `music_library_database_app`.

Test-drive and update the `GET /albums` route so it returns the list of albums as an HTML page:

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

_(Don't forget to run the app using `rackup`)._

Use your web browser to access the page.


[Next Challenge](03_using_links.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_erb_dynamic_page.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_erb_dynamic_page.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_erb_dynamic_page.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_erb_dynamic_page.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F02_using_erb_dynamic_page.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
