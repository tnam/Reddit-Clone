class Post < ActiveRecord::Base
  attr_accessible :url, :title, :user_id

  validates :url, :title, presence: "true"

  has_many :comments
  has_many :votes
  belongs_to :user

  def vote_count
    votes.where(thumb: "up").count - votes.where(thumb: "down").count
  end
end