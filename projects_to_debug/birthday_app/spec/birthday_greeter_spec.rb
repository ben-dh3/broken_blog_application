require 'birthday_greeter'
require 'date'

# Unit test
describe BirthdayGreeter do
  it 'wishes happy birthday' do
    greeter = BirthdayGreeter.new
    today = Date.today.strftime('%m-%d')

    expect(greeter.greet_birthday(today)).to eq("Happy birthday!")
  end

  it 'tells how many days until birthday' do
    greeter = BirthdayGreeter.new
    in_seven_days = (Date.today + 7).strftime('%m-%d')

    expect(greeter.greet_birthday(in_seven_days)).to eq("Your birthday is in 7 days!")
  end

  it 'tells how many days until birthday' do
    greeter = BirthdayGreeter.new
    in_two_hundred_days = (Date.today + 200).strftime('%m-%d')

    expect(greeter.greet_birthday(in_two_hundred_days)).to eq("Your birthday is in 200 days!")
  end

  it 'tells how many days until birthday' do
    greeter = BirthdayGreeter.new
    in_three_hundred_days = (Date.today + 300).strftime('%m-%d')

    expect(greeter.greet_birthday(in_three_hundred_days)).to eq("Your birthday is in 300 days!")
  end
end