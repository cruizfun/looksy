# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  bra_size               :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  dress_size             :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  height                 :integer
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  pant_size              :integer
#  password_digest        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  shoe_size              :integer
#  sign_in_count          :integer          default(0), not null
#  top_size               :integer
#  unconfirmed_email      :string
#  unlock_token           :string
#  username               :string
#  weight                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  headshot_id            :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable
  validates :email, :uniqueness => { :case_sensitive => true }
  validates :email, :presence => true
  validates :username, :presence => true, :uniqueness => true
  validates_format_of :username, with: /^[a-zA-Z0-9_]*$/, :multiline => true
  has_secure_password
end
