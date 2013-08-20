require 'spec_helper'

describe Event do
  it "has a valid factory" do
    FactoryGirl.create(:event).should be_valid
  end
  it "is invalid without a description" do
    FactoryGirl.build(:event, description: nil).should_not be_valid
  end
  
  it "is invalid if end date is before start date" do
    FactoryGirl.build(:event, start_time: Date.today, end_time: Date.today - 10).should_not be_valid
  end

  it "returns a correct manhours count" do
    @timeslot1 = FactoryGirl.create(:timeslot)  #This factory creates a person and an event
    @event = @timeslot1.event
    @person1 = @timeslot1.person
    @person2 = FactoryGirl.create(:person)
    @event.people << @person2
    @timeslot2 = @person2.timeslots.first
    @event.timeslots.count.should equal(2)
    @timeslot1.start_time
    #1.should eq(2)
  end
end
