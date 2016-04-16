class ContestController < ApplicationController
  def index
  end

  def team_members
    @members = TeamMember::NAMES.map do |name|
      TeamMember.find_or_create_by(name: name)
    end
  end

  def team_headquarters
  end

  def team_history
  end
end
