# == Schema Information
#
# Table name: outfits
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class Outfit < ApplicationRecord
end
