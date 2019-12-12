# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  outfit1_id :integer
#  outfit2_id :integer
#  user_id    :integer
#

class Post < ApplicationRecord
end
