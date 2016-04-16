class String
  def to_snakecase
    self.split(' ').map(&:downcase).join("_")
  end
end