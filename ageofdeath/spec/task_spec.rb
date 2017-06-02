require 'Task.rb'
describe Task do
  describe ".age_of_death" do
    context "returns valid age and life distance" do
#1
      it "returns ​age ​=>​ ​ 0​ ,​ ​ :​distance ​=>​ ​1 day​" do
        first_date = "1979-04-01"
        second_date = "1979-04-01"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>0, :distance=>"1 day"})
      end
#2
      it "returns ​age ​=>​ ​ 0​ ,​ ​ :​distance ​=>​ ​13 day​s" do
        first_date = "1979-04-01"
        second_date = "1979-04-14"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>0, :distance=>"13 days"})
      end
#3
      it "returns ​age ​=>​ ​ 0​ ,​ ​ :​distance ​=>​ ​2 weeks​" do
        first_date = "1979-04-01"
        second_date = "1979-04-15"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>0, :distance=>"2 weeks"})
      end
#4
      it "returns ​age ​=>​ ​ 0​ ,​ ​ :​distance ​=>​ 6 weeks​" do
        first_date = "1979-04-01"
        second_date = "1979-05-14"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>0, :distance=>"6 weeks"})
      end
#5
      it "returns ​age ​=>​ ​ 0​ ,​ ​ :​distance ​=>​ ​11 months​" do
        first_date = "1979-04-01"
        second_date = "1980-03-01"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>0, :distance=>"11 months"})
      end
#6
      it "returns ​age ​=>​ ​ 1 ,​ ​ :​distance ​=>​ ​1 year" do
        first_date = "1979-04-01"
        second_date = "1980-03-02"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>1, :distance=>"1 year"})
      end
#7
      it "returns ​age ​=>​ ​ 32​ ,​ ​ :​distance ​=>​ ​32 years​" do
        first_date = "1979-04-01"
        second_date = "2012-03-29"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>32, :distance=>"32 years"})
      end
#8
      it "returns ​age ​=>​ ​ 33​ ,​ ​ :​distance ​=>​ 33 years" do
        first_date = "1979-04-01"
        second_date = "2012-04-01"
        age = Task.new(first_date, second_date)
        expect(age.age_of_death).to eq({:age=>33, :distance=>"33 years"})
      end
    end
  end
end
