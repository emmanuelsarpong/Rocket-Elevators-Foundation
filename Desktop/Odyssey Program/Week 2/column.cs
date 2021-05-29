using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
    public class Column
    {
        public int id {get; set; }
        public string status = "idle";
        public int servedFloors {get; set; }
        public int amountOfElevators {get; set; }
        public bool isBasement {get; set; }
        public List<Elevator> elevatorList {get; set; }
        public List<FloorRequestButton> floorRequestButtonList {get; set;}
        public List<CallButton> CallButtonList {get; set; }
        public List<int> flooRequestList {get; set; }
        public int currentFloor {get; set; }
        public string direction {get; set; }
        public Door door {get; set; }
        public List<int> listElevatorsToTest {get; set; }

        public int chosenColumn;    

        public Column (int id, int amountOfElevators, int servedFloors, bool isBasement)
        {
            var columnsList = new List<Column>();
            this.id = id;
            //this.status = "idle";
            //this.amountOfFloors = 1;
            this.amountOfElevators = amountOfElevators;
            this.servedFloors = servedFloors;
            this.isBasement = false;    
            this.elevatorList = new List<Elevator>();
            this.CallButtonList = new List<CallButton>();
            this.chosenColumn =  1;
            this.floorRequestButtonList = new List<FloorRequestButton>();
            this.currentFloor = currentFloor;
            // this.currentFloor = currentFloor;
            this.direction = "";
            this.door = door;
            // this.listElevatorsToTest = new List<int>();
        }

        List <int> floorRequestList = new List<int>();
        List<Column> columnList = new List<Column>();
        //int elevatorID = 1;
        // int amountOfFloors = 1;
        // Request elevators
        public void createElevators(int amountOfFloors, int amountOfElevators) { 

            for(int i = 0; i < amountOfElevators; i++) 
            {   
                var elevator = new Elevator(1); //id, amountOfFloors
                this.elevatorList.Add(elevator);
                elevator.id++;
            }
        }  

        public void CreateColumn(int amountOfColumns)
        {
            for (int i = 0; i < amountOfColumns; i++)
            {
                List<Column> columnList = new List<Column>();

                var column_obj = new Column(i+1, 1, 1, false );
                columnList.Add(column_obj);
            }
        //         columnList[0].isBasement = true;
        //         columnList[0].servedFloors = {-6; -5, -4, -3, -2, -1};
        //         columnList.createCallButtons; 
        //         columnList[1].servedFloors = new List<>{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        //         columnList[2].servedFloors = new List<int>(){21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40};
        //         columnList[3].servedFloors = new List<int>(){40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};
        // }
        }

        public (Column, Elevator) assignElevator(int requestedFloor, string direction){
            var  bestCcolum = findBestColumn(requestedFloor);
            var bestElevator = bestCcolum.findBestElevator(requestedFloor, direction)
            bestElevator.move(requestedFloor);
            return (bestCcolum,bestElevator);
        }

        public Column findBestColumn(int requestFloor)
        {   
            // int i = 0;
            Column chosenColumn = null;
            for (i = 0; i < amountOfColumns; i++)
            {
                if(this.columnList[i].servedFloors.Contains(requestFloor))
                {
                    chosenColumn = this.columnList[i];
                }
                return chosenColumn;
            }
        }
        ÷
        
        public void createFloorRequestButtons (int amountOfFloors, int amountOfBasements) {
            int i = 1;
            int j = 0;
            while(i != (amountOfFloors - amountOfBasements) + 1)
            {
                floorRequestButtonList.Add(new FloorRequestButton(1, 1, "up")); 
                i++;
            }
            while((j - amountOfBasements) < 0)
            {
                floorRequestButtonList.Add(new FloorRequestButton((j - amountOfBasements), (j - amountOfBasements), "down"));
                j++;
            }
        }

        public void requestFloor(int floor)
        {
            floorRequestList.Add(floor);
            this.move();
            this.operateDoors();
        }

        public void findBestElevator (int requestedFloor, string direction) {
            var elevatorList = this.elevatorList;
            var defaultElevator = this.elevatorList[0];
            var elevatorToTest = new List<Elevator>();
            for (int i=0; i < elevatorList.Count; i++)
            {
                elevatorList[i].score = 0;
            }
            for (int i=0; i < elevatorList.Count; i++)
            {
                var elevator = elevatorList[i];
                    if(requestedFloor == elevator.currentFloor && elevator.status == "stopped" && direction == elevator.direction)
                    {
                        elevator.score = elevator.score + 4;
                    }
                    if(requestedFloor > elevator.currentFloor && elevator.status == "stopped" && direction == elevator.direction)
                    {
                        elevator.score = elevator.score + 3;
                    }
                    if(requestedFloor < elevator.currentFloor && elevator.status == "stopped" && direction == elevator.direction)
                    {
                        elevator.score = elevator.score + 2;
                    }
                    if(elevator.status == "idle")
                    {
                        elevator.score = elevator.score + 1;
                    }
                    else
                    {
                        elevator = defaultElevator;
                    }
            }
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
            int requestedFloor = this.floorRequestList[0];
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
}