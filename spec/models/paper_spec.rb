require 'rails_helper'

RSpec.describe Paper, type: :model do

  context 'with COMPUTING MACHINERY AND INTELLIGENCE as paper' do

    context "paper creation" do
      it "should not validate without title" do
        p = Paper.new
        p.venue =  "Mind 49: 433-460"
        p.year = 1950
        expect(p).to_not be_valid
      end

      it "should not validate without venue" do
        p = Paper.new
        p.title = "COMPUTING MACHINERY AND INTELLIGENCE"
        p.year = 1950
        expect(p).to_not be_valid
      end

      it "should not validate without year" do
        p = Paper.new
        p.venue =  "Mind 49: 433-460"
        p.year = 1950
        expect(p).to_not be_valid
      end
      it "should not validate with non-integer year" do
        p = Paper.new
        p.title = "COMPUTING MACHINERY AND INTELLIGENCE"
        p.venue =  "Mind 49: 433-460"
        p.year = 'stuff'
        expect(p).to_not be_valid
      end
      it "should validate with integer year" do
        p = Paper.new
        p.title = "COMPUTING MACHINERY AND INTELLIGENCE"
        p.venue =  "Mind 49: 433-460"
        p.year = 2016
        expect{
          paper.save!
        }.to_not raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
