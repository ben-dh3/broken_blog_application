from playwright.sync_api import Page, expect

# Don't change any code in this file! Except for debugging purposes.
# Here are some techniques to debug:

# == TECHNIQUE 1: Printing the page contents ==
# To print out values like the page content, you can use:
# ```
# print(page.content()) # run `pytest -s` to see the output
# ```

# == TECHNIQUE 2: Screenshots ==
# To see the browser page at a particular point in the test, you can use:
# ```
# page.screenshot(path="screenshot.png", full_page=True)
# ```
# Then run `pytest` and look at /screenshot.png to see the page at that point.

"""
When we visit the posts page
And submit the form to create a new post without tags
We see the post on the page
"""
def test_create_post(page, test_web_address):
    page.goto(f"http://{test_web_address}/")
    page.fill("input[name='title']", "My Day")
    page.fill("input[name='content']", "It was a good day")
    page.click("text=Create Post")
    # We've added a screenshot here to get you started,
    # take a look at the screenshot.png file to see what the page looks like.
    page.screenshot(path="screenshot.png", full_page=True)
    print(page.content())
    expect(page.locator(".t-title")).to_have_text("My Day")
    expect(page.locator(".t-content")).to_have_text("It was a good day")

"""
When we visit the posts page
And submit the form to create a new post with the tags 'art, music'
And then submit the form to create a new post with a single tag 'art'
And then visit the tag page for 'music'
We see the post with the tag 'music' on the page
And we do not see the post with the tag 'art' on the page
"""
def test_create_post_with_tags(page, test_web_address):
    page.goto(f"http://{test_web_address}/")
    page.fill("input[name='title']", "My Day")
    page.fill("input[name='content']", "It was a good day")
    page.fill("input[name='tags']", "art, music")
    page.click("text=Create Post")
    page.fill("input[name='title']", "My Next Day")
    page.fill("input[name='content']", "It was also a good day")
    page.fill("input[name='tags']", "art")
    page.click("text=Create Post")
    page.goto(f"http://{test_web_address}/tags/music")
    expect(page.locator(".t-title")).to_have_text("My Day")
    expect(page.locator(".t-content")).to_have_text("It was a good day")
    expect(page.locator(".t-title")).not_to_have_text("My Next Day")
    expect(page.locator(".t-content")).not_to_have_text("It was also a good day")

