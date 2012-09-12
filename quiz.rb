require 'date'
class Fridays
  def self.find(year)
    friday_the_thirteenths = []
    12.times.with_index do |i|
      i += 1
      current_day = Date.strptime("#{year}-#{i}-13", "%Y-%m-%d")
      if current_day.wday == 5
        friday_the_thirteenths << current_day
      end
    end
    return friday_the_thirteenths
  end
end

describe "find Friday the 13ths"do
  it 'should find all the Friday the 13ths for 2012' do
    Fridays.find(2012).count.should eql 3 
  end

  it 'should find all the Friday the 13ths for 2015' do
    Fridays.find(2012).count.should eql 3 
  end
end
