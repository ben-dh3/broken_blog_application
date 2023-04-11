# Request parameters

Learn to send `GET` and `POST` HTTP requests with parameters using a graphical
interface.

<!-- OMITTED -->

## Postman

In this section you'll learn how to use Postman, which is also a **client** like
`curl`, but with a graphical interface, which is a bit easier to use and
configure.

[Go to this page to install Postman on your
machine.](https://www.postman.com/downloads/)

Drag the Postman program in your Applications directory if you're on Mac, or
follow the installation instructions if you have a different system.

On the first launch, Postman should welcome you with the following screen.

![](../resources/postman-1.png)

Like `curl`, we can use Postman to send HTTP requests to web servers, and
inspect the responses we receive.

Click on the `+` icon next to the "Overview" tab to open a new tab.

There are quite a few different options to configure the request we want to
send, but the more important part (circled in red on the screenshot below) is
where you set the **request method** and the **URL**.

![](../resources/postman-2.png)

Leave the method set to `GET` and paste the URL
`https://jsonplaceholder.typicode.com/todos/1`, then click the "Send" button.

You should get the JSON response in the bottom panel of the program:

![](../resources/postman-3.png)

We can see two important things about the response:
* its content (the JSON data).
* its status code (`200 OK` - on the top-right corner of the panel).

In the following exercises, you'll practice by sending requests to the Postman
Echo website, which returns some pre-defined responses to some requests. You'll
learn about some components of GET and POST requests.

## Request Parameters

* The `GET` method is often used to _query or retrieve_ information from the
  server. The exact data returned depends of the implementation of the web
  server.   

  A `GET` request can also contain _query parameters_, as part of the URL.

* The `POST` method is often used to _send_ data to the web server (usually to
  create or update data, or just send some information). What is done with this
  data depends of the implementation of the web server.  

  A `POST` request can also contain _body parameters_. Contrarily to _query_
  parameters, they are not included in the URL, but within the request body
  itself.

There are more HTTP methods, but we'll cover them a bit later.

## Demonstration

[Video demonstration](https://www.youtube.com/watch?v=zwU6SpTwuxY)

## Exercise One

Use Postman to send a `GET` request to the URL `https://postman-echo.com/get`.

In the "Query params" section, set a query parameter with key `title` and value
`'Welcome'`. Then send the request.

You should get the following JSON response, and the status code should be `200
OK`:

```json
{
    "args": {
        "title": "Welcome",
    },
    "headers": {
        // (omitted).
    },
    "url": "https://postman-echo.com/get?title=Welcome"
}
```

_You'll note that Postman automatically added the parameters at the end of the
URL, using a syntax such as `?title=Welcome` — this is the way query parameters
are sent in `GET` requests, inside the URL itself._

[Solution video](https://www.youtube.com/watch?v=zwU6SpTwuxY&t=420s)

## Exercise Two

Use Postman to send a `POST` request to the URL
`https://postman-echo.com/post`.In the "Body" tab below the URL field, select
the option "form-data", and set a parameter with key `title` and value
`'Welcome'`. Then send the request.

You should get the following JSON response, and the status code should be `200
OK`:

```json
{
    "args": {},
    "data": {},
    "files": {},
    "form": {
        "title": "Welcome"
    },
    "headers": {
        // (omitted).
    },
    "json": null,
    "url": "https://postman-echo.com/post"
}
```

[Solution video](https://www.youtube.com/watch?v=zwU6SpTwuxY&t=530s)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F03_request_parameters.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F03_request_parameters.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F03_request_parameters.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F03_request_parameters.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F03_request_parameters.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
