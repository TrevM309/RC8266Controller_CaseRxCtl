// TrevM 15/05/2021
// Remote Control Transmitter Case

$fn = 70;

//battery();
//pcb();
//case();
//halfCase(1);    // 0 or 1
//stick();
//halfStick();
print();
//assy();

module assy()
{
    difference()
    {
        union()
        {
            case();
            translate([-24.5,-13,2]) battery();
            translate([-24.5,-14,14]) pcb();
            translate([-8.5,0,16.5]) stick();
        }
        // remove front half
        translate([-30,-30,-1]) cube([60,30,40]);
        // remove back half
        //translate([-30,0,-1]) cube([60,30,40]);
        // remove left
        //translate([-30,-30,-1]) cube([21.5,60,40]);
        // remove right
        //translate([-8.5,-30,-1]) cube([40,60,40]);
        // remove bottom part
        //translate([-30,-30,-1]) cube([60,60,14]);
        
    }
}

module print()
{
    translate([0,2,14.77])
        rotate([-71.5,0,0])
            halfCase(0); 
    translate([0,-2,14.77])
        rotate([71.5,0,0])
            halfCase(1);
    translate([-22,0,0])
        rotate([90,0,-90])
            halfStick();
    translate([19,0,0])
        rotate([90,0,90])
            halfStick();
}

module halfCase(side)
{
    difference()
    {
        case();
        if (side == 0)
        {
            // remove front half
            translate([-30,-30,-1]) cube([60,30,40]);
        }
        else
        {
            // remove back half
            translate([-30,0,-1]) cube([60,30,40]);
        }
    }
}

module halfStick()
{
    difference()
    {
        stick();
        translate([-15,-15,7])
            cube([30,15,22]);
    }
}

module stick()
{
    // movement shield
    difference()
    {
        union()
        {
            difference()
            {
                sphere(r = 15.5);
                sphere(r = 14);
                translate([0,0,-16])
                    cylinder(r = 15.7,h=24);
            }
            // shaft
            translate([0,0,14])
                cylinder(d=6,h=10.1);
        }
        translate([0,0,10]) difference()
        {
            cylinder(d=4,h=5.9);
            translate([-3,-3,-0.1])
                cube([3-(3.5/2),6,6.2]);
            translate([3.5/2,-3,-0.1])
                cube([3-(3.5/2),6,6.2]);
        }
    }
    // top button
    translate([0,0,24]) difference()
    {
        scale([1,1,0.4])
            sphere(d=18);
        translate([0,0,-5])
            cylinder(d=18.5,h=5);
            
    }
    // locate
    translate([0,0,14-3]) difference()
    {
        cylinder(d1=6,d2=9,h=3);
        translate([0,0,-0.1]) difference()
        {
            cylinder(d=4,h=8);
            translate([-3,-3,-0.1])
                cube([3-(3.5/2),6,8.2]);
            translate([3.5/2,-3,-0.1])
                cube([3-(3.5/2),6,8.2]);
        }
    }
}

module case()
{
    difference()
    {
        // case
        union()
        {
            translate([-8.5,0,16]) difference()
            {
                sphere(r = 18);
                translate([-18.5,-18.5,-18.5])
                    cube([37,37,18.5]);
            }
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
                translate([-23,-14.5,21.5])
                    sphere(1.5);
                translate([-23,14.5,21.5])
                    sphere(1.5);
                translate([22,-14.5,21.5])
                    sphere(1.5);
                translate([22,14.5,21.5])
                    sphere(1.5);
            }
        }
        // hollow out
        translate([-8.5,0,16])
        {
            difference()
            {
                sphere(r = 16.5);
                translate([-17,-17,-17])
                    cube([34,34,17]);
            }
            cylinder(r1 = 6, r2 = 10,h=20);
        }
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
            translate([-24,-16.5,17.5])
                sphere(1.5);
            translate([-24,16.5,17.5])
                sphere(1.5);
            translate([22,-16.5,17.5])
                sphere(1.5);
            translate([22,16.5,17.5])
                sphere(1.5);
            // top corners
            translate([-19,-13,20])
                sphere(1.5);
            translate([-19,13,20])
                sphere(1.5);
            translate([20.5,-13,20])
                sphere(1.5);
            translate([20.5,13,20])
                sphere(1.5);
        }
        // clear LED
        translate([-9.5,-20.5,19])
            rotate([-90,0,0])
                cylinder(d=6,h=10);
        // clear USB
        translate([-24,-20.5,12])
            cube([11,10,9]);
        // clear switch
        translate([-14,15.5,13.5])
            cube([7.5,5,3.5]);
        // clear program
        translate([0.5,14,15])
            cube([17,6,5.5]);
        // clear LCD
        translate([6.5,-15,20.5])
            cube([15,29.5,10]);
        
        // remove front half
        //translate([-28,-20,-0.5]) cube([54,20,40]);
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
            translate([6.5,-15,20.5])
                cylinder(d=1.5,h=3);
            translate([6.5, 15,20.5])
                cylinder(d=1.5,h=3);
            translate([21.5,-15,20.5])
                cylinder(d=1.5,h=3);
            translate([21.5, 15,20.5])
                cylinder(d=1.5,h=3);
        }
        // clear LCD
        translate([6.5,-15,20.4])
            cube([15,30,2.5]);
        // clear viewport
        translate([8,-13.5,22])
            cube([12.5,23,2]);
    }
    // battery supports
    translate([-25.5,-14,11])
    {
        rotate([0,90,0])
            cylinder(d=3,h=49);
        translate([0,-4.5,-0.75])
            cube([49,4.5,1.5]);
    }
    translate([-25.5,13,11])
    {
        rotate([0,90,0])
            cylinder(d=3,h=49);
        translate([0,0,-0.75])
            cube([49,5.5,1.5]);
    }
    // lcd supports
    translate([5.75,-16,19.5]) difference()
    {
        cube([17,27,1]);
        translate([2,-0.1,-0.1])
            cube([12.5,27.2,1.2]);
    }
    // pcb supports
    //  pcb buffer joystick end
    translate([-25.5,-6,12])
        cube([0.5,12,5]);
    //  pcb support at switch corner
    translate([-25.5,12.5,13]) difference()
    {
        cube([5,7,3]);
        translate([-0.1,-0.1,0.75])
            cube([5.2,0.75,1.5]);
    }
    //  pcb support at debug corner
    translate([17,4,13]) difference()
    {
        cube([7,7,3]);
        translate([-0.1,-0.1,0.75])
            cube([0.75,7.2,1.5]);
    }
    //  pcb support by LED
    translate([-6,-19,13]) difference()
    {
        cube([12,5.5,3]);
        translate([-0.1,5,0.75])
            cube([12.2,1,1.5]);
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
        translate([2,-1,0.9])
            cube([8,5,3.5]);
    color("brown")
        translate([1,-3-10,-1.5])
            cube([10,10,8]);
    // LED
    translate([15,-3.5,5])
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
    //translate([16,14,9.9])
    //    color("white",0.4)
    //        cylinder(d1=10,d2=17,h=6.1);
    // LCD
    translate([31.5,-0.5,7])
        color("black") cube([14,28,1.5]);
    translate([33,1,7.5])
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
