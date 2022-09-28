# iiitb_3bit_rc-Three Bit Ring Counter
## INTRODUCTION <br/>

This project simulates the design of a 3-bit ring counter using verilog HDL. A ring counter works in a similar way as a shift register. The only difference is that the output of the last flip-flop is connected to the input of the first flip-flop. In this way, the counter forms a ring and hence is called ring counter.In this design, three D-Flip-flops are used with clock and ori(override input) signals.
## BLOCK DIAGRAM <br/>
![iiitb_3bit_rc](https://user-images.githubusercontent.com/64605104/181275677-2b2b20e7-2aea-40bc-9166-7bbf0fc9887e.png)


The above figure is the block diagram of a 3bit ring counter. The figure shows three D flip flop connected with a clock and an ORI signal. The design uses an active high ORI signal which sets the first flip flop to '1' and the other two flip flops to '0' when ORI is high. The circuit uses a positve edge triggered clock.<br/>





## WORKING <br/>
The counter is set to an initial state of *_'100'_* by the ORI signal. In the next positive edge of the clock, the values of the flip flops are shifted right and the output of last flip flop is sent to the first one. So, the next state becomes *_'010'_*. Similary after next positive edge of clock, the state of the counter becomes *_'001'_*. This continues until the ORI is again high which will set the counter back to *_'100'_*.<br/>
## RTL SIMULATION <br/>
![pre_layout_simulation](https://user-images.githubusercontent.com/64605104/183869521-f448bf16-5c2b-41d3-835d-e28d18be7ff2.png)

In the above waveform, ORI signal sets the counter to '100' and then the counter runs in a loop with three states until ORI is high again.




## TOOLS USED <br/>
**IVERILOG**<br/><br/>
Icarus Verilog is a Verilog simulation and synthesis tool.<br/>
To install iverilog, type the following command in the terminal:<br/>
```
$ sudo apt install iverilog 
```
**GTKWAVE**<br/><br/>
GTKWave is a VCD waveform viewer based on the GTK library. This viewer support VCD and LXT formats for signal dumps.
```
$ sudo apt install gtkwave 
```
<br/>






**YOSYS**<br/>
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.<br/>

Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.<br/>

Synthesis takes place in multiple steps:<br/>

-Converting RTL into simple logic gates.<br/>
-Mapping those gates to actual technology-dependent logic gates available in the technology libraries.<br/>
-Optimizing the mapped netlist keeping the constraints set by the designer intact.<br/><br/>
Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the yosys C++ code base.

Yosys is free software licensed under the ISC license (a GPL compatible license that is similar in terms to the MIT license or the 2-clause BSD license).<br/>
To install Yosys in Ubuntu, follow the following steps:
```
$ sudo apt-get install build-essential clang bison flex \ libreadline-dev gawk tcl-dev libffi-dev git \ graphviz xdot pkg-config python3 libboost-system-dev \ libboost-python-dev libboost-filesystem-dev zlib1g-dev
```
To configure the build system to use a specific compiler, use one of the following command:<br/>
```
$ make config-clang
$ make config-gcc
```
To build Yosys simply type 'make' in this directory.<br/>
```
$ make
$ sudo make install
$ make test
```
**Open Lane** <br/> <br/>
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

To read more about Open Lane visit: https://github.com/The-OpenROAD-Project/OpenLane <br/>
***To install Open Lane, follow the below instructions in the home directory:*** <br/>
```
$   apt install -y build-essential python3 python3-venv python3-pip
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
$   sudo make test
```



**Magic** <br/><br/>
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

***To build the pre-requisites, type the following commands:*** <br/>
```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev
```
***To install magic***:
```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```





## Gate Level Simulation <br/>
GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.<br/>
Below picture gives an insight of the procedure. Here while using iverilog, you also include gate level verilog models to generate GLS simulation.<br/>
![image](https://user-images.githubusercontent.com/64605104/183838608-b56e1d75-929d-492a-b112-8203a5e40cff.png)
<br/>









***To clone the repository and download the netlist files for simulation, enter the following command in your terminal***<br/>
```
$ git clone https://github.com/ArshKedia/iiitb_3bit_rc
```
***After cloning the git repository, type the following in "iiitb_3bit_rc" directory in the terminal for RTL Simulation.***<br/>
```
$ iverilog iiitb_3bit_rc.v iiitb_3bit_rc_tb.v
$ ./a.out 
$ gtkwave iiitb_3bit_rr_out.vcd
```
***For synthesis, run "yosys_run.sh" file in the same directory in terminal.***<br/>
```
$ yosys -s yosys_run.sh
```
The above commands create the netlist of iverilog code.<br/><br/>
***For Gate level syntheses(GLS), type the following in the same directory in terminal***<br/>
```
$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../iiitb_3bit_rc/verilog_model/primitives.v ../iiitb_3bit_rc/verilog_model/sky130_fd_sc_hd.v iiitb_3bit_rc_net.v iiitb_3bit_rc_tb.v
```
***To generate the simulation, type the following in the same directory in terminal***<br/>
```
$ ./a.out
$ gtkwave iiitb_3bit_rr.vcd
```





***NETLIST*** <br/>
In electronic design, a netlist is a description of the connectivity of an electronic circuit.In its simplest form, a netlist consists of a list of the electronic components in a circuit and a list of the nodes they are connected to. A network (net) is a collection of two or more interconnected components.<br/>


![netlist](https://user-images.githubusercontent.com/64605104/183865617-1d4ae102-8d9e-41be-b332-1c6edb217e21.png)
<br/>
The above picture shows the netlist of this project after synthesis.<br/>



## Post synthesis simulation <br/>

![post layout simulation](https://user-images.githubusercontent.com/64605104/183868633-b86ef8b9-1187-47bc-822a-e0247ad9c3bf.png)







## PHYSICAL DESIGN: <br/>
Physical design is process of transforming netlist into layout which is manufacture-able [GDS]. Physical design process is often referred as PnR (Place and Route). Main steps in physical design are placement of all logical cells, clock tree synthesis & routing. During this process of physical design timing, power, design & technology constraints have to be met. Further design might require being optimized w.r.t power, performance and area.

Simplified RTL to GDSII Flow: <br/>
![rtl_to_gdsII](https://user-images.githubusercontent.com/64605104/187434099-6ddba15c-1320-4308-93b4-7e659ba22406.jpeg)
<br/>
After GLS, the final layout is obtained using OpenLane using the following commands:<br/>
```
$   cd OpenLane/
$   cd designs/
$   mkdir iiitb_3bit_rc
$   cd iiitb_3bit_rc/
```
Then copy the config.json file in the current directory and type the following commands: <br/>
```
$   mkdir src
$   cd src/
```
Copy the iiitb_3bit_rc.v file in the current directory and type the following commands:<br/>
```
$   cd ../../../
$   sudo make mount
$   ./flow.tcl -design iiitb_3bit_rc
```
We now use Magic tool to view the layout that we made using openlane. To view the layout type the following commmands in the home directory.<br/>
```
$   cd /home/arsh/OpenLane/designs/iiitb_3bit_rc/runs/RUN_2022.08.21_09.15.00/results/final/def
$   magic -T /home/arsh/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../../tmp/merged.max.lef def read iiitb_3bit_rc.def
```

![final_layout](https://user-images.githubusercontent.com/64605104/187413954-dd4d0edc-1b86-4706-ba43-1fa8f31bf1b2.png)




## Placing sky130_vsdinv <br/>
### Building the sky130 standard cell<br/>
The Magic layout of a CMOS inverter will be used so as to intergate the inverter with the counter design. To do this, inverter magic file is sourced from vsdstdcelldesign by cloning it.
```
git clone https://github.com/nickson-jose/vsdstdcelldesign
```
To invoke magic to view the sky130_inv.mag file, the sky130A.tech file must be included in the command along with its path. To ease up the complexity of this command, the tech file can be copied from the magic folder to the vsdstdcelldesign folder.
```
magic -T sky130A.tech sky130_inv.mag &
```
Next, we need to define the ports. <br/>
In Magic Layout window click on Edit >> Text which opens up a dialogue box. Edit according to the following screenshots.<br/>

![pic1](https://user-images.githubusercontent.com/64605104/187448054-3c8af4c2-b796-46e4-9048-fb7151a7fa8e.png)
<br/>

![pic2](https://user-images.githubusercontent.com/64605104/187448285-941c0ea0-a878-4ab8-b23c-1c030493ad59.png)
<br/>

![pic3](https://user-images.githubusercontent.com/64605104/187448324-17496c5e-47ff-40e2-9c27-76b0e216889f.png)
<br/>

![pic4](https://user-images.githubusercontent.com/64605104/187448359-a3a007ed-dda6-4137-9a59-0e6a5bd5387b.png)
<br/>
<br/>
***LEF FILE GENERATION*** <br/><br/>
Select port A in magic:<br/>
```
port class input
port use signal
```
Select Y area<br/>
```
port class output
port class signal
```
Select VPWR area<br/>
```
port class inout
port use power
```
Select VGND area<br/>
```
port class inout
port use ground
```
Then type the following command to generate the lef file.<br/>
```
lef write
```
<br/>
In order to include the new standard cell in the synthesis, copy the sky130_vsdinv.lef file to the designs/iiitb_3bit_rc/src directory.<br/>
Since abc maps the standard cell to a library abc there must be a library that defines the CMOS inverter. The sky130_fd_sc_hd_typical.lib file, sky130_fd_sc_hd_slow.lib file and sky130_fd_sc_hd_fast.lib from vsdstdcelldesign/libs directory needs to be copied to the designs/iiitb_3bit_rc/src directory.<br/>
The config.json file also needs to be updated as following: <br/><br/>

![config](https://user-images.githubusercontent.com/64605104/187450331-8ce2d6e3-7b4b-4a3d-829a-0c6b9b2e0a3d.png)
<br/>
<br/>
In order to integrate the standard cell in the OpenLANE flow, invoke openLANE as usual and carry out following steps:<br/>
```
prep -design iiitb_3bit_rc
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs
run_synthesis
run_floorplan
run_placement
```
To see the layout,invoke magic from the results/placement directory using the following command. <br/>
```
$ magic -T /home/arsh/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_3bit_rc.def &

```

<br/>

To check if the sky130_vsdinv cell is present or not, type the following in magic. <br/>
```
$ getcell sky130_vsdinv
```
<br/>

![getcell](https://user-images.githubusercontent.com/64605104/187455933-561a130e-2ad1-4322-a0fc-2b47e8542c63.png)


<br/>

The above picture shows that the cell was placed successfully.
<br/>

![vsdinv](https://user-images.githubusercontent.com/64605104/187453772-8fc8b791-635b-4c3b-b008-46aa96867d66.png)
<br/>
## RESULTS <br/>
**1. Gate count** <br/>
![stats](https://user-images.githubusercontent.com/64605104/192591005-de9d1dab-f0a2-4750-8de8-9d665e6898ca.png)

  
<br/>
Total gate count = 6<br/>
<br/>

**2. Area** <br/>
![magic_area](https://user-images.githubusercontent.com/64605104/192591061-058ea45a-bd51-4bdf-b5c0-426d5b594fa4.png)

<br/>
Area = 3600 um^2 <br/>
<br/>

**3.Performance** <br/>

![timing_final](https://user-images.githubusercontent.com/64605104/192736065-a95cebbf-7645-4036-ba9f-ac3261f0df75.png)

Performance = 1/(1.7) = 0.58 GHz <br/>
<br/>

**4. Flop to standard cell ratio** <br/>
![flip_flop_ratio](https://user-images.githubusercontent.com/64605104/192591170-b844f170-88d7-4331-be2c-9a2b1e8531cb.png)

<br/>
Flop ratio = 3/6 = 0.5 <br/>
<br/>

**5. Power** <br/>
![power](https://user-images.githubusercontent.com/64605104/192591211-09f15411-5af7-4c16-8af6-15f476d89e50.png)


<br/>
Internal Power = 26.6 uW (85.8%)<br/>
Switching Power = 4.41 uW (14.2%)<br/>
Leakage Power = 0.164 nW (0.00%)<br/>
Total Power = 132 uW (100%)<br/>






## REFERENCES <br/>
- https://github.com/RTimothyEdwards/magic <br/>
- https://github.com/The-OpenROAD-Project/OpenLane <br/>
- https://www.vsdiat.com/dashboard <br/>
## ACKNOWLEDGMENTS <br/>
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. <br/>
- Nickson Jose, VLSI Engineer, VSD Corp. Pvt. Ltd. <br/>
- Madhav Rao, Professor, IIIT-Bangalore <br/>
- Nanditha Rao, Professor, IIIT-Bangalore <br/>
## CONTRIBUTORS <br/>
- Arsh Kedia, Mtech IIIT Bangalore <br/>
- Kunal Ghosh Director, VSD Corp.Pvt.Ltd. <br/>
- Lokesh Maji <br/>
- Vinay Rayapati <br/>
## CONTACT <br/>
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com <br/>
- Arsh Kedia, Mtech IIIT Bangalore. arshkedia99@gmail.com <br/>
- Madhav Rao, mr@iiitb.ac.in <br/>
- Nanditha Rao, nanditha.rao@iiitb.ac.in <br/>
