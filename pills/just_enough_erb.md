# Just enough ERB

This guidance contains "just enough" ERB syntax for you to use in your ERB web responses.

## On ERB

Remember that the job of a ERB view file should be only to use Ruby variables to generate a meaningful HTML page that will be sent to a web client.

You _should not_ assign new variables, or call methods that change the state of the program within your ERB files.

You should only use it to:
  * display values of variables
  * loop through an array of values (to display some HTML for each item)
  * or use conditions to display different bits of HTML depending on the context

## Interpolating variables

```erb
<p>
  <%= @name %=>
</p>
```

## Conditions

We can use `if`, `elsif` and `else` in ERB tags. 

We can then "mix and match" HTML and ERB tags within each conditional "branch".

```erb
<div>
  <% if @posts.length > 0 %>
    <p>There are <%= @posts.length %> posts on this website.</p>
  <% else %>
    <p>No posts yet!</p>
  <% end %>
</div>
```

## Loops

To loop through list of elements, we can use `.each` in a similar way as "regular" Ruby.

We can then "mix and match" HTML and ERB tags within the loop iterator block. 

```erb
<div>
  <% @posts.each do |post| %>
    <p>
      <%= post.title %>
      <%= post.author_name %>
    </p>
  <% end %>
</div>
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_erb.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_erb.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_erb.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_erb.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_erb.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
