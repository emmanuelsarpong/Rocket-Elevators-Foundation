package main

import "fmt"
// func main(){
// 	fmt.Println("Hello WORLD!!")
// }

type Battery struct {
	ID 						int
	status 					string
	columnList 				[]Column
	completeRequestlist 	[]completeRequest
	floorRequestButtonsList []FloorRequestButton
	numberOfColumn			int
	numberOfFloors			int
	amountOfBasements		int
	servedFloor				[]int
}

func (b *Battery) init(requestedFloor int){
	b.id = id
	b.status = "online"
	b.numberOfColumn = numberOfColumn
	b.amountOfFloors = numberOfFloors
	b.amountOfBasements = amountOfBasements
}

func (b *Battery) createColumn(id int, status string, amountOfColumn int, amountOfFloors int, amountOfBasements, servedFloor []int){
	for i:= 1 <= amountOfColumn; i++ {
		b.columnList = append(b.columnList, Column(i, numberOfColumn));
	}
	b.columnList[0].servedFloor = []int{-6,-5,-4,-3,-2,-1};
	b.columnList[0].isBasement = true;
	b.columnList[1].servedFloor = []int{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
	b.columnList[2].servedFloor = []int{1,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40};
	b.columnList[3].servedFloor = []int{1,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};
}

func (b *Battery) findBestColumn(requestedFloor int){
	var chosenColumn int
	// var currentColumn int
	for _, currentColumn := range b.columnList{
		if currentColumn.servedFloors[0] == requestedFloor
		chosenColumn = currentColumn
		break
	}
	return chosenColumn
}

type Column struct {
	ID 				int
	status 			string
	servedFloors 	[] int
	isBasement 		[] bool
	elevatorList 	[] Elevator
	callButtonsList [] CallButton
}

func (c *Column) init (id int, status string, elevatorList []Elevator, callButtonsList []CallButton){
	c.id = id
	c.status = "online"
	c.elevatorList = elevatorList
	c.callButtonsList = callButtonsList
}

func (c * Column) findBestElevator2(requestedFloor int, direction string) {
	var elevatorGap = 999999999
	var nearestElevator = ListElevatorsToTest[0]
	for index, elevator := range ListElevatorsToTest {
		var gap = Abs(elevator.currentFloor - 1)
		if elevator.direction == "down" || elevator.direction == "idle" {
			if gap < elevatorGap{
				nearestElevator = elevator
				elevatorGap = gap
			}
		}
	}
}

func (c * Column) findBestElevator2(requestedFloor int, direction string) {
	var elevatorList = this.elevatorList;
	var defaultElevator = this.elevatorList[0];
	var elevatorToTest = []elevator];
	for i :=0, i < elevatorList.Count, i++{
		elevatorList[i].score = 0;
	}
	for i :=0; i < elevatorList.Count; i++{
		var elevator = elevatorList[i];
			if(requestedFloor == elevator.currentFloor && elevator.status == "stopped" && direction == elevator.direction){
				elevator.score = elevator.score + 4;
			}
			if(requestedFloor > elevator.currentFloor && elevator.status == "stopped" && direction == elevator.direction){
				elevator.score = elevator.score + 3;
			}
			if(requestedFloor < elevator.currentFloor && elevator.status == "stopped" && direction == elevator.direction){
				elevator.score = elevator.score + 2;
			}
			if(elevator.status == "idle"){
				elevator.score = elevator.score + 1;
			} else{
				elevator = defaultElevator;
			}
	}
}

func (c * Column) requestElevator(requestedFloor int, direction string){
	var bestElevator = this.findBestElevator(requestedFloor, direction)
	bestElevator.move(requestedFloor)
	bestElevator.moveToLobby()
	return bestElevator 
}


type Elevator struct {
	ID 						int
	status 					string
	currentFloor 			int
	direction 				string
	door 					Door
	floorRequestList 		[]int
	floorRequestButtonList  []FloorRequestButton
	completeRequestlist 	[]completeRequest
	score					int
}

func (e * Elevator) init(id int, status string, direction string, currentFloor int, score int){
	e.id = id
	e.status = "online"
	e.direction = direction
	e.currentFloor = currentFloor
	e.score = 0
}

func (e * Elevator) move(requestedFloor int){
	e.status = "moving"
	if e.currentFloor < requestedFloor {
		e.direction = "up"
		for i:= e.currentFloor; i < requestedFloor; i++{
			if e.currentFloor == -1 {
				e.currentFloor- 1
				continue
			}
		}
	} else if e.currentFloor > 1{
		e.direction = "down"
		for i:= e.currentFloor; i > 1; i--{
			if e.currentFloor == 0 {
				e.currentFloor- 1
				continue
			}
			e.currentFloor--
		}
	}
}

func (e * Elevator) moveToLobby(requestedFloor int){
	e.status = "moving"
	if e.currentFloor < lobbyFloor {
		e.direction = "up"
		for i:= e.currentFloor; i < 1; i++{
			if e.currentFloor == -1 {
				e.currentFloor- 1
				continue
			}
		}
	} else if e.currentFloor > 1{
		e.direction = "down"
		for i:= e.currentFloor; i > 1; i--{
			if e.currentFloor == 0 {
				e.currentFloor- 1
				continue
			}
			e.currentFloor--
		}
	}
}

func (d * Door) operateDoors(){
	if (this.currentFloor == requestedFloor){
		d.status = "open";
	}
	Println("The elevator is oepning");
	if (this.currentFloor != requestedFloor){
		d.status = "closed";
	}
	Println("The elevator is closing");
}

type CallButton struct {
	ID 		  int
	status 	  string
	floor 	  int
	direction string
}

type FloorRequestButton struct {
	ID 		  int
	status    string
	floor     int
	direction string
}

type Door struct {
	ID 		  int
	status    string
	floor     int
	direction string
}