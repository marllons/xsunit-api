class CreateReportSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :report_survivors do |t|
      t.integer :abd_report
      t.boolean :has_abd
      t.references :survivor, foreign_key: true
      t.timestamps
    end
  end
end
