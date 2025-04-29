class User < ApplicationRecord
  has_many :events
  has_many :rsvps
  has_many :attending_events, through: :rsvps, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
