+++
date = "2016-11-11T12:22:04-08:00"
title = "3 Resistor Bias Circuit with NMOS Transistor"

+++

## Circuit

![3-resistor-bias-circuit](/images/3-resistor-bias-circuit.png)

## Steps

* Pick a Vdd
```
9 Volts
```

* Pick a transistor and Vtn for it
```
2N7002
Vtn = 1.6
```

* Pick and Id
```
2 mA
```

* Find RL for Vdd and Id
```
RL = Vdd / Id
RL = 9 Volts / 2 mA
RL = 4.5 k Ohms
```

* Pick a much smaller current for R1 and R2, Ir (bias resistor current)

```
Ir = 200 uA
```

* Find R1 and R2 such that the voltage drop across R2 is the same as Vtn. This
  is so that any input signal at all will act to turn on the transistor. Then
  make R1 drop the rest of Vdd.

```
R2 = Vtn / Ir
R2 = 1.6 / 200 uA
R2 = 8 k Ohms

R2 = (Vdd - Vtn) / Ir
R2 = (9 - 1.6) / 200 uA
R2 = 7.4 / 200 uA
R2 = 37 k Ohms
```

* Plug in reasonable values for the rest

Cin and Cout should both be much much (two orders of magnitude) less than their
respective resistors.

```
Rin = 1 k Ohms
Cin = 470 nF
Cout = 470 nF
Rout = 100k
```
