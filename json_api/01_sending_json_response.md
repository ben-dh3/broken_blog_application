# Sending a JSON Response

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills.
They contain a mixture of text and video, and may contain some challenge exercises without
proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to send a response containing structured JSON data.

## About JSON

HTML code is meant to be read by a web browser to create a web page. However, some web clients, such as mobile applications, or smart objects, do not need HTML code to display a web page. Instead, they _only need the data_, and then decide to display it or use it the way they need.

The JSON format is used to structure data, and it is widely used on the web.

The way the data is formatted is similar to Ruby hashes. Below are some examples of JSON
data.

```json
// A JSON "object" containing a single key-value property.
{
  "name": "David"
}

// A JSON "object" containing a many key-value properties.
{
  "name": "David",
  "age": 34,
  "address": "30, Bristol Street"
}

// A JSON "array" containg different string values.
[
  "David",
  "Anna",
  "Mary"
]
```

In Ruby, we can use the `json` gem (which is included in Ruby — no need to download it)
which adds the `.to_json` method to convert Ruby data structures (such as arrays and
hashes) to JSON format.

```ruby
require 'json'

some_hash = { name: 'David', age: 34 }
some_hash.to_json # => "{\"name\":\"David\",\"age\":34}"

some_array = [1, 3, 5]
some_array.to_json # => "[1,3,5]"
```


## Returning JSON

Here is how we can send back JSON data in a Sinatra route:

```ruby
# We need to require 'json' at the top of the file.
require 'json'

# ...

get '/hello' do
  # 1. Specify the response content type
  content_type :json

  # 2. Returning a data hash as JSON
  response_data = { name: "David" }

  return response_data.to_json 
end
```

## Transforming a Model class to JSON

Ruby "knows" how to transform arrays, hashes and simpler values into JSON. However, it
doesn't know how to transform our custom Model objects (such as an `Album` or `Student`
object) into JSON. We need to do a bit more work and implement the `to_json` method for
this:

```ruby
class Album
  attr_accessor :id, :title, :release_year

  def to_json(_options)
    album_data = {
      id: @id,
      title: @title,
      release_year: @release_year
    }

    return album_data.to_json
  end
end
```

We can call the `.to_json` method on either Hashes or Arrays, to convert them to JSON when
returning the response.

## Exercise

_Work in the same project directory `hello_web_project` for the following exercises._

Update the test and implementation code of the route `GET /names` so it returns a _JSON
array_ of the list of names.
```
# Request:
# GET /names

# Response: 200 OK
# With JSON:

["Julia", "Mary", "Karim"]
```

## Challenge

Test-drive and implement the following route:

```
# Request:
# GET /posts

# Response: 200 OK
# With JSON:

[
  {
    "title": "A first post",
    "content": "Some boring content"
  },
  {
    "title": "A second post",
    "content": "Something else"
  }
]
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=json_api%2F01_sending_json_response.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=json_api%2F01_sending_json_response.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=json_api%2F01_sending_json_response.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=json_api%2F01_sending_json_response.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=json_api%2F01_sending_json_response.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
