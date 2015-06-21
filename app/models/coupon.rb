require 'securerandom'

class Coupon < ActiveRecord::Base
  belongs_to :album
  validates_uniqueness_of :code, scope: :album_id
end
