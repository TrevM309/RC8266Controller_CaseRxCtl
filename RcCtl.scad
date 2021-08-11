// TrevM 15/05/2021
// Remote Control Transmitter Case

$fn = 100;

//battery();
//pcb();
//pcb2();
//case1();
//case2();
//bung();
//halfCase1(1);    // 0 or 1
//stick();
//halfStick();
print1();
//translate([0,0,-14.1]) front2();
//print2();
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
            translate([-24.5,-13,2])  battery();
            translate([-24.5,-14,14]) pcb(0);
            translate([-8.5,0,16.5])  stick();
            //translate([-0.5,22,14])  bung();
        }
        // remove front half
        //translate([-30,-30,-1]) cube([60,30,40]);
        translate([-30,-30,-1]) cube([60,45,60]);
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
        //translate([-30,-30,-1]) cube([60,60,20]);
    }
}

module assy2()
{
    difference()
    {
        union()
        {
            case2();
            translate([-22,35,1.6])  rotate([0,0,-90]) battery();
            translate([-24.5,-41+10,12])  pcb2(3);
            translate([-8.5,-27+10,14.7]) stick();
            translate([-8.5, 33-10,14.7]) stick();
        }
        // remove front half (left joystick and left half LCD)
        //translate([-40,-38,-1]) cube([70,40,45]);
        // remove back half
        //translate([-30,0,-1]) cube([60,30,40]);
        // remove left
        //translate([-40,-50,-1]) cube([31.5,100,45]);
        // remove small left
        //translate([-30,-40,-1]) cube([22,80,40]);
        // remove right
        //translate([-8.5,-30,-1]) cube([40,60,40]);
        // remove bottom part
        //translate([-30,-40,-1]) cube([60,85,9]);
        //translate([-30,-40,-1]) cube([60,85,3]);
        // remove top part
        //translate([-30,-50,14.1]) cube([60,100,30]);
        //translate([-30,-50,10]) cube([60,100,35]);
        //translate([-30,-50,19.9]) cube([60,100,30]);
    }
}

module print1()
{
    translate([-50,-30,0])
        cube([77,60,0.3]);
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
    //translate([25,-10,2])
    //    rotate([90,0,90])
    //        bung();
}

//print2();
module print2()
{
    //translate([-100,0,0]) case2();
    translate([-34,0,0]) base2();
    //translate([-30,0,0]) top2();
    //translate([ 30,0,-14]) top2();
    //translate([-19,0,-8]) rotate([0,90,0]) front2();
    translate([18,0,-14.1]) front2();
    //translate([ 22,0,-8]) back2();
    translate([ 22, 32,-3]) rotate([ 90,0,0]) left2();
    translate([ 22,-32, 3]) rotate([-90,0,0]) right2();
    translate([ 28,-13, 0]) rotate([ 90,0,  0]) halfStick();
    translate([ 39,-15, 0]) rotate([ 90,0, 90]) halfStick();
    translate([ 28, 13, 0]) rotate([ 90,0,180]) halfStick();
    translate([ 39, 15, 0]) rotate([ 90,0, 90]) halfStick();
}

module base2()
{
    difference()
    {
        case2();
        translate([-28,-36,14.1]) cube([51,80,20]);
    }
}

module top2()
{
    difference()
    {
        case2();
        translate([-28,-36,-1]) cube([51,80,15.1]);
    }
}

module front2()
{
    difference()
    {
        top2();
        translate([-8,-36,13]) cube([30,79,18]);
    }
}

module back2()
{
    difference()
    {
        top2();
        translate([-27,-36,13]) cube([19,79,18]);
    }
}

module left2()
{
    difference()
    {
        back2();
        translate([-9,-35,13]) cube([32,38,18]);
    }
}

module right2()
{
    difference()
    {
        back2();
        translate([-9,  3,13]) cube([32,38,18]);
    }
}

module case2()
{
    far = -29;
    nr  =  35;
    lft = -20.5;
    rgt =  16;
    bx1 = 5;
    bx2 = bx1+16;
    by2 = -13;
    by1 = by2+30.5;
    bz = 14;
    pht = 12;
    
