class User < ActiveRecord::Base
	has_many :player
  belongs_to :friend, :class_name => Player

  validates_uniqueness_of :friend_id, scope: :player_id
end
