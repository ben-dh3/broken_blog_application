from playwright.sync_api import Page, expect

def test_get_homepage(page, test_web_address):
    page.goto(f"http://{test_web_address}/")
    expect(page.locator(".t-title")).to_have_text("Check Postcode")

def test_valid_postcode(page, test_web_address):
    page.goto(f"http://{test_web_address}/")
    page.fill("input[name='postcode']", "EC2A 4HJ")
    page.click("input[value='Check Postcode']")
    expect(page.locator(".t-result")).to_contain_text("is a valid postcode")

def test_invalid_postcode(page, test_web_address):
    page.goto(f"http://{test_web_address}/")
    page.fill("input[name='postcode']", "91 1AE")
    page.click("input[value='Check Postcode']")
    expect(page.locator(".t-result")).to_contain_text("is not a valid postcode")

def test_back_to_homepage(page, test_web_address):
    page.goto(f"http://{test_web_address}/")
    page.fill("input[name='postcode']", "EC2A 4HJ")
    page.click("input[value='Check Postcode']")
    page.click("text=Back to the homepage")
    expect(page.locator(".t-title")).to_have_text("Check Postcode")
