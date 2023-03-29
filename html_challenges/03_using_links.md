# Using links

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to use HTML links to make the browser send `GET` requests.

## Intro

Let's consider the following situation. We have two routes:

* `GET /` is the "root", returning HTML code — in other words, it is the website homepage.

* `GET /about` is another route, returning some different HTML — it's a different page.

The web browser can send requests to these two routes separately.

However, when building websites, we don't want users to manually enter a new URL every time they need to go to a different page. We need a way to "tell" the browser when to send a new request to a different page.

We use **hypertext links**, or **anchor links** for this. A link is an HTML tag that will be rendered as a hypertext link by the browser, so the user can click on it. This link points to a different URL. When the user clicks, the browser will send a new `GET` request to that URL, and eventually the page will change.

The `<a>` HTML tag is used to create links. The attribute `href` tells the browser which path it should send the next request to, when that link is clicked.

```html
<a href="/about">Go to the about page</a>
```

When the above link is clicked, the browser will send a new request `GET /about` to the server.

Here are some examples in the starter:

* [A simple link](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/templates/books/show.html#L18-L20)
* [A link with Jinja tags in it](https://github.com/makersacademy/web-applications-in-python-project-starter-html/blob/main/templates/books/index.html#L14)

## Using the browser developer tools

Most browsers [have integrated developer tools](../pills/use_the_developer_console.md) that we can use to inspect the HTTP requests sent by the browser, and the responses it receives. Learning how to use it can be really helpful when we need to get visibility into what the browser sends and gets back through its HTTP connection with the web server.

When creating links between "pages", keep the developer tools open in the browser, so you can see the HTTP request being logged, and inspect its information.

## Demonstration

[Video Demonstration](https://www.youtube.com/watch?v=1GcIg1lDTC4&t=858s)

## Exercise

Test-drive and implement the following change:

The page returned by `GET /albums` should contain a link for each album listed. It should link to `/albums/<id>`, where `<id>` is the corresponding album's id. That page should then show information about the specific album.

Run the server and make sure you can navigate, using your browser, from the albums list page to the single album page.

[Example solution](https://www.youtube.com/watch?v=1GcIg1lDTC4&t=1330s)

## Challenge

This is a process feedback challenge. That means you should record yourself doing it and
submit that recording to your coach for feedback. [How do I do
this?](https://github.com/makersacademy/golden-square-in-python/blob/main/pills/process_feedback_challenges.md)

Test-drive and implement the following changes to the `music_web_app_html` project:

1. Add a route `GET /artists/<id>` which returns an HTML page showing details for a single artist.
2. Add a route `GET /artists` which returns an HTML page with the list of artists. This page should contain a link for each artist listed, linking to `/artists/<id>` where `<id>` needs to be the corresponding artist id.

[After you're done, submit your recording here](https://airtable.com/shrNFgNkPWr3d63Db?prefill_Item=webpy_as03).


[Next Challenge](04_using_forms.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F03_using_links.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F03_using_links.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F03_using_links.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F03_using_links.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F03_using_links.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
