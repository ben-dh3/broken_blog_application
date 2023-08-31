# Requests and Responses

_**This is a Makers Bite.** Bites are designed to train specific skills or
tools. They contain an intro, a demonstration video, some exercises with an
example solution video, and a challenge without a solution video for you to test
your learning. [Read more about how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to send HTTP requests to a web server with `curl`.

## Request

An HTTP request is essentially defined by:
  * its **method** (also called "verb")
  * its **path** - is all that follows the first `/` of the URL.
  * its **parameters** (or request data)

A web server only responds to a list of requests with specific methods and
paths. The developer of the web server program needs to explicitly configure
this in their code.

If the web server is not configured to handle a request with a given method and
path, it will usually return an error indicating this request cannot be handled.

Once the server receives the request, it does some work (and usually interacts
with the database), and sends back a response.

## Response

The HTTP response sent back to the client is essentially defined by:
  * its **status code** indicating the result of the operation (status or
    failure).
  * its **body** (or content)

The web server decides which status code to assign to the response, as a way of
communicating to the client whether everything is fine (e.g. `200` "OK"), or if
something went wrong. [A lot of different status
codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) exist for
different situations. A famous one you probably already know of is `404` ("Not
Found"), used by the server to indicate that the server cannot find the resource
specified in the request's path.

## Using `curl`

By default, `curl` sends a request with a `GET` method. We can use the `-X`
option to change this:

```bash
# Sends a request with a POST method.

curl -X POST https://jsonplaceholder.typicode.com/todos/1
```

Here's a breakdown of the request sent by the command above:
  * The first part of the URL, `https://jsonplaceholder.typicode.com`, is called
    the **host**. It is the address of the server itself.
  * The **path** of the request is `/todos/1`
  * The **method** is `POST` - you will learn more about HTTP methods in the
    next section, but for now remember the two most important are `GET` and
    `POST`.

It's common for these sorts of requests to be called a "GET request" or "POST
request".

## Demonstration

[Video demonstration](https://www.youtube.com/watch?v=KBLWw-0HbpU&t=646s)

## Exercise

Use `curl` to send the following HTTP request:
  * Host: `https://jsonplaceholder.typicode.com`
  * Method: `GET`
  * Path: `/todos/12`

You should get the following response body:
```
{
  "userId": 1,
  "id": 12,
  "title": "ipsa repellendus fugit nisi",
  "completed": true
}
```

## Challenge

Use `curl` to send the following HTTP request:
  * Host: `https://jsonplaceholder.typicode.com`
  * Method: `POST`
  * Path: `/todos`

You should get the following response body:
```
{
  "id": 201
}
```


[Next Challenge](03_request_parameters.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F02_requests_and_responses.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F02_requests_and_responses.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F02_requests_and_responses.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F02_requests_and_responses.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F02_requests_and_responses.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
