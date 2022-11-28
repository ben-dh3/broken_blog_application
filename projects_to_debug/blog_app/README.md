# (Broken) Blog app

This web application is broken. You have three objectives:

* Find the bugs and fix them. **You can assume that the tests describe the
  correct behaviour** (so you shouldn't modify anything in the `spec/`
  directory)
* You need to get **all the tests passing**.
* You need to **run the app manually with your browser** and make sure it works.
  You can have a look at the user stories below to understand how the program is
  expected to behave (without bugs). 

Start by setting up the project and running the tests.

You may then wish to open `tests/test_app.py` for some guidance.

## Setup

Clone this repository and enter this directory.

```shell
# Install dependencies and set up the virtual environment
; pipenv install

# Activate the virtual environment
; pipenv shell

# Install the virtual browser we will use for testing
; playwright install
# If you have problems with the above, contact your coach

# To run the tests
; pytest

# To run the app
; python app.py
# Visit http://localhost:5000/ in your browser
```

> **Note**  
> When you amend the files, even if it is to print something out, the server
> will reload to reflect your changes, **in the process clearing the list of
> posts**. This may make your debugging harder.
> 
> You can work around this by debugging entirely through the tests, or ensuring
> you add any test posts from scratch every time you make a change.
> 
> If you want to disable this feature entirely, remove `debug=True, ` in
> `app.py`. You will then have to manually restart the server for every change.

## User stories

Note that these user stories are **already implemented** by the app — they're
here as guidance for you to understand what the program is about and how it
should behave when correct.

```
As a developer who likes to blog,
So I can write about my learnings,
I'd like to add a new post on the blog.
```

```
As a developer who likes to read,
So I can read about cool tech things,
I'd like to browse the list of blog posts.
```

```
As a developer who likes to read,
So I can read about the things I'm interested with,
I'd like to browse the list of blog posts having a specific tag.
```



<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=projects_to_debug%2Fblog_app%2FREADME.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=projects_to_debug%2Fblog_app%2FREADME.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=projects_to_debug%2Fblog_app%2FREADME.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=projects_to_debug%2Fblog_app%2FREADME.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=projects_to_debug%2Fblog_app%2FREADME.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
