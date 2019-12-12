# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  outfit1_id :integer
#  outfit2_id :integer
#  poster_id  :integer
#

class Post < ApplicationRecord
end
