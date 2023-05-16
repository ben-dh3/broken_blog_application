# Introduction to HTTP

_**This is a Makers Bite.** Bites are designed to train specific skills or
tools. They contain an intro, a demonstration video, some exercises with an
example solution video, and a challenge without a solution video for you to test
your learning. [Read more about how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to explain the basics of how HTTP works.

## Introduction

[Here's an introduction video.](https://www.youtube.com/watch?v=KBLWw-0HbpU)

## Clients and Servers

So far you've been building programs than run on a single machine — yours.
However to deploy applications to users, we need a way for them to access and
interact with the program.

They could download and run the program themselves. But a better way is to run
the program on a machine, and allow users to access it through their Internet
connection. These are the basics of how the Web works.

The "central" machine where the program runs (usually alongside a database
software) is called the **server**. The machine and software used by users to
interact with the program is called the **client**.

In the most simple situations, there is one **server** but many different
**clients** can connect to it.

![](../resources/client-server.png)

Something to be aware of: the term "client" can reference slightly different
things depending on the context — it can be the machine itself, or the software
program used (usually a web browser, such as Firefox or Chrome). The term
"server" can also be ambiguous and refer to either the machine or the software
program running the program and responding to clients.

In this module, "web server" will usually refer to a (Python) program that
receives requests and sends back responses, and "client" will refer to either
Postman, a web browser or `curl`.

## HTTP

Web clients and servers need to communicate through the network. They use a
special language called **HTTP** (Hypertext Transfer Protocol).

As web application developers, you'll almost never have to write any HTTP
directly, but it's still important to understand the basics of how it works to
effectively build and debug web applications. You'll learn more about HTTP in
the following sections.

At a high-level, when a client needs to interact with the program, it sends a
**request** to the server through the Internet. When the server program receives
this request, it does some work, perhaps communicates with a database behind the
scenes, and then sends back a **response** to the client.

This process is repeated as many times needed, depending on what the application
does. Here is an example of a typical HTTP request-response flow for a news
website:

1. The client (a web browser) sends a request to _get all latest articles_.
2. The server (a program, written in Python or something else) receives the
   request.
3. The server retrieves the articles from the database and sends back a response
   containing the articles' data.
4. The client receives the response and displays the list of articles. (_end of
the first request-response cycle_)
5. The client sends a request to _get a specific article_.
6. The server receives the request.
7. The server retrieves this specific article from the database and sends back a
   response containing that article's data.
8. The client receives the response and displays that article's content.

You can notice that there are some similarities with the type of operations you
implemented when working with databases — the client can request _all_ articles,
_one_ specific article... and we could probably imagine other operations.

Most web applications you will work on and use will be CRUD applications.

## Using `curl` to send a request

We can use a small command line utility called `curl` — you can install it on
Mac with Homebrew:

```shell
; brew install curl
```

The `curl` program is itself an HTTP client — it can send a request to a server
and receive a response. The only required argument to the command is where to
send the request — the URL.

```shell
; curl https://jsonplaceholder.typicode.com/todos/1
```

After running that, you should get the following output:

```json
{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
```


[Next Challenge](02_requests_and_responses.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F01_intro_to_http.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F01_intro_to_http.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F01_intro_to_http.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F01_intro_to_http.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=http_bites%2F01_intro_to_http.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
