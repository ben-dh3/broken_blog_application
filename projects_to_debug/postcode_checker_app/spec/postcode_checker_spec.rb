require 'postcode_checker'

describe PostcodeChecker do
  it 'is a valid postcode' do
    checker = PostcodeChecker.new
    expect(checker.valid?('EC1A 1BB')).to eq(true)
  end

  it 'is a valid postcode' do
    checker = PostcodeChecker.new
    expect(checker.valid?('M1 1AE')).to eq(true)
  end

  it 'is not valid postcode' do
    checker = PostcodeChecker.new
    expect(checker.valid?('91 1AE')).to eq(false)
  end

  it 'is not valid postcode' do
    checker = PostcodeChecker.new
    expect(checker.valid?('M1 1A44E')).to eq(false)
  end
end