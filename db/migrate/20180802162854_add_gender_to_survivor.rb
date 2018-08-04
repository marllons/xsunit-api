class AddGenderToSurvivor < ActiveRecord::Migration[5.1]
  def change
    add_reference :survivors, :gender, foreign_key: true
  end
end
