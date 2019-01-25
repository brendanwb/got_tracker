class Episode < ApplicationRecord
  def watched?
    is_completed
  end
end