    difference()
    {
        union()
        {
            translate([-8.5,-17,14.5]) difference()
            {
                sphere(r = 18);
                translate([-18.5,-18.5,-18.5])
                    cube([37,37,18.5]);
            }
            translate([-8.5, 23,14.5]) difference()
            {
                sphere(r = 18);
                translate([-18.5,-18.5,-18.5])
                    cube([37,37,18.5]);
            }
            hull()
            {
                translate([lft,far,6])  sphere(d=12);
                translate([lft, nr,6])  sphere(d=12);
                translate([lft,far,14]) sphere(d=12);
                translate([lft, nr,14]) sphere(d=12);
                translate([rgt,far,6])  sphere(d=12);
                translate([rgt, nr,6])  sphere(d=12);
                translate([rgt,far,14]) sphere(d=12);
                translate([rgt, nr,14]) sphere(d=12);
            }
            // LCD Bezel
            hull()
            {
                // -15 -> -42 = -27
                translate([bx1,by2,bz]) cylinder(d=1.5,h=8.5);
                translate([bx1,by1,bz]) cylinder(d=1.5,h=8.5);
                translate([bx2,by2,bz]) cylinder(d=1.5,h=8.5);
                translate([bx2,by1,bz]) cylinder(d=1.5,h=8.5);
            }
        }
        translate([-8.5,-17,14.5]) difference()
        {
            sphere(r = 16.5);
            translate([-18.5,-18.5,-18.5])
                cube([37,37,18.5]);
        }
        translate([-8.5,-17,14.5]) cylinder(r1 = 6, r2 = 10,h=20);
        translate([-8.5, 23,14.5]) difference()
        {
            sphere(r = 16.5);
            translate([-18.5,-18.5,-18.5])
                cube([37,37,18.5]);
        }
        translate([-8.5, 23,14.5]) cylinder(r1 = 6, r2 = 10,h=20);
        hull()
        {
            translate([lft,far,6])  sphere(d=9);
            translate([lft, nr,6])  sphere(d=9);
            translate([lft,far,14]) sphere(d=9);
            translate([lft, nr,14]) sphere(d=9);
            translate([rgt,far,6])  sphere(d=9);
            translate([rgt, nr,6])  sphere(d=9);
            translate([rgt,far,14]) sphere(d=9);
            translate([rgt, nr,14]) sphere(d=9);
        }
        // clear LED
        translate([-18,-24.2,15.2])
            rotate([0,-90,0])
                cylinder(d=5.5,h=10);
        // clear switch
        translate([-27,20.9,10.7]) cube([5,7.5,3.5]);
        // clear USB
        translate([-32,-2,9]) cube([11,10,9]);
        // clear LCD
        translate([bx1+0.5,by2+0.5,19.5]) cube([15,29.5,2.5]);
        translate([bx1+4,by2+0.5,12])     cube([8,28,10]);
        // clear viewport
        translate([bx1+2,by2+5,12]) cube([12,23.5,11]);
        // clear program
        translate([17,18.8,pht]) cube([5.5,17,6]);
    }
    // pcb supports
    difference()
    {
        union()
        {
            translate([-21,-28.5,6.5])
            {
                sphere(d=11);
                cylinder(d=11,h=7.5);
                rotate([0,90,0]) cylinder(d=11,h=37);
                translate([0,-5.5,0]) cube([37,11,7.5]);
            }
            translate([-21, 35,6.5])
            {
                
                sphere(d=11);
                cylinder(d=11,h=7.5);
                rotate([0,90,0]) cylinder(d=11,h=37);
                translate([0,-5.5,0]) cube([37,11,7.5]);
            }
            translate([ 16,-28.5,6.5])
            {
                sphere(d=11);
                cylinder(d=11,h=7.5);
                rotate([-90,0,0]) cylinder(d=11,h=63.5);
                translate([0,63.5,0])
                {
                    sphere(d=11);
                    cylinder(d=11,h=7.5);
                }
                translate([-5.5,0,0]) cube([11,63.5,7.5]);
            }
        }
        translate([-26.6,-29.5,1.4]) cube([43.5,65,13]);
        translate([-25,-31.5,12])
        {
            translate([0.1,0.1,0]) cube([43,44.5,3]);
            translate([5,0.1,0]) cube([38.1,68.5,3]);
        }
        // clear program
        translate([17,18.8,pht]) cube([5.5,17,6]);
    }
    // Battery supports
    translate([-20,-10.5,1])   cube([20,1.5,5]);
    translate([-24, -4,1.4]) cube([1.5,35,5]);
    translate([  4, -4,1])   cube([1.5,35,5]);
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
                translate([-25.5,-14.5,1.5]) sphere(Orad);
                translate([-25.5,14.5,1.5])  sphere(Orad);
                translate([19.5,-14.5,1.5])  sphere(Orad);
                translate([19.5,14.5,1.5])   sphere(Orad);
                // middle
                translate([-25.5,-18,12]) sphere(Orad);
                translate([-25.5,18,12])  sphere(Orad);
                translate([23.5,-18,12])  sphere(Orad);
                translate([23.5,18,12])   sphere(Orad);
                /*
                // middle
                translate([-25.5,-18,18]) sphere(Orad);
                translate([-25.5,18,18])  sphere(Orad);
                translate([23.5,-18,18])  sphere(Orad);
                translate([23.5,18,18])   sphere(Orad);
                */
                // top corners
                translate([-24.5,-15.6,21.5]) sphere(Orad);
                translate([-24.5, 15.6,21.5]) sphere(Orad);
                translate([ 22,  -15.6,21.5]) sphere(Orad);
                translate([ 22,   15.6,21.5]) sphere(Orad);
            }
        }
        // hollow out
        translate([-8.5,0,16])
        {
            difference()
            {
                sphere(r = 16.5);
                translate([-17,-17,-17]) cube([34,34,17]);
            }
            cylinder(r1 = 6, r2 = 10,h=20);
        }
        hull()
        {
            // bottom corners
            translate([-24,-13,3]) sphere(Orad);
            translate([-24,13,3])  sphere(Orad);
            translate([18,-13,3])  sphere(Orad);
            translate([18,13,3])   sphere(Orad);
            // middle
            translate([-24,-16.5,12.5]) sphere(Orad);
            translate([-24,16.5,12.5])  sphere(Orad);
            translate([22,-16.5,12.5])  sphere(Orad);
            translate([22,16.5,12.5])   sphere(Orad);
            /*
            // middle
            translate([-24,-16.5,17.5]) sphere(Orad);
            translate([-24,16.5,17.5])  sphere(Orad);
            translate([22,-16.5,17.5])  sphere(Orad);
            translate([22,16.5,17.5])   sphere(Orad);
            */
            // top corners
            translate([-23,-14.5,20])  sphere(Orad);
            translate([-23,14.5,20])   sphere(Orad);
            translate([20.5,-14.5,20]) sphere(Orad);
            translate([20.5,14.5,20])  sphere(Orad);
        }
        // clear LED
        translate([-7.4,-20.5,18])
            rotate([-90,0,0])
                cylinder(d=6,h=10);
        // clear USB
        translate([-24,-20.5,13]) cube([11,10,8]);
        // clear switch
        translate([-14,15.5,13.5]) cube([7.5,5,3.5]);
        translate([-20,12.4,12.2]) cube([20,5,6]);
        // clear program
        translate([0.5,14,15]) cube([17,6,5.5]);
        // clear LCD
        translate([6.5,-15,20.5]) cube([15,29.5,10]);
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
        translate([-26,-20,15])
            rotate([-14,0,0])
                cube([15,2,8]);
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
        translate([5,10,-0.1])
            cube([7.5,27.2,1.2]);
    }
    // pcb supports
    //  pcb buffer joystick end
    translate([-25.5,-6,12])
        cube([0.5,12,5]);
    //  pcb support at switch corner
    translate([-25.5,11.5,13]) difference()
    {
        cube([5,6,3]);
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
    translate([-2.5,-18.5,13]) difference()
    {
        cube([10,5,3]);
        translate([-0.1,4,0.75])
            cube([12.2,2,1.5]);
    }
    
}

