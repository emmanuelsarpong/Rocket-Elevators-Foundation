using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
    public class Battery
    {
        public int id;
        public string status = "active";
        public List<Column> columnList;
        public string[] floorRequestButtonsList = {};
        public int amounOfColumns;
        public int amountOfFloors;
        public int amountOfBasements;
        public int amountOfElevatorsPerColumn;
        public int requestedFloor;
        
        public Battery (int id, int amounOfColumns, int amountOfFloors, int amountOfBasements, int amountOfElevatorsPerColumn)
        {
            this.id = id;
            this.amounOfColumns = amounOfColumns;
            this.amountOfFloors = amountOfFloors;
            this.amountOfBasements = amountOfBasements;
            this.amountOfElevatorsPerColumn = amountOfElevatorsPerColumn;
            this.columnList = new List<Column>();
        }
        // List<Column> columnList = new List<Column>();
        public Battery findBestColumn(int amountOfColumns)
        {
            if (requestedFloor < 1)
            {
                return columnList[0];
            }
            else if (requestedFloor > 1 && requestedFloor <= 20)
            {
                return columnList[0];
            }
            else if (requestedFloor > 20 && requestedFloor <= 40)
            {
                return columnList[0];
            }
             else if (requestedFloor > 20 && requestedFloor <= 60)
            {
                return columnList[0];
            }
            // for (int i = 0; i < amountOfColumns; i++)
            // {
            //     columnsList.Add(new Column(i + 1, this.amountOfElevatorsPerColumn, 20, false));
            // }
        }
    }
}

