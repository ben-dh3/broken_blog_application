# Securing User Input

Learn to validate and handle user input from HTML forms.

## Intro

[Video Alternative](https://www.youtube.com/watch?v=Z_X8jrbIj-I&t=1460s)

You learned how to build forms so users can input data that will be sent to the
web application, as part of the request — which means our web applications can
now handle data filled in by users.

This opens the door to many possibly exciting features, but also to some
security risks for our application.

You can read through [the OWASP list of top ten security
risks.](https://owasp.org/www-project-top-ten/)

## Exploiting a breach

_You will need to have completed the debugging challenge on the postcode app to
do this one._

Head back to the [Postcode Checker
App](../projects_to_debug/postcode_checker_app) and run it.

Navigate to the homepage and copy the text below into the postcode text field,
then submit the form.

_Headphone warning: this will play some music!_

```
<script>window.alert("You've been p0wn3d!!!!"); document.location.href="https://www.youtube.com/watch?v=ium0cPBkCRU";</script>
```

OK, that was interesting.

### What happened?

We've input some JavaScript code inside a `<script>` tag, and the next HTML page
printed this whole bunch of code without any other check. The JavaScript code
did execute (as if it were a normal part of the HTML page), and that code made
the browser display an alert message, and redirect to a video.

It's important to know that using this technique, someone clever and motivated
enough could exploit a security breach, and get other users' browsers to execute
some arbitrary JavaScript code. This could result in stolen credentials, deleted
or corrupted data, or worse, depending on the website and the targeted users.
This is called _cross-site scripting injection_, or XSS injection.

How do we prevent this? By following one simple rule - **never** trusting user
input, and always considering it as "tainted". Before being fully processed
(inserted a database, sent to some external service, or displayed to users), it
needs to be validated, checked and sanitised.

## Exercise

Modify the code of the `postcode_checker_app` to make sure user input is
correctly handled and the previous breach cannot be exploited. 

The most appropriate way to do this is to 'escape' the user input. This modifies
the contents so that it cannot be interpreted as HTML. For example:

```html
<!-- Not escaped -->
<script>window.alert("You've been p0wn3d!!!!");</script>

<!-- Escaped -->
&lt;script&gt;window.alert("You've been p0wn3d!!!!");&lt;/script&gt;
```

If you look at the Flask [security
documentation](https://flask.palletsprojects.com/en/2.2.x/security/) you will
see this paragraph:

> Flask configures Jinja2 to automatically escape all values unless explicitly
> told otherwise.

However, in this case the application is not doing that. You may need to perform
some research to determine why this is, and then correct the underlying problem.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F06_securing_user_input.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F06_securing_user_input.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F06_securing_user_input.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F06_securing_user_input.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F06_securing_user_input.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
