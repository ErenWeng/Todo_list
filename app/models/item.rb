class Item < ApplicationRecord
  validates :content, presence: true
  belongs_to :list

  def completed?
    !completed_at.blank?
  end
end
