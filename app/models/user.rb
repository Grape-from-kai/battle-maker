class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :battles, dependent: :destroy
  has_many :participant_managements, dependent: :destroy
  has_many :battles, through: :participant_managements
  has_many :comments, dependent: :destroy
end
