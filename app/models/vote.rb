# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bestoutfit_id :integer
#  post_id       :integer
#  voter_id      :integer
#

class Vote < ApplicationRecord
end
