// TrevM 15/05/2021
// Remote Control Transmitter Case

$fn = 70;

//battery();
//pcb();
//case1();
//case2();
//bung();
//halfCase1(1);    // 0 or 1
//stick();
//halfStick();
//print1();
print2();
//SectChk();
//assy1();
//assy2();

module assy1()
{
    difference()
    {
        union()
        {
            case1();
            //case2();
            translate([-24.5,-13,2])  battery();
            translate([-24.5,-14,14]) pcb(0);
            translate([-8.5,0,16.5])  stick();
            //translate([-0.5,22,14])  bung();
        }
        // remove front half
        //translate([-30,-30,-1]) cube([60,30,40]);
        // remove back half
        //translate([-30,0,-1]) cube([60,30,40]);
        // remove left
        //translate([-30,-30,-1]) cube([21.5,60,40]);
        // remove small left
        //translate([-30,-30,-1]) cube([10,60,40]);
        // remove right
        //translate([-8.5,-30,-1]) cube([40,60,40]);
        // remove bottom part
        //translate([-30,-30,-1]) cube([60,60,14]);
        
    }
}

module assy2()
{
    difference()
    {
        union()
        {
            case2();
            translate([-24.5,-13,5])  battery();
            translate([-24.5,-41,5])  pcb(1);
            translate([-24.5, 13,5])  pcb(2);
            translate([-8.5,-27,7.5]) stick();
            translate([-8.5, 27,7.5]) stick();
        }
        // remove front half
        //translate([-30,-30,-1]) cube([60,30,40]);
        // remove back half
        //translate([-30,0,-1]) cube([60,30,40]);
        // remove left
        //translate([-30,-50,-1]) cube([21.5,100,40]);
        // remove small left
        //translate([-30,-40,-1]) cube([22,80,40]);
        // remove right
        //translate([-8.5,-30,-1]) cube([40,60,40]);
        // remove bottom part
        //translate([-30,-30,-1]) cube([60,60,14]);
        // remove top part
        //translate([-30,-50,9]) cube([60,100,30]);
        
    }
}

module print1()
{
    translate([0,2,14.77])
        rotate([-71.5,0,0])
            halfCase1(0); 
    translate([0,-2,14.77])
        rotate([71.5,0,0])
            halfCase1(1);
    translate([-22,-15,0])
        rotate([90,0,-90])
            halfStick();
    translate([-22,15,0])
        rotate([90,0,-90])
            halfStick();
    translate([25,-10,2])
        rotate([90,0,90])
            bung();
}

//print2();
module print2()
{
    ChgEnd2();
    ChgMid2();
    SwMid2();
    SwEnd2();
}

//SectChk();
module SectChk()
{
    translate([-26,0,0]) case2();
    // add 0.1 to Y to see join in parts
    translate([ 28,-45, -2]) rotate([-90,0,0]) ChgEnd2();
    translate([ 28,-26,-28]) rotate([-90,0,0]) ChgMid2();
    translate([ 28, 27,-27]) rotate([ 90,0,0]) SwMid2();
    translate([ 28, 46, -2]) rotate([ 90,0,0]) SwEnd2();
}

//ChgEnd2();
module ChgEnd2()
{
    translate([0,-2,45]) difference()
    {
        rotate([90,0,0])
            case2();
        translate([-32,-29,-26])
            cube([64,30,100]);
    }
}

//ChgMid2();
module ChgMid2()
{
    translate([0,-28,26]) difference()
    {
        rotate([90,0,0])
            case2();
        translate([-32,-29,0])
            cube([64,30,100]);
        translate([-32,-29,-52])
            cube([64,30,26]);
    }
}

//SwEnd2();
module SwEnd2()
{
    translate([0,2,46]) difference()
    {
        rotate([-90,0,0])
            case2();
        translate([-32,-0.1,-27])
            cube([64,30,100]);
    }
}

//SwMid2();
module SwMid2()
{
    translate([0,28,27]) difference()
    {
        rotate([-90,0,0])
            case2();
        translate([-32,-0.1,0])
            cube([64,30,100]);
        translate([-32,-0.1,-52])
            cube([64,30,25]);
    }
}


