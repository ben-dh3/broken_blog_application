# Just enough Jinja Templates

This guidance contains "just enough" Jinja syntax for you to use in your Jinja web responses.

To go further than this, refer to the [Jinja Template Designer
Documentation](https://jinja.palletsprojects.com/en/3.1.x/templates/).

## On Jinja Templates

Remember that the job of a Jinja Template file should be only to use Python variables to generate a meaningful HTML page that will be sent to a web client.

You _should not_ assign new variables, or call methods that change the state of the program within your Jinja Template files.

You should only use it to:
  * display values of variables
  * loop through an array of values (to display some HTML for each item)
  * or use conditions to display different bits of HTML depending on the context

## Interpolating variables

```jinja
<p>
  {{ name }}
</p>
```

## Conditions

We can use `if`, `elif` and `else` in Jinja tags.

We can then "mix and match" HTML and Jinja tags within each conditional "branch".

```jinja
<div>
  {% if posts | length > 0 %}
    <p>There are {{ posts | length }} posts on this website.</p>
  {% else %}
    <p>No posts yet!</p>
  {% endif %}
</div>
```

Note that there are a few differences here from Python:

* Instead of using `len`, we use the `|` (pipe) to send our `posts` variable to
  what Jinja calls a "filter". The `length` filter is one of the built-in
  filters that Jinja provides.
* Instead of indentation ending our if block, we use the `endif` tag.

## Loops

To loop through list of elements, we can use `for` in a similar way as "regular" Python.

We can then "mix and match" HTML and Jinja tags within the loop iterator block.

```jinja
<div>
  {% for post in posts %}
    <p>
      {{ post.title }}
      {{ post.author_name }}
    </p>
  {% endfor %}
</div>
```

## More Jinja

If you'd like to learn more about the features of Jinja, [the official
documentation for template authors is a valuable
resource.](https://jinja.palletsprojects.com/en/3.1.x/templates/)


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_jinja_templates.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_jinja_templates.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_jinja_templates.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_jinja_templates.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_jinja_templates.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
