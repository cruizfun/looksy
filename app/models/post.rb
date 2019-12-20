# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  outfit1_id :integer
#  outfit2_id :integer
#  poster_id  :integer
#

class Post < ApplicationRecord
  validates :outfit1_id, :presence => true
  validates :outfit2_id, :presence => true
  validates :event_id, :presence => true
end
