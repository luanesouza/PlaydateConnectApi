# frozen_string_literal: true

class PlaydateController < ApplicationController
  

  private

  # Only allow a trusted parameter "allow list" through.
  def playground_params
    params.require(:playground).permit(:inviter_id, :invitee_id, :date)
  end
end
