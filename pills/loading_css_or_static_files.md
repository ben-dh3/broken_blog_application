# Loading CSS or Static files

Learn to load static files using Flask.

## On HTML and CSS

The HTML code sent back by the server in responses is only used by a web browser to know
how to _structure_ the web page — sections, paragraphs, links, forms, blocks. But the HTML
doesn't contain any information on how it should look — design, size of elements, colours,
text size, etc.

We use another language called CSS for this. CSS is, like HTML, only understood by web
browsers. It is loaded alongside an HTML page, and contains information about how to style
specific elements of the web page. Here's an example of a CSS file:

```css
<!-- OMITTED -->
p {
  background: blue;
  width: 200px;
}

<!-- OMITTED -->

a {
  color: green;
  font-size: 20px;
}
```

### How do I use CSS on my web page?

Remember that all the data sent between the client and server is made through HTTP
requests and responses. Just like the HTML web page is the content of the HTTP response
from the server, the CSS file is also the content of an HTTP response.

A typical process of how it happens is the following:
  * The web browser sends a `GET` HTTP request and receives the HTML content in the
    response.
  * The browser parses the HTML content and finds a reference (a _path_) to a CSS file
    `/style.css`
  * The browser then sends a _second_ HTTP `GET /style.css` request to get this CSS file
    from the server
  * The browser receives the CSS file and analyse it to properly render the page to the
    user, with the corresponding design and styling information.

Here's how we can reference a CSS file in the HTML page:

```html
<html>
  <head>
    <title>This will be displayed in the browser window or tab title</title>

    <!-- Load the CSS file at path /style.css -->
    <link rel="stylesheet" href="/style.css" />
  </head>
  <body>
    <h1>Welcome to my page</h1>
  </body>
</html>
```

When the browser reads the `<link>` tag, it will send a `GET /style.css` request to the
server, expecting to get some CSS content back.

### Do I need to implement a `GET /style.css` route, then?

Flask makes things a bit easier for us — by default, any file present in the
sub directory `static` of the project directory will be "served" by Flask as a "static"
file.

This means that, if a `GET` request references (with its _path_) a valid file present in
the `static` directory, the contents of this file will be sent in the response.

For example, consider the following project structure:

```
app.py
lib/
  album.py
  album_repository.py
static/
  style.css
  album_cover.jpg
spec/
```

Sending a request `GET /style.css` will return the contents of the file `style.css`. Same
for `GET /album_cover.jpg`. Flask is smart enough to realise the path we're requesting
is a file from the `static` directory.

This means that by putting our CSS file in `static/`, we can have it available at the URL
`http://localhost:5000/style.css` (assuming our server is running on
`http://localhost:5000`). So the following would then work out of the box:

```html
<link rel="stylesheet" href="/style.css" />
```

### What about images?

It's the same. The HTML can reference the URL to an image in the web page, but the browser
needs to send another HTTP request for each image file it needs to display.

The HTML tag to add an image in a webpage is the following:

```html
<img src="/album_cover.jpg" alt="Description of the album cover">
```

When reading this tag, the browser will send the HTTP request `GET /album_cover.jpg`. If
this file is present in the `static` directory of your project, your server will
automatically send back its content, and the browser will display the image.

_The `alt` attribute's description text is important for accessibility — it serves as cues
for people with visual impairments, including people with low vision, to orient themselves
in the content. [More information
here](https://help.siteimprove.com/support/solutions/articles/80000863904-accessibility-image-alt-text-best-practices)_


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Floading_css_or_static_files.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Floading_css_or_static_files.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Floading_css_or_static_files.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Floading_css_or_static_files.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=pills%2Floading_css_or_static_files.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
