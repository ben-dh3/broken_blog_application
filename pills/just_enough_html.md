# Just enough HTML

This guidance contains "just enough" HTML for you to use in your HTML web responses.

## Tags and attributes

An HTML document (or page) is made of _nodes_, or elements. An element is delimited by an _opening tag_ and a _closing tag_.

Here are some examples of elements, both with their starting and closing tags:

```html
<p>
  A paragraph
</p>

<div>
  A block of content
</div>

<!-- And this is a HTML comment -->
```

An HTML opening tag can have _attributes_, using the following syntax:
```html
<h1>
  A heading (main) title
</h1>

<h2>
  A smaller heading title
</h2>

<p id="my-id">
  A paragraph
</p>

<div id="my-div" class="container">
  A block of content
</div>

<!-- An image (the src attribute is the image URL) -->
<img
  src="https://media.istockphoto.com/photos/closeup-portrait-of-funny-ginger-cat-wearing-sunglasses-isolated-on-picture-id1188445864?k=20&m=1188445864&s=612x612&w=0&h=0vuJeOxJr8Lu3Q1VdT1z7t6HcM8Oj7EVJe3CexGnH_8="
></img>
```

## Basic page structure

Below is a basic HTML structure you can use for your HTML views:

```html
<html>
  <head>
    <title>This will be displayed in the browser window or tab title</title>
  </head>
  <body>
    <h1>Welcome to my page</h1>
  </body>
</html>
```

The `<body>` section is what is displayed to users in the browser window when the HTML is received.

## Links

The `<a>` tag is used to create a _link_ to a _path_.

When the user clicks on that link, the browser will send a new `GET` HTTP request to that path (and always a `GET` request).

The attribute `href` is used to indicate the _path_ or the full URL. 
 * If a path such as `/hello` is the value of `href`, the browser will send a request to the same web server on that path:  
    ```html
      <a href="/hello">Go to the hello page</a>
    ```
 * If a "full" URL is the value of `href`, the browser will send a request to that server (for example, the user is on your website `https://makers-devs.com` and will be directed to `https://github.com`)
    ```html
    <a href="https://github.com">
      Go to Github (you'll leave this website!)
    </a>
    ```

The content within the tag itself is used as the text of the link.

## Forms

Forms are used to send requests, usually with _body parameters_.

When a user submits a form, the browser will send a `POST` request to the given path, as long as any parameters filled inside the form.

```html
<h1>Add a new album</h1>

<form action="/submit" method="POST">
  <input type="text" name="title">
  <input type="text" name="release_date">

  <input type="submit" value="Submit the form">
</form>
```

There's a lot in there. Let's break it down:
  * The attribute `action` is used to tell the browser which _path_ to send the request to.
  * The attribute `method` is used to tell the browser which _method_ to send the request with (usually this is "POST").
  * The `<input>` elements have a `name` attribute, which is used to give names to body parameters as part of the request.

## IDs and classes

In HTML, we can add an `ID` to an element - this is a label that we, the developer, are choosing to **uniquely identify** this element on the page. This means the same ID cannot be reused twice in the page, so make sure it's specific enough.

```html
<p id="introduction"> 

</p>
```

We can add also a `class` to an element - this is a label that we, the developer, are choosing. Unlike IDs, we can tag many elements with the same class name.

## Where to go from there

There's [a lot more HTML tags to learn out there](https://developer.mozilla.org/en-US/docs/Web/HTML), but it's probably better for you to learn it as you go, and focus on the basics first.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_html.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_html.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_html.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_html.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Fjust_enough_html.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
