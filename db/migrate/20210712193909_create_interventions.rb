class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :Author
      t.integer :CustomerID
      t.integer :BuildingID
      t.integer :BatteryID
      t.integer :ColumnID
      t.integer :ElevatorID
      t.integer :EmployeeID
      t.datetime :Start_Date
      t.datetime :End_Date
      t.string :Result
      t.string :Report
      t.string :Status
    end
  end
end