module case2()
{
    difference()
    {
        union()
        {
            translate([-8.5,-27,8]) difference()
            {
                sphere(r = 18);
                translate([-18.5,-18.5,-18.5])
                    cube([37,37,18.5]);
            }
            translate([-8.5, 27,8]) difference()
            {
                sphere(r = 18);
                translate([-18.5,-18.5,-18.5])
                    cube([37,37,18.5]);
            }
            hull()
            {
                translate([-24,-41,4]) sphere(d=8);
                translate([-24, 42,4]) sphere(d=8);
                translate([-24,-41,9]) sphere(d=8);
                translate([-24, 42,9]) sphere(d=8);
                translate([ 21,-41,4]) sphere(d=8);
                translate([ 21, 42,4]) sphere(d=8);
                translate([ 21,-41,9]) sphere(d=8);
                translate([ 21, 42,9]) sphere(d=8);
            }
        }
        translate([-8.5,-27,8]) difference()
        {
            sphere(r = 16);
            translate([-18.5,-18.5,-18.5])
                cube([37,37,18.5]);
        }
        translate([-8.5,-27,8]) cylinder(r1 = 6, r2 = 10,h=20);
        translate([-8.5, 27,8]) difference()
        {
            sphere(r = 16);
            translate([-18.5,-18.5,-18.5])
                cube([37,37,18.5]);
        }
        translate([-8.5, 27,8]) cylinder(r1 = 6, r2 = 10,h=20);
        hull()
        {
            translate([-24,-41,4]) sphere(d=5);
            translate([-24, 41,4]) sphere(d=5);
            translate([-24,-41,9]) sphere(d=5);
            translate([-24, 41,9]) sphere(d=5);
            translate([ 21,-41,4]) sphere(d=5);
            translate([ 21, 41,4]) sphere(d=5);
            translate([ 21,-41,9]) sphere(d=5);
            translate([ 21, 41,9]) sphere(d=5);
        }
        // clear LED
        translate([-7.4,-45,9])
            rotate([-90,0,0])
                cylinder(d=6,h=10);
        // clear USB
        translate([-24.5,-45,4])
            cube([12,10,7]);
        // clear LCD
        translate([7.5,-42,10])
            cube([15,29.5,10]);
        // clear switch
        translate([-14,41,4.5])
            cube([7.5,5,3.5]);
        // clear switch
        translate([-20.3,40,3])
            cube([20.5,5,6.5]);
        // clear program
        translate([0.5,41,6])
            cube([17,6,5.5]);
    }
    // LCD Bezel
    difference()
    {
        hull()
        {
            // -15 -> -42 = -27
            translate([7.5,-42,11.5])
                cylinder(d=1.5,h=3);
            translate([7.5,-27+15,11.5])
                cylinder(d=1.5,h=3);
            translate([22.5,-42,11.5])
                cylinder(d=1.5,h=3);
            translate([22.5,-27+15,11.5])
                cylinder(d=1.5,h=3);
        }
        // clear LCD
        translate([7.5,-42,11.4])
            cube([15,30,2.5]);
        // clear viewport
        translate([9,-27-13.5,13])
            cube([12.5,23,2]);
    }
    // USB support
    difference()
    {
        // y -18 -> -40
        // v 12 -> 
        translate([-26,-44.1,1.8])
            cube([15,2.8,9.4]);
        // clear USB connector
        translate([-24.5,-44.4,4])
            cube([12,2,6.9]);
        // clear USB
        translate([-23.2,-44,5.5])
            cube([8.8,6,4.2]);
    }
    // lcd supports
    translate([6.75,-43,10.5]) difference()
    {
        cube([17,32,1]);
        translate([2,-0.1,-0.1])
            cube([12.5,31.2,1.2]);
    }
    // main pcb supports
    translate([-9,-43.5,1]) difference()
    {
        cube([28,3.3,5]);
        translate([-0.1,2,3.5])
            cube([27,3,3]);
    }
    translate([-26.7,-15,1]) difference()
    {
        cube([46.5,2,5]);
        translate([1.7,-1,3.5])
            cube([43,2.5,3]);
    }
    // other pcb supports
    translate([-26.7, 12,1]) difference()
    {
        cube([46.5,2,5]);
        translate([1.7,0.5,3.5])
            cube([43,2.5,3]);
    }
    translate([-26.7, 39,1]) difference()
    {
        cube([46.5,5,5]);
        translate([1.7,-1,3.5])
            cube([43,2.5,3]);
        translate([6.3,-1.1,0])
            cube([20.6,7,10]);
    }
    // battery support
    //translate([-26.7,-10,1]) cube([46.5,20,3.5]);
}

