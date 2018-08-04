class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.date :birthday

      t.timestamps
    end
  end
end
