# Building a Route

_**This is a Makers Vine.** Vines are designed to gradually build up
sophisticated skills. They contain a mixture of text and video, and may contain
some challenge exercises without proposed solutions. [Read more about how to use
Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to build a route to respond to HTTP requests.

<!-- OMITTED -->

## Video Intro and Demonstration

[You can view a video version of the below content here.](https://www.youtube.com/watch?v=xBz6_cRfr78&t=0s). Otherwise, read on below.

## Routing

Remember that a web server receives HTTP requests, executes some code depending
on the received request, and returns a response.

To decide on what code to execute depending on the request, internally Flask
keeps a "routing" table, which associates a given request **method and path** to
a block of Python code:

| HTTP Method | Path | Python code                        |
| ----------- | ---- | ---------------------------------- |
| GET         | /    | `# some code to execute`           |
| POST        | /    | `# some different code to execute` |

<details>
  <summary>:speech_balloon: Are these like methods in Python classes?</summary>

  ---

  No. These are a different kind of method — a HTTP method.

  Each HTTP request comes with a label called a method which tells the server
  what kind of request it is. Common methods are GET (usually used to retrieve
  data) and POST (usually used to send data).

  ---

</details>

Different requests will execute different code in our Flask application, and
lead to different responses being sent back.

Here is an example of a minimal Flask application, configuring a single
**route**:

```python
# file: app.py
from flask import Flask

app = Flask(__name__)

# Declares a route that listens for a GET request to the path /
@app.route('/', methods=['GET'])
def index():
    # The code here is executed when a request is received and we need to 
    # send a response. 

    # We can return a string which will be used as the response content.
    # Unless specified, the response status code will be 200 (OK).
    return 'Some response data'
```

The Python function associated with a HTTP method and path is called a "route".
The code in this block is executed _only_ if the received request matches the
HTTP method and path.

When Flask receives a request, it looks through all the route blocks configured
in that class, and executes the code of the first one matching the request.

```python
from flask import Flask

app = Flask(__name__)

# Let's look at an example where Flask receives this request:
# > GET /

# There are a number of routes. We'll look through each one in turn and see if
# it matches.

@app.route('/', methods=['POST'])
def post_index():
    # DOES NOT RUN: The HTTP method (GET) doesn't match the route's (POST)
    return "Not me! :("

@app.route('/hello', methods=['GET'])
def get_hello():
    # DOES NOT RUN: The path (`/hello`) doesn't match the route's (`/`)
    return "Not me either!"

@app.route('/', methods=['GET'])
def get_index():
    # RUNS: This route matches! The code inside the block will be executed now.
    return "I am the chosen one!"

@app.route('/', methods=['GET'])
def other_get_index():
    # DOES NOT RUN: This route also matches, but will not be executed.
    # Only the first matching route (above) will run.
    return "It isn't me, the other route stole the show"
```

_In the following sections, we will use the shorthand notation `GET /some_path`
to designate a route which responds to `GET` requests to the path `/some_path`._

## Accessing GET request query parameters

We can use the `request.args` dictionary inside a route block to access the
request _query parameters._

If a client sends a request with a query parameter with key `name` and value
`David`, this parameter will be present in the `request.args` dictionary, and we
can access the value like this:

```python
from flask import Flask, request # NOTE: we must import `request` too

app = Flask(__name__)

# Request:
# GET /hello?name=David

@app.route('/hello', methods=['GET'])
def hello():
    name = request.args['name'] # The value is 'David'

    # Send back a friendly greeting with the name
    return f"Hello {name}!"

# To make a request, run:
# curl "http://localhost:5000/hello?name=David"
```

<details>
  <summary>:confused: I get `zsh: no matches found` when I run that curl command</summary>

  ---

  For the terminal, `?` is a special character. If you see this error it is
  probably because you haven't quoted the URL like this:

  ```shell
  ; curl "http://localhost:5000/hello?name=David"
  ```

  The quotes tell the terminal, "No, really, I mean a literal question mark!"

  ---

</details>

## Accessing POST request body parameters

We can also send POST requests with data. This time, we're choosing to send data
using _body parameters_. However, to retrieve this data, we must use the
`request.form` dictionary instead of `request.args` (which we used for query
parameters).

```python
from flask import Flask, request # Remember to import `request`

app = Flask(__name__)

# Request:
# POST /goodbye
#   With body parameter: name=Alice

@app.route('/goodbye', methods=['POST'])
def goodbye():
    name = request.form['name'] # The value is 'Alice'

    # Send back a fond farewell with the name
    return f"Goodbye {name}!"

```

You won't be able to visit that last request using the browser's address bar as
body parameters don't go in the URL!

Try sending a POST request with the right data using Postman. You could also use
the `curl` command line tool, like this:

```shell
; curl -X POST -d "name=Alice" http://localhost:5000/goodbye
Goodbye Alice!
```

## Requests with more than one parameter

Whether you're using query parameters or body parameters (or both!) sometimes
you'll want to send more than one parameter at a time. The important bit of
syntax to know is to separate parameter key-value pairs with `&`.

Let's look at query parameters first, as this applies to both Postman and
`curl`. Say you had a path `/introduction` and the route accepted two query
parameters of `name` and `meet`. Here's how a request URL with those might look:

```
/introduction?name=David&meet=Alice
```

You could imagine that route returning something like "Hi David! I'd like to
introduce you to Alice".

Body parameters in cURL are handled very similarly. If we keep our same example,
but switch from query parameters to body parameters (and so we'll use a POST
request), our `curl` request would look like this:

```
; curl -X POST -d "name=David&meet=Alice" http://localhost:5000/introduction
```

Body parameters in Postman don't need you to define any `&` syntax - you can add
multiple keys to the Body tab, under the option "form-data" which you used
earlier.

## Exercise

Work through the following in `app.py` in your `hello_web_project` project.

Create a new route that responds to requests sent with:
  * A method `POST`
  * A path `/submit`
  * Body parameters `name` and `message`

Here's the expected behaviour of this route:

```
# Request:
POST /submit

# With body parameters:
name=Leo
message=Hello world

# Expected response (2OO OK):
Thanks Leo, you sent this message: "Hello world"
```

Make sure your server is running — then, using `curl` and Postman, check the
route is working.

[Example Solution](https://www.youtube.com/watch?v=xBz6_cRfr78&t=1020s)

## Challenge

Work through the following in `app.py` your `hello_web_project` project.

Create a new route that responds to requests sent with:
  * A method `GET`
  * A path `/wave`
  * A query parameter `name`

It should return the text `'I am waving at [NAME]'`, where `[NAME]` is replaced
by the value of the `name` _query parameter_.

```
# Request:
GET /wave?name=Leo

# Expected response (200 OK):
I am waving at Leo
```

Make sure your server is running — then, using `curl` and Postman, check the
route is working.


[Next Challenge](03_test_driving_a_route.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F02_building_a_route.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F02_building_a_route.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F02_building_a_route.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F02_building_a_route.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F02_building_a_route.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
