# frozen_string_literal: true

require "rails_helper"

describe Hour, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:contest) }
    it { is_expected.to validate_presence_of(:points) }

    it do
      is_expected
        .to validate_numericality_of(:number)
        .is_greater_than_or_equal_to(1)
    end

    %i[points place].each do |field|
      it do
        is_expected
          .to validate_numericality_of(field)
          .is_greater_than_or_equal_to(0)
      end
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:contest) }
  end
end
