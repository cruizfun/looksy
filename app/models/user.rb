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
#  headshot_id     :integer
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :username, :presence => true, :uniqueness => true
  validates_format_of :username, with: /^[a-zA-Z0-9_]*$/, :multiline => true
  validates :headshot_id, :presence => true
  has_secure_password
end
