from lib.postcode_checker import PostcodeChecker

def test_valid_postcodes():
    checker = PostcodeChecker()
    assert checker.check('EC2A 4HJ') == True
    assert checker.check('M1 1AE') == True


def test_invalid_postcodes():
    checker = PostcodeChecker()
    assert checker.check('91 1AE') == False
    assert checker.check('M1 1A44E') == False
