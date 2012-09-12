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

  def self.average_days_between_for_year(year)
    fridays = Fridays.find(year)
    days_between = []
    fridays.each.with_index do |friday, i|
      if i < fridays.count - 1
        days_between << (fridays[i+1] - fridays[i]).ceil 
      end
    end
    
    days_between.inject{ |sum, el| sum + el }.to_i / days_between.size

  end
end

describe "find Friday the 13ths"do
  it 'should find all the Friday the 13ths for 2012' do
    Fridays.find(2012).count.should eql 3 
  end

  it 'should find all the Friday the 13ths for 2015' do
    Fridays.find(2012).count.should eql 3 
  end

  it 'should find all the Friday the 13ths for 2035' do
    Fridays.find(2035).count.should eql 2 
  end
end

describe "statistics" do
  it 'calculates the average days between Friday the 13ths for 2012' do
    Fridays.average_days_between_for_year(2012).should eql 91
  end
  it 'calculates the average days between Friday the 13ths for 2035' do
    Fridays.average_days_between_for_year(2035).should eql 91
  end
end
