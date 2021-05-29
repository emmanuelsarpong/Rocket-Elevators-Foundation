using System;
using System.Collections.Generic;
using System.Text;

namespace Rocket_Elevators_Corporate_Controller
{
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