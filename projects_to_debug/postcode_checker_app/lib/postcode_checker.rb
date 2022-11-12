class PostcodeChecker
  def valid?(postcode)
    if postcode.match(/^[a-z]{1,2}\d[a-z\d]?\s*\d[a-z]{2}$/i)
      return true
    else
      return false
    end
  end
end