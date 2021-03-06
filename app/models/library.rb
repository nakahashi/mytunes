class Library < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  default_scope -> { order('created_at DESC') }
end
