using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
    public class FloorRequestButton
    {
        public int id;
        public string status = "off";
        public int floor;
        public string direction = "";
        
        public FloorRequestButton (int id, int floor, string direction)
        {
            this.id = id;
            this.status = "off";
            this.floor = 1;
            this.direction = "";
        }
    }
}