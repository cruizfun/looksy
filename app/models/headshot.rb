# == Schema Information
#
# Table name: headshots
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Headshot < ApplicationRecord
  mount_uploader :image, ImageUploader
end
