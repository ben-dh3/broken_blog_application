# Setting Up a Flask Project

_**This is a Makers Vine.** Vines are designed to gradually build up
sophisticated skills. They contain a mixture of text and video, and may contain
some challenge exercises without proposed solutions. [Read more about how to use
Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to set up a Python project with the Flask library.

<!-- OMITTED -->

## Video Version

[You can view a video version of setting up a Flask project here.](https://www.youtube.com/watch?v=72JwLuAyHyM)

The above video extends into a walkthrough of the starter codebase. Feel free to bookmark this for later.

Alternatively, read on below.

## Flask

[Flask](https://flask.palletsprojects.com/en/2.2.x/) is a Python library we use
to create web server programs using Python. We use Flask to configure which
requests our program can respond to and what logic needs to be done to respond
to those requests.

In the following exercises and challenges, you will learn how to build a web
server program that receives HTTP requests from a client (such as Postman), and
returns HTTP responses to it.

## Set up your project

You will need to set up a few projects over the course of this module. You will
use a starter project to do so. It contains some helpful utilities to get you
going.

The first one is called `hello_web_project`. [Set it up from the **new** starter
here.](https://github.com/makersacademy/web-applications-in-python-project-starter-plain)

The starter comes with some example code that covers much of what you will learn
in this module. You might find this useful, or potentially distracting. If you'd
like to refer to it you can leave it there and work around it. If you'd like a
clean slate, follow the instructions in the starter README to delete the example
code.

## Interacting with Flask

We've got two different ways to interact with the program:

* By running Pytest tests that will **simulate** HTTP requests and assert on
  responses.
* By running the web server as a background program, using `python app.py`,
  so we can manually send requests to it.

Launch your server program with the `python app.py` command from your
project directory:

```shell
; pipenv shell # Don't forget to activate the virtual environment!
; python app.py

  * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
  * Running on http://127.0.0.1:500
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 510-031-730

# This process will wait around for requests.
# This is good, keep going onto the next instruction.
# When you do want to stop it, hit ctrl+c
```

The web server program is now running "inside" this terminal. We also say that 
the program is _attached_ to the terminal. It will now run continuously, 
waiting to receive incoming HTTP requests.

If we close this terminal window, we will also terminate the server. A cleaner 
way of stopping the server is to use the keyboard shortcut `CTRL+C`.

Once the server is running, we can send HTTP requests to it using `curl`:

```shell
# Call one of the example routes, if you haven't deleted the example code!
; curl http://localhost:5000/emoji
```

`localhost` is the host name for your local machine, and `5000` is the network
port on which Flask is running.

<details>
  <summary>:speech_balloon: I've heard of `flask run` — why aren't we using that?</summary>

  ---

  We've set up the starter to run Flask in a special debugging mode.

  The main difference for our purposes is that Flask will automatically reload
  your code when you change it.
  
  If you notice you are making changes to your code, but they are not being
  reflected in the server, check you are running with `python app.py`.

  In the HTML starter, which you will use later, running Flask in this manner
  also has other benefits around being able to start the server in test mode.

  ---

</details>

<details>
  <summary>:confused: I see `Port 5000 is in use by another program.` — what's going on?</summary>

  ---

  You're probably running another Flask server somewhere. Try finding it and
  hitting `CTRL+C` to stop it.
  
  Try running `lsof -i :5000` to see what's using the port. If you see `python`
  or `flask` in the output, you can kill the process by finding the process ID
  under `PID` and running `kill -9 <PID>`.

  We would recommend not following the advice to disable Airplay Receiver. If
  you keep having trouble, contact your coach.

  ---

</details>

## Working Locally

Something to be mindful of: in real-word programs, the web server program will
usually be running on a remote machine, and you will access it through the
Internet (like you did in the previous exercises, with `curl` and Postman).

In the following challenges, you will _build_ such web server programs, which
means that while you're building it, it will run on your machine. This is called
working "locally", on a "local server", or "local setup", as opposed to the
program being deployed in production, to real users.

It's therefore important not to forget this: **the web server programs you will
build this week are meant, in the end, to be run on remote machines, and
interacted with through HTTP requests and responses**. Later on in the course,
you will learn how to deploy your web server on a remote machine, which is
closer to how things work in the "real world".


[Next Challenge](02_building_a_route.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F01_setting_up_flask_project.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
