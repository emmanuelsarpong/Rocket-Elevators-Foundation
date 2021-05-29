using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
    public class Elevator
    {
        public int id {get; set;}
        public string status {get; set;}
        public int currentFloor {get; set;} 
        public string direction {get; set;}
        public Door door;
        public List <int> floorRequestsList {get; set;} //[]
        public List<int> completeRequestsList {get; set;} //[]
        public List<Elevator> elevatorList;
        public int requestedFloor;
         public int score;
        // public int findElevator;
        public Elevator (int id)
        {
            this.id = id;
            // this.status = "idle";
            // this.currentFloor = 1;
            // this.direction = null;
            // this.door = door;
            // this.floorRequestsList = new List<int>();
            // this.completeRequestsList = new List<int>();
            // this.elevatorList = new List<Elevator>();
            // this.score = 1;
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
}