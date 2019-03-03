# frozen_string_literal: true

require "rails_helper"

describe TeamMemberPhoto, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:team_member) }
  end
end
