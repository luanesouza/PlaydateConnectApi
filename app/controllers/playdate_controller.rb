class PlaydateController < ApplicationController

    def self.find_playdates(user_id)
      sanitized_id = user_id.to_i

      if sanitized_id != 0
        @playdates = self.all.where(invitee_id: sanitized_id) + Playdate.all.where(inviter_id: sanitized_id)
        render json: @playdates
      else
        raise "Id must be a number"
      end
    end

    private
        # Only allow a trusted parameter "allow list" through.
        def playground_params
            params.require(:playground).permit(:inviter_id, :invitee_id, :date)
        end
end