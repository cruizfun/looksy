# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bra_size        :string
#  dress_size      :integer
#  email           :string
#  pant_size       :integer
#  password_digest :string
#  shoe_size       :integer
#  top_size        :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  headshot_id     :integer
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
