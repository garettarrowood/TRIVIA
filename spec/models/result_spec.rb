# frozen_string_literal: true

require "rails_helper"

describe Result, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:contest) }
  end

  it "has valid factory" do
    expect(create(:result)).to be_valid
  end
end
