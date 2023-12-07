import re

class PostcodeChecker():
    def check(self, postcode):
        if postcode is None:
            return False
        return re.match(
            r"^[A-Z]{1,2}\d[A-Z\d]? ?\d[A-Z]{2}$",
            postcode,
            re.I) is not None
