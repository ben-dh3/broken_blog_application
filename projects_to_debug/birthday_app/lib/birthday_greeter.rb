require 'date'

class BirthdayGreeter
  # Expect a date in format mm-dd
  def greet_birthday(date)
    return "Happy birthday!" if today?(date)

    "Your birthday is in #{days_until_birthday(date)} days!"
  end

  private 

  def today?(date) 
    Date.parse(Date.today.year.to_s + "-" + date) == Date.today
  end

  def days_until_birthday(date)
    # if the month and day is before today
    if Date.parse(Date.today.year.to_s + "-" + date) > Date.today
      date_with_year = Date.parse(Date.today.next_year.year.to_s + "-" + date)
    else
      date_with_year = Date.parse(Date.today.year.to_s + "-" + date)
    end

    (date_with_year - Date.today).to_i 
  end
end