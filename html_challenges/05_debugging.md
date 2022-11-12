# Debugging Web Applications

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills.
They contain a mixture of text and video, and may contain some challenge exercises without
proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to use Discovery debugging for a web application.

## Unit or Integration tests

Remember that unit tests are testing the behaviour of a single class or method in
isolation of the rest. This means that unit tests are not concerned with HTTP requests and
responses.

Integration tests, on the other end, are testing the full behaviour, from the request to
the response, by acting as a web client.

 * If a unit test is failing, fix this first. It means the behaviour of a class or method
   is broken, regardless of the web application flow.
 * Then, if an integration test is failing, it probably means there is a bug somewhere
   else in the rest of the application — in the Sinatra route or the HTML view. Following
   the flow of the data from the client to and from the web server, by also running the
   server, will help to find out what's wrong.

## Getting Visibility

We can get visibility using different tools depending on the "layer":
  * In Sinatra routes or Ruby classes, we can use `p` to inspect the value of variables or
    log arbitrary messages. These will be displayed in the terminal, in the logs of the
    `rackup` command, which we use to run the web server.
  * In ERB / HTML views, we can use ERB tags to display the value of instance variables
    set inside the route block (e.g `<%= @something %>`) so it is displayed as part of the
    HTML page.
  * We can get visibility into the HTTP request and response — what data is flowing
    between the client (the web browser) and the server. We can use a client like Postman,
    or the [Browser Developer tools](../pills/use_the_developer_console.md).
  * We can also manually inspect the web page to see what is wrong, or check if Sinatra
    returns a helpful error message for us.

## Exercise

Debug the following web application.

Do the setup and run the server and tests:

```bash
cd web-applications/projects_to_debug/postcode_checker_app

bundle install

# Some tests are failing, you'll need to make them pass.
rspec

# In another terminal, to run the server.
rackup 
```

## Challenge

Debug the following web application.

Do the setup and run the server and tests:

```bash
cd web-applications/projects_to_debug/blog_app

bundle install

# Some tests are failing, you'll need to make them pass.
rspec

# In another terminal, to run the server.
rackup 
```


[Next Challenge](06_securing_user_input.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F05_debugging.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F05_debugging.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F05_debugging.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F05_debugging.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F05_debugging.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
