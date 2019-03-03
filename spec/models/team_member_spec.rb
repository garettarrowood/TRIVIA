# frozen_string_literal: true

require "rails_helper"

describe TeamMember, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:team_member_photos) }
  end
end
