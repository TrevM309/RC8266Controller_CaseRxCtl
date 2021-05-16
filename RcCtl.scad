// TrevM 15/05/2021
// Remote Control Transmitter Case

$fn = 50;

//battery();
//pcb();
//case();
assy();

module assy()
{
    case();
    //translate([-24.5,-13,2]) battery();
    //translate([-24.5,-14,14]) pcb();
}

module case()
{
    difference()
    {
        // case
        hull()
        {
            // bottom corners
            translate([-25.5,-14.5,1.5])
                sphere(1.5);
            translate([-25.5,14.5,1.5])
                sphere(1.5);
            translate([19.5,-14.5,1.5])
                sphere(1.5);
            translate([19.5,14.5,1.5])
                sphere(1.5);
            // middle
            translate([-25.5,-18,12])
                sphere(1.5);
            translate([-25.5,18,12])
                sphere(1.5);
            translate([23.5,-18,12])
                sphere(1.5);
            translate([23.5,18,12])
                sphere(1.5);
            // middle
            translate([-25.5,-18,18])
                sphere(1.5);
            translate([-25.5,18,18])
                sphere(1.5);
            translate([23.5,-18,18])
                sphere(1.5);
            translate([23.5,18,18])
                sphere(1.5);
            // top corners
            translate([-20.5,-14.5,21.5])
                sphere(1.5);
            translate([-20.5,14.5,21.5])
                sphere(1.5);
            translate([20,-14.5,21.5])
                sphere(1.5);
            translate([20,14.5,21.5])
                sphere(1.5);
        }
        // hollow out
        hull()
        {
            // bottom corners
            translate([-24,-13,3])
                sphere(1.5);
            translate([-24,13,3])
                sphere(1.5);
            translate([18,-13,3])
                sphere(1.5);
            translate([18,13,3])
                sphere(1.5);
            // middle
            translate([-24,-16.5,12.5])
                sphere(1.5);
            translate([-24,16.5,12.5])
                sphere(1.5);
            translate([22,-16.5,12.5])
                sphere(1.5);
            translate([22,16.5,12.5])
                sphere(1.5);
            // middle
            translate([-24,-16.5,16.5])
                sphere(1.5);
            translate([-24,16.5,16.5])
                sphere(1.5);
            translate([22,-16.5,16.5])
                sphere(1.5);
            translate([22,16.5,16.5])
                sphere(1.5);
            // top corners
            translate([-19,-13,20])
                sphere(1.5);
            translate([-19,13,20])
                sphere(1.5);
            translate([18.5,-13,20])
                sphere(1.5);
            translate([18.5,13,20])
                sphere(1.5);
        }
        // clear LED
        translate([-4.5,-20.5,19])
            rotate([-90,0,0])
                cylinder(d=6,h=10);
        // clear USB
        translate([-16.5,-20.5,12])
            cube([11,10,9]);
        // clear switch
        translate([-14,15.5,13.5])
            cube([7.5,5,3.5]);
        // clear program
        translate([0.5,14,15])
            cube([17,6,5.5]);
        // clear LCD
        translate([3.5,-15,20.5])
            cube([15,29.5,2.5]);
        
        // remove front half
        //translate([-28,-20,-0.5]) cube([54,20,24]);
        // remove back half
        //translate([-28,0,-0.5]) cube([54,20,24]);
        // remove left
        //translate([-28,-20,-0.5]) cube([28,40,24]);
        // remove top
        //translate([-28,-20,12]) cube([54,40,14]);
        // remove bottom
        //translate([-28,-20,-0.5]) cube([54,40,11]);
        
    }
    // LCD Bezel
    difference()
    {
        hull()
        {
            translate([3.5,-15,20.5])
                cylinder(d=1.5,h=3);
            translate([3.5, 15,20.5])
                cylinder(d=1.5,h=3);
            translate([18.5,-15,20.5])
                cylinder(d=1.5,h=3);
            translate([18.5, 15,20.5])
                cylinder(d=1.5,h=3);
        }
        // clear LCD
        translate([3.5,-15,20.4])
            cube([15,30,2.5]);
        // clear viewport
        translate([5,-13.5,22])
            cube([12.5,23,2]);
    }
}

// brown are external connectors
module pcb()
{
    // pcb
    color("lightgreen")
        cube([42,27,1]);
    // USB
    color("silver")
        translate([10,-1,0.9])
            cube([8,5,3.5]);
    color("brown")
        translate([8.5,-3-10,-1.5])
            cube([10,10,8]);
        
    // LED
    translate([20,-5,5])
    {
        color("lightblue")
        {
            sphere(2.5);
            rotate([-90,0,0])
                cylinder(d=5,h=7);
        }
        color("silver")
            translate([-2,6.9,-4.5])
                cube([4,1,4.5]);
    }
    // switch
    translate([9,26.9,-1.5])
    {
        color("black")
        {
            // body
            cube([11,5,5.5]);
            // mounting plate
            translate([-4.5,4.5,0]) difference()
            {
                cube([20,0.5,5.5]);
                translate([2.5,-0.1,2.75])
                {
                    rotate([-90,0,0])
                        cylinder(d=2.5,h=0.7);
                    translate([15,0,0])
                        rotate([-90,0,0])
                            cylinder(d=2.5,h=0.7);
                }
            }
            // button (both pos)
            translate([2,4.9,1.25])
                cube([3,3.1,3]);
            translate([5.5,4.9,1.25])
                cube([3,3.1,3]);
        }
    }
    // connector
    translate([25,23.5,0.9])
        color("yellow") cube([16.5,2.5,2.6]);
    translate([25.5,26.5,1.5])
        color("brown") cube([16,9,4.5]);
    // joystick
    //   body
    translate([9,7,0.9])
        color("silver") cube([14,14,10.1]);
    //  vert axis
    translate([16,6,6.9])
        color("white")
            rotate([-90,0,0]) cylinder(d=2.5,h=5);
    //  vert resistor
    translate([11,20.9,0.9])
        color("green") cube([10,3,10.6]);
    //  horiz axis
    translate([8,14,6.9])
        color("white")
            rotate([0,90,0]) cylinder(d=3.5,h=5);
    //  horiz resistor
    translate([23,9,0.9])
        color("green") cube([3,10,10.6]);
    //  lever
    translate([16,14,9.9])
        color("white")
        {
            cylinder(d=3.3,h=8.1);
            translate([0.5,0,0])
                cylinder(d=3.3,h=8.1);
            translate([-0.5,0,0])
                cylinder(d=3.3,h=8.1);
        }
    //   mechanism
    translate([16,14,7])
        color("white")
            sphere(6);
    //   movement
    translate([16,14,9.9])
        color("white",0.4)
            cylinder(d1=10,d2=17,h=6.1);
    // LCD
    translate([28.5,-0.5,7])
        color("black") cube([14,28,1.5]);
    translate([30,1,7.5])
        color("blue") cube([11.5,22,1.1]);
    // ESP
    translate([27,4.5,-0.5])
        color("black") cube([20.5,12.5,0.5]);
    translate([27.5,6,-3])
        color("silver") cube([13,9.5,3]);
    // components
    translate([0,1,-2.5])
        color("silver")
            cube([41,25,2.6]);
}

module battery()
{
    cube([43,25,8]);
}
