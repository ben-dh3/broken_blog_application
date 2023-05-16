# Test-driving a Route

_**This is a Makers Vine.** Vines are designed to gradually build up
sophisticated skills. They contain a mixture of text and video, and may contain
some challenge exercises without proposed solutions. [Read more about how to use
Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to write integration tests for your route using Pytest.

## Video Intro and Demonstration

[You can view a video version of the below content here.](https://www.youtube.com/watch?v=xBz6_cRfr78&t=1171s). Otherwise, read on below.

## Testing Routes with Pytest

We can create integration tests for our routes using Pytest. Here's an example:

```python
# File: tests/test_app.py

# Note: you will need to do this in the starter codebase.

"""
When: I make a GET request to /
Then: I should get a 200 response
"""
def test_get_wave(web_client):
    # We'll simulate sending a GET request to /wave?name=Dana
    # This returns a response object we can test against.
    response = web_client.get('/wave?name=Dana')

    # Assert that the status code was 200 (OK)
    assert response.status_code == 200

    # Assert that the data returned was the right string
    assert response.data.decode('utf-8') == 'I am waving at Dana'

"""
When: I make a POST request to /submit
And: I send a name and message as body parameters
Then: I should get a 200 response with the right content
"""
def test_post_submit(web_client):
    # We'll simulate sending a POST request to /submit with a name and message
    # This returns a response object we can test against.
    response = web_client.post('/submit', data={'name': 'Dana', 'message': 'Hello'})

    # Assert that the status code was 200 (OK)
    assert response.status_code == 200

    # Assert that the data returned was the right string
    assert response.data.decode('utf-8') == 'Thanks Dana, you sent this message: "Hello"'

# To run these tests:
# ; pipenv shell
# ; pytest tests/test_app.py
```

> **Note**: Pytest is clever and is only **simulating** sending HTTP requests.
> If you want to prove it, stop your server (`CTRL+C`) and run the tests. But
> don't forget to start your server again afterwards!

<details>
  <summary>:speech_balloon: What is this `.decode('utf-8')` thing?</summary>

  ---

  An HTTP server might send all kinds of things back in a response. We're sending
  text, but it might also send an image, a video file, or your favourite music
  track!

  This `decode('utf-8')` call decodes the response data as what we know it is —
  a string. UTF-8 is a way that string data is represented in a computer.

  ---

</details>

<details>
  <summary>:confused: I see `fixture 'web_client' not found`</summary>

  ---

  Are you running these tests in the `hello_web_project` project? If not, you
  will need to be. Contact your coach if you still see this error.

  ---

</details>

_In the following exercises, we will use the shorthand notation `GET /some_path`
(or `POST /some_path`) to designate a route which responds to HTTP `GET`
requests to the path `/some_path`._

## Exercise One

_Work in the same project directory `hello_web_project` for the following
exercises._

Add these tests to `tests/test_app.py` and use them to test-drive the
implementation of a `POST /count_vowels` route.

```python
# File: tests/test_app.py

"""
When: I make a POST request to /count_vowels
And: I send "eee" as the body parameter text
Then: I should get a 200 response with 3 in the message
"""
def test_post_count_vowels_eee(web_client):
    response = web_client.post('/count_vowels', data={'text': 'eee'})
    assert response.status_code == 200
    assert response.data.decode('utf-8') == 'There are 3 vowels in "eee"'

"""
When: I make a POST request to /count_vowels
And: I send "eunoia" as the body parameter text
Then: I should get a 200 response with 5 in the message
"""
def test_post_count_vowels_eunoia(web_client):
    response = web_client.post('/count_vowels', data={'text': 'eunoia'})
    assert response.status_code == 200
    assert response.data.decode('utf-8') == 'There are 5 vowels in "eunoia"'

"""
When: I make a POST request to /count_vowels
And: I send "mercurial" as the body parameter text
Then: I should get a 200 response with 4 in the message
"""
def test_post_count_vowels_mercurial(web_client):
    response = web_client.post('/count_vowels', data={'text': 'mercurial'})
    assert response.status_code == 200
    assert response.data.decode('utf-8') == 'There are 4 vowels in "mercurial"'
```

[Example Solution](https://www.youtube.com/watch?v=xBz6_cRfr78&t=1778s)

## Exercise Two

Use [this Design Recipe](../resources/plain_route_recipe_template.md) to
test-drive a new route `POST /sort-names` which receives a list of names (as a
comma-separated string) and return the same list, sorted in alphabetical order.

Here's a description of the expected behaviour:

```
# Request:
POST http://localhost:5000/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
```

[Example Solution](https://www.youtube.com/watch?v=xBz6_cRfr78&t=2051s)

<details>
  <summary>:confused: What do you mean a 'list of names', that's a string with commas in it!</summary>

  ---

  Well spotted. HTTP requests transfer everything as strings, both requests
  and responses, so cannot transmit lists or other data structures directly.
  
  Here we've used commas to represent a list of items. You'll need to take the
  string `"Joe,Alice,Zoe,Julia,Kieran"` and somehow transform it into a Python
  list. You'll also need to do the reverse to transmit it back in the response.

  In industry, there are various standardised formats to represent lists and
  dictionaries as strings. One is called JSON, which you may want to research
  if you are interested.

  ---

</details>

## Challenge

This is a process feedback challenge. That means you should record yourself
doing it and submit that recording to your coach for feedback. [How do I do
this?](https://github.com/makersacademy/golden-square-in-python/blob/main/pills/process_feedback_challenges.md)

Use the Design Recipe to test-drive the following route:

```
# Request:
GET /names?add=Eddie

# This route should return a list of pre-defined names, plus the name given.

# Expected response (2OO OK):
Julia, Alice, Karim, Eddie
```

You should assert that the response status code is `200` and that the response
body is the correct string.

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

[After you're done, submit your recording
here](https://airtable.com/shrNFgNkPWr3d63Db?prefill_Item=webpy_as01).



[Next Challenge](04_test_driving_route_with_database.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
