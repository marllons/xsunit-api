class AddAbdReportToSurvivors < ActiveRecord::Migration[5.1]
  def change
    add_column :survivors, :abd_report, :integer
    add_column :survivors, :has_abd, :boolean
  end
end
