class AddUserToCheckIns < ActiveRecord::Migration[8.0]
  def change
    add_reference :check_ins, :user, null: true, foreign_key: true
  end
end
