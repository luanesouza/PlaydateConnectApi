class User < ApplicationRecord
    has_many :playdates, foreign_key: 'invitee_id', dependent: :destroy
    has_many :invited_playdates, class_name: 'Playdate', foreign_key: 'inviter_id', dependent: :destroy
   
    #Connection
    has_many :followers, foreign_key: :follower_id , class_name: "Connection"
    has_many :followed, through: :followers
    
    has_many :followed, foreign_key: :followed_id, class_name: "Connection"
    has_many :followers, through: :followed

    #Playdate
    has_many :inviters, foreign_key: :inviter_id, class_name: "Playdate"
    has_many :invited, through: :inviters

    has_many :invited, foreign_key: :invited_id, class_name: "Playdate"
    has_many :inviters, through: :invited
end
