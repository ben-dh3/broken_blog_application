# Setting Up a Flask Project

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to setup a Python project with the Flask library.

<!-- OMITTED -->

## Flask

[Flask](https://flask.palletsprojects.com/en/2.2.x/) is a small Python library we use to create web server programs using Python. We use Flask to configure which requests our program can respond to, and what logic needs to be done to respond to those requests.

In the following exercises and challenges, you will learn how to build a web server program that receives HTTP requests from a client (such as Postman), and returns HTTP responses to it.

## Demonstration

[Video demonstration](https://www.youtube.com/watch?v=1j0PS6e0CZk) <!-- OMITTED -->

## Setting up

[Follow this guidance](../pills/setting_up_flask_project.md) to setup a new project directory `hello_web_project` with Pytest and Flask.

We've got two different ways to interact with the program:

* By running Pytest tests that will simulate HTTP requests and assert on responses.
* By running the web server as a background program, using `flask --debug run`, so we can manually send requests to it.

Launch your server program with the `flask --debug run` command from your project directory:

```shell
; flask --debug run

  * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
  * Running on http://127.0.0.1:500
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 510-031-730
```

We can now send HTTP requests using `curl`:

```shell
; curl http://localhost:5000/test_route
```

`localhost` is the host name for your local machine, and `5000` is the network port on which Flask is running.

<details>
  <summary>:speech_balloon: What is that `--debug` about?</summary>

  ---

  The `--debug` flag tells Flask to run in a special debug mode.

  The main difference for our purposes is that Flask will automatically reload your code when you change it.
  
  If you notice you are making changes to your code, but they are not being reflected in the server, check you are running with `flask --debug run`.

  ---

</details>

## Working Locally

Something to be mindful of: in real-word programs, the web server program will usually be running on a remote machine, and you will access it through the Internet (like you did in the previous exercises, with `curl` and Postman).

In the following challenges, you will _build_ such web server programs, which means that while you're building it, it will run on your machine. This is called working "locally", on a "local server", or "local setup", as opposed to the program being deployed in production, to real users.

It's therefore important not to forget this: **the web server programs you will build this week are meant, in the end, to be run on remote machines, and interacted with through HTTP requests and responses**. Later on in the course, you will learn how to deploy your web server on a remote machine, which is closer to how things work in the "real world".


[Next Challenge](02_building_a_route.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
