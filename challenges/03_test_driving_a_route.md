# Test-driving a Route

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to write integration tests for your route using Pytest.

## Testing Routes with Pytest

We can create integration tests for our routes using Pytest. Here's an example:

```python
# file: tests/test_app.py

import pytest
from app import app

# We need to create a client that we can use to send test requests
# This code does that, and makes it available as an argument to our test methods
# You don't need to understand it in depth.
@pytest.fixture
def client():
    app.config['TESTING'] = True # This gets us better errors
    with app.test_client() as client:
        yield client

"""
When: I make a GET request to /
Then: I should get a 200 response
"""
def test_get_wave(client):
    # We'll send a GET request to /wave?name=Dana
    # This returns a response object we can test against.
    response = client.get('/wave?name=Dana')

    # Assert that the status code was 200 (OK)
    assert response.status_code == 200

    # Assert that the data returned was the right string
    assert response.data.decode('utf-8') == 'I am waving at Dana'

"""
When: I make a POST request to /submit
And: I send a name and message as body parameters
Then: I should get a 200 response with the right content
"""
def test_post_submit(client):
    # We'll send a POST request to /submit with a name and message
    # This returns a response object we can test against.
    response = client.post('/submit', data={'name': 'Dana', 'message': 'Hello'})

    # Assert that the status code was 200 (OK)
    assert response.status_code == 200

    # Assert that the data returned was the right string
    assert response.data.decode('utf-8') == 'Thanks Dana, you sent this message: "Hello"'
```

<details>
    <summary>:speech_balloon: What is this `.decode('utf-8')` thing?</summary>

    ---

    A HTTP server might send all kinds of things back in a response. We're sending text, but it might also send an image, a video file, or your favourite music track!

    This `decode('utf-8')` call decodes the response data as what we know it is — a string. UTF-8 is a way that string data is represented in a computer.

    ---

</details>

_In the following exercises, we will use the shorthand notation `GET /some_path` (or `POST /some_path`) to designate a route which responds to `GET` HTTP requests to the path `/some_path`._

## Design Recipe

We'll use [this Design recipe](../resources/flask_route_design_recipe_template.md) to support the process of design and test-driving of routes.

## Demonstration

[Video demonstration](https://www.youtube.com/watch?v=NwKBtzkZrJo) /** @TODO Video **

## Exercise

_Work in the same project directory `hello_web_project` for the following exercises._


Test-drive a new route `POST /sort-names` which receives a list of names (as a comma-separated string) and return the same list, sorted in alphabetical order.

Here's a description of the expected behaviour:

```
# Request:
POST http://localhost:5000/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
```

## Challenge

This is a process feedback challenge. That means you should record yourself doing it and
submit that recording to your coach for feedback. [How do I do
this?](https://github.com/makersacademy/golden-square-in-python/blob/main/pills/process_feedback_challenges.md)

Use the Design recipe to test-drive the following route:

```
# Request:
GET /names?add=Eddie

# This route should return a list of pre-defined names, plus the name given.

# Expected response (2OO OK):
Julia, Alice, Karim, Eddie
```

You should assert that the response status code is `200` and that the response body is the correct string.

<details>
  <summary>:magnet: I want an extra challenge.</summary>

  ---

  For an extra challenge, add multiple names and sort them alphabetically.

  ```
  # Request:
  GET /names?add=Eddie,Leo

  # Expected response (2OO OK):
  Alice, Eddie, Julia, Karim, Leo
  ```

  ---
</details>


[After you're done, submit your recording here](https://airtable.com/shrNFgNkPWr3d63Db?prefill_Item=web_as01).



[Next Challenge](04_test_driving_route_with_database.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
