json.extract! intervention, :id, :Author, :CustomerID, :BuildingID, :BatteryID, :ColumnID, :ElevatorID, :EmployeeID, :Start_Date, :End_Date, :Result, :Report, :Status
json.url intervention_url(intervention, format: :json)
