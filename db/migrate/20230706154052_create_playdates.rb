class CreatePlaydates < ActiveRecord::Migration[5.2]
  def change
    create_table :playdates do |t|
      t.string :inviter_id
      t.string :invitee_id
      t.date :date

      t.timestamps
    end
  end
end
