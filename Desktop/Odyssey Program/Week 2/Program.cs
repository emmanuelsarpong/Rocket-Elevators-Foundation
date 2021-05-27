using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("It works!!!!");
        }
    }
    
    public class Battery
    {
        public int id;
        public string status = "active";
        public List<Column> columnsList;
        public string[] floorRequestButtonsList = {};
        public int amounOfColumns;
        public int amountOfFloors;
        public int amountOfBasements;
        public int amountOfElevatorsPerColumn;
        
        public Battery (int id, int amounOfColumns, int amountOfFloors, int amountOfBasements, int amountOfElevatorsPerColumn)
        {
            this.id = id;
            this.amounOfColumns = amounOfColumns;
            this.amountOfFloors = amountOfFloors;
            this.amountOfBasements = amountOfBasements;
            this.amountOfElevatorsPerColumn = amountOfElevatorsPerColumn;
            this.columnsList = new List<Column>();
        }

        public void findBestColumn(int amountOfColumns)
        {
            for (int i = 0; i < amountOfColumns; i++)
            {
                // (int id, string status, int amountOfFloors, int amountOfElevators, int servedFloors, bool isBasement)
                columnsList.Add(new Column(i + 1, "idle", amountOfFloors, this.amountOfElevatorsPerColumn, 20, false));
            }
        }
        
    }


    public class Column
    {
        public int id;
        public string status = "idle";
        public int amountOfFloors;
        public int amountOfElevators;
        public int servedFloors;
        public bool isBasement;
        public List<Elevator> elevatorList;
        public List<CallButton> CallButtonList;
        public List<int> floorRequestList;
        public List<Column> columnsList;
        public string doorStatus;
        public int amountOfElevatorsPerColumn;
        
        public int currentFloor;
        public int requestedFloor;
        public string direction;
        public Door door;

        public Column (int id, string status, int amountOfFloors, int amountOfElevators, int servedFloors, bool isBasement)
        {
            columnsList = new List<Column>();
            this.id = id;
            this.status = "idle";
            this.amountOfFloors = amountOfFloors;
            this.amountOfElevators = amountOfElevators;
            this.servedFloors = servedFloors;
            this.isBasement = false;
            this.elevatorList = new List<Elevator>();
            this.CallButtonList = new List<CallButton>();
        }

        int elevatorID = 1;
        int amountOfFloors = 1;
        Request elevators
        public void createElevators(int amountOfFloors, int amountOfElevators) { 
            for(int i = 0; i < amountOfElevators; i++) 
            {   
                int elevator = new Elevator(elevatorID, "idle", "up", 1, , 1, 1); //id, amountOfFloors
                this.elevatorList.Add(elevator);
                elevatorID++;
            }
        }

        public void CreateColumn(int amountOfColumns)
        {
            for (int i = 0; i < amountOfColumns; i++)
            {
                columnsList.Add(new Column(i, amountOfElevatorsPerColumn, new List<int>(), false));
            }
                columnsList[0].isBasement = true;
                columnsList[0].servedFloors = new List<int>(){-6, -5, -4, -3, -2, -1};
                columnsList[1].servedFloors = new List<int>(){1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
                columnsList[2].servedFloors = new List<int>(){21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40};
                columnsList[3].servedFloors = new List<int>(){40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};
        }

        public void findBestColumn(int requestedFloor)
        {
            Column column = new Column();
            columnsList .ForEach(chosenColumn =>){
                if (chosenColumn.servedFloors == requestedFloor)
                {
                    return chosenColumn;
                }
            }
        }
        
        public void createFloorRequestButtons (int amountOfFloors, int amountOfBasements) {
            int i = 1;
            int j = 0;
            while((j - amountOfBasements) < 0)
            {
                floorRequestButtonList.Add(new FloorRequestButton((j - amountOfBasements), (j - amountOfBaements), "down"));
                j++;
            }
            while(i != (amountOfFloors - amountOfBasements) + 1)
            {
                floorRequestButtonList.Add(new FloorRequestButton(1, 1, "up"));
                i++;
            }
        }

        public void requestFloor(int floor)
        {
            this.floorRequestList.Add(floor);
            this.move();
            this.operateDoors();
        }
        public void move() {
        int requestedFloor = this.floorRequestList[0];
        this.status = "in transit";

            if (this.currentFloor < requestedFloor)
            {
                this.direction = "up";
            }
                while(this.currentFloor < requestedFloor)
                {
                    this.currentFloor++;
                }
                

            if (this.currentFloor > requestedFloor)
            {
                this.direction = "down";
            }
                while(this.currentFloor > requestedFloor)
                {
                    this.currentFloor--;
                }
        }
        public void operateDoors(){
            if (this.currentFloor == requestedFloor)
            {
                this.door.status = "open";
            }
            Console.WriteLine("The elevator is oepning");
            if (this.currentFloor != requestedFloor)
            {
                this.door.status = "closed";
            }
            Console.WriteLine("The elevator is closing");
        }
    
    }
    public class Elevator
    {
        public int id;
        public string status = "idle";
        public int currentFloor;
        public string direction = "";
        public Door door;
        public List <int> floorRequestsList; //[]
        public List<int> completeRequestsList; //[]
        public int requestedFloor;
        // public int findElevator;

        public Elevator (int id, string status, int currentFloor, int direction, Door door, int floorRequestsList, int completedRequestsList)
        {
            this.id = id;
            this.status = "idle";
            this.currentFloor = 1;
            this.direction = null;
            this.door = door;
            this.floorRequestsList = new List<int>();
            this.completeRequestsList = new List<int>();
        }
        
        public void assignElevator(){

        }

        //Move to destination
        public void move() {
        if (this.currentFloor < requestedFloor)
            {
            this.direction = "up";
            while(this.currentFloor < requestedFloor)
            this.currentFloor++;
            }

        if (this.currentFloor > requestedFloor)
            {
            this.direction = "down";
            while(this.currentFloor > requestedFloor)
            this.currentFloor--;
            }
        }
        
        //Open/Close doors
        public void operateDoors(){
        if (this.currentFloor == requestedFloor)
        {
            this.door.status = "open";
        }
        Console.WriteLine("The elevator is oepning");
        if (this.currentFloor != requestedFloor)
        {
            this.door.status = "closed";
        }
        Console.WriteLine("The elevator is closing");
        }
    }

    public class CallButton
    {
        public int id;
        public string status = "idle";
        public int floor;
        public string direction = "";
        public CallButton (int id, string status, int floor, string direction)
        {
            this.id = id;
            this.status = "idle";
            this.floor = 1;
            this.direction = null;
        }
    }

    public class FloorRequestButton
    {
        public int id;
        public string status = "off";
        public int floor;
        public string direction = "";
        
        public FloorRequestButton (int id, string status, int floor, string direction)
        {
            this.id = id;
            this.status = "off";
            this.floor = 1;
            this.direction = "";
        }
    }

    public class Door
    {
        public int id;
        public string status = "closed";
        public Door (int id, string status)
        {
            this.id = id;
            this.status = "closed";
        }
    }
        
}