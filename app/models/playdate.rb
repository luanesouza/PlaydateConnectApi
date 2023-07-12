# frozen_string_literal: true

class Playdate < ApplicationRecord
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  def self.create_playdate(invitee_id, inviter_id, date)
    Playdate.create(invitee_id: invitee_id, inviter_id: inviter_id, date: date)
  end
end