//pcb2();
// dual joystick controller
module pcb2(sw)
{
    // use step/stl for accuracy
    //rotate([180,0,90]) translate([-114,126.5,-1]) import("RcCtlHw2.stl");
    // pcb
    if (sw < 4)
    {
        color("darkgreen")
        {
            translate([0.1,0.1,-0.6]) cube([42,44.5,0.8]);
            translate([5,0.1,-0.6]) cube([37.1,67.75,0.8]);
        }
    }
    if (sw != 2)
    {
        // USB
        color("silver") translate([-0.5,30,0]) cube([5,8,3.5]);
        if (sw < 3)
        {
            color("brown") translate([-11,29,-2]) cube([10,10,8]);
        }
        // LED
        translate([0,6.7,3.1])
        {
            color("lightblue")
            {
                sphere(2.5);
                rotate([0,90,0])
                {
                    cylinder(d=5,h=6.2);
                    translate([0,0,5.2])
                        cylinder(d=6,h=1);
                    
                }
            }
            color("silver")
                translate([6.2,-2,-3.2])
                    cube([1,4,3.2]);
        }
    }
    if (sw != 1)
    {
        // switch
        translate([4.8,50.5,-2.3])
        {
            rotate([0,0,90])
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
    // program connector
    translate([35,50.8,0.1])
        color("yellow") cube([2.5,15.1,2.6]);
    if ((sw != 1) && (sw < 3))
    {
        translate([37.8,50.3,3])
            color("brown") cube([9,16,4.5]);
    }
    // right joystick
    translate([0,0,-0.8])
        joystick();
    // right joystick
    translate([0,40.2,-0.8])
        joystick();
    if (sw != 2)
    {
        // LCD
        translate([32-1.3,20-0.5,8])
            color("black") cube([14,28,1.5]);
        translate([32,20+3.75,8+0.5])
            color("blue") cube([11.3,22,1.1]);
        // ESP
        translate([27-5,5.1+21.5,-0.5-0.6])
            color("black") cube([20.5,12.5,0.5]);
        translate([27.5-5,6.25+21.5,-3.5-0.6])
            color("silver") cube([13,10.1,3]);
        // regulator
        translate([2.2,10.5,-3])
            color("black") cube([6.2,6.5,3]);
        translate([1.3,11,-1.2])
            color("silver") cube([2.2,5.5,1]);
    }
    // components
    //translate([0,1,-2.5]) color("silver") cube([41,25,2.6]);
}

module joystick()
{
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
}

// single joystick controller
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
