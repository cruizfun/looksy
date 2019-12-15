# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bra_size        :string
#  dress_size      :integer
#  email           :string
#  height          :integer
#  pant_size       :integer
#  password_digest :string
#  shoe_size       :integer
#  top_size        :integer
#  username        :string
#  weight          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :bra_size, :presence => true
  validates :dress_size, :presence => true
  validates :pant_size, :presence => true
  validates :shoe_size, :presence => true
  validates :top_size, :presence => true
  validates :username, :presence => true
  has_secure_password
end
