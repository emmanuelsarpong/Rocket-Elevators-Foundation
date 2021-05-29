using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
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
}