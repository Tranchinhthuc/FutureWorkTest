require "rails_helper"

describe "Story" do
  describe "Check valid state before update" do
    context "Normal change state" do
      story = Story.create FactoryGirl.attributes_for :story
      story.update state: "unstarted"
      valid_next_state = :started
      invalid_next_state = (Story.states.keys - [:started]).sample
      it{expect(story.can_change_state_to? valid_next_state).to eq true}
      it{expect(story.can_change_state_to? invalid_next_state).to eq false}
    end

    context "Change state from delivered state" do
      story = Story.create FactoryGirl.attributes_for :story
      story.update state: "delivered"
      valid_next_state = [:rejected, :accepted].sample
      invalid_next_state = [:unstarted, :started, :finished, :delivered].sample
      it{expect(story.can_change_state_to? valid_next_state).to eq true}
      it{expect(story.can_change_state_to? invalid_next_state).to eq false}
    end

    context "Change state from rejected state" do
      story = Story.create FactoryGirl.attributes_for :story
      story.update state: "rejected"
      valid_next_state = :started
      invalid_next_state = (Story.states.keys - [:started]).sample
      it{expect(story.can_change_state_to? valid_next_state).to eq true}
      it{expect(story.can_change_state_to? invalid_next_state).to eq false}
    end

    context "Change state from accepted state" do
      story = Story.create FactoryGirl.attributes_for :story
      story.update state: "accepted"
      invalid_next_state = Story.states.keys.sample
      it{expect(story.can_change_state_to? invalid_next_state).to eq false}
    end
  end
end
