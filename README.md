# iiitb_3bit_rc-Three Bit Ring Counter
## INTRODUCTION <br/>

This project simulates the design of a 3-bit ring counter using verilog HDL. A ring counter works in a similar way as a shift register. The only difference is that the output of the last flip-flop is connected to the input of the first flip-flop. In this way, the counter forms a ring and hence is called ring counter.In this design, three D-Flip-flops are used with clock and ori(override input) signals.
## BLOCK DIAGRAM <br/>
![iiitb_3bit_rc](https://user-images.githubusercontent.com/64605104/181275677-2b2b20e7-2aea-40bc-9166-7bbf0fc9887e.png)


The above figure is the block diagram of a 3bit ring counter. The figure shows three D flip flop connected with a clock and an ORI signal. The design uses an active high ORI signal which sets the first flip flop to '1' and the other two flip flops to '0' when ORI is high. The circuit uses a positve edge triggered clock.<br/>
## WORKING <br/>
The counter is set to an initial state of *_'100'_* by the ORI signal. In the next positive edge of the clock, the values of the flip flops are shifted right and the output of last flip flop is sent to the first one. So, the next state becomes *_'010'_*. Similary after next positive edge of clock, the state of the counter becomes *_'001'_*. This continues until the ORI is again high which will set the counter back to *_'110'_*.<br/>
## WAVEFORM <br/>
![iiitb_3bit_rc_waveform](https://user-images.githubusercontent.com/64605104/181281898-18e82490-31fe-44f2-810d-7fe2ac7e096d.png)


***To clone the repository and download the netlist files for simulation, enter the following commands in your terminal***<br/>
```
$ git clone https://github.com/ArshKedia/iiitb_3bit_rc<br/>
$ cd iiitb_3bit_rc/<br/>
$ iverilog iiitb_3bit_rc.v iiitb_3bit_rc_tb.v<br/>
$ ./a.out <br/>
$ gtkwave iiitb_3bit_rr_out.vcd<br/>
```