module halfCase1(side)
{
    difference()
    {
        case1();
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

// bung for program port
module bung()
{
    // cap straight
    cube([19,1,4.5]);
    // cap bent
    translate([0,0.1,4])
        rotate([29,0,0])
            cube([19,1,4.5]);
    translate([1,-2,1]) difference()
    {
        cube([17,2.1,5.5]);
        translate([1,-1,1])
            cube([15,2.1,3.5]);
        translate([0,2.5,4])
            rotate([29,0,0])
                cube([19,1,4.5]);
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

Orad = 1.5;

module case1()
{
    difference()
    {
        // case
        union()
        {
            // dome
            translate([-8.5,0,16]) difference()
            {
                sphere(r = 18);
                translate([-18.5,-18.5,-18.5])
                    cube([37,37,18.5]);
            }
            // body
            hull()
            {
                // bottom corners
                translate([-25.5,-14.5,1.5])
                    sphere(Orad);
                translate([-25.5,14.5,1.5])
                    sphere(Orad);
                translate([19.5,-14.5,1.5])
                    sphere(Orad);
                translate([19.5,14.5,1.5])
                    sphere(Orad);
                // middle
                translate([-25.5,-18,12])
                    sphere(Orad);
                translate([-25.5,18,12])
                    sphere(Orad);
                translate([23.5,-18,12])
                    sphere(Orad);
                translate([23.5,18,12])
                    sphere(Orad);
                // middle
                translate([-25.5,-18,18])
                    sphere(Orad);
                translate([-25.5,18,18])
                    sphere(Orad);
                translate([23.5,-18,18])
                    sphere(Orad);
                translate([23.5,18,18])
                    sphere(Orad);
                // top corners
                translate([-24.5,-16,21.5])
                    sphere(Orad);
                translate([-24.5,16,21.5])
                    sphere(Orad);
                translate([22,-16,21.5])
                    sphere(Orad);
                translate([22,16,21.5])
                    sphere(Orad);
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
                sphere(Orad);
            translate([-24,13,3])
                sphere(Orad);
            translate([18,-13,3])
                sphere(Orad);
            translate([18,13,3])
                sphere(Orad);
            // middle
            translate([-24,-16.5,12.5])
                sphere(Orad);
            translate([-24,16.5,12.5])
                sphere(Orad);
            translate([22,-16.5,12.5])
                sphere(Orad);
            translate([22,16.5,12.5])
                sphere(Orad);
            // middle
            translate([-24,-16.5,17.5])
                sphere(Orad);
            translate([-24,16.5,17.5])
                sphere(Orad);
            translate([22,-16.5,17.5])
                sphere(Orad);
            translate([22,16.5,17.5])
                sphere(Orad);
            // top corners
            translate([-23,-14.5,20])
                sphere(Orad);
            translate([-23,14.5,20])
                sphere(Orad);
            translate([20.5,-14.5,20])
                sphere(Orad);
            translate([20.5,14.5,20])
                sphere(Orad);
        }
        // clear LED
        translate([-7.4,-20.5,18])
            rotate([-90,0,0])
                cylinder(d=6,h=10);
        // clear USB
        translate([-24,-20.5,13])
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
    // USB support
    difference()
    {
        translate([-25,-18,12])
            cube([13,3,10]);
        // clear USB connector
        translate([-24,-19,13])
            cube([11,3.5,8]);
        // clear LED
        //translate([-9.5,-19.3,19])
        //    rotate([-90,0,0])
        //        cylinder(d=6,h=10);
        // clear USB
        translate([-23.2,-19,15])
            cube([8.8,6,4.2]);
        translate([-26,-21.47,19])
            rotate([-30,0,0])
                cube([15,2,5]);
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
    translate([-4.5,-19,13]) difference()
    {
        cube([12,5.5,3]);
        translate([-0.1,5,0.75])
            cube([12.2,1,1.5]);
    }
    
}

// brown are external connectors
module pcb(sw)
{
    // use step/stl for accuracy
    /*
    rotate([180,0,90])
        translate([-114,126.5,-1])
            import ("RcCtlHw.stl");
    */
    // pcb
    color("lightgreen")
        cube([42,27,1]);
    if (sw != 2)
    {
        // USB
        color("silver")
            translate([1.7,0,0.9])
                cube([8,5,3.5]);
        // LED
        translate([17.15,-2.5,3.9])
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
    }
    if (sw != 1)
    {
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
    }
    // connector
    translate([25,23.5,0.9])
        color("yellow") cube([16.5,2.5,2.6]);
    if (sw != 1)
    {
        translate([25.5,26.5,1.5])
            color("brown") cube([16,9,4.5]);
    }
    // joystick
    //   body
    translate([9,7,0.9])
        color("silver") cube([14,14,10.1]);
    //  vert axis
    translate([16.2,6,6.9])
        color("white")
            rotate([-90,0,0]) cylinder(d=2.5,h=5);
    //  vert resistor
    translate([11,20.9,0.9])
        color("green") cube([10,3,10.6]);
    //  horiz axis
    translate([8,13.8,7])
        color("white")
            rotate([0,90,0]) cylinder(d=3.5,h=5);
    //  horiz resistor
    translate([23,9,0.9])
        color("green") cube([3,10,10.6]);
    //  lever
    translate([16.2,13.8,9.9])
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
    if (sw != 2)
    {
        // LCD
        translate([31.5,-0.5,7])
            color("black") cube([14,28,1.5]);
        translate([33,1,7.5])
            color("blue") cube([11.5,22,1.1]);
        // ESP
        translate([27,4.5,-0.5])
            color("black") cube([20.5,12.5,0.5]);
        translate([27.5,6,-3.5])
            color("silver") cube([13,10.1,3]);
        // regulator
        translate([2.5,10.9,-3])
            color("black") cube([5.7,5.7,3]);
    }
    // components
    translate([0,1,-2.5])
        color("silver")
            cube([41,25,2.6]);
}

module battery()
{
    cube([43,25,6]);
}
