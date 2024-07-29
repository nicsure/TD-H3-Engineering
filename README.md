# TD-H3-Engineering

# Everything here is beta or experimental in nature. I cannot guarantee it will not cause damage or data corruption to equipment being used with it. So you do so at your own risk.

Facebook: https://www.facebook.com/groups/456942886822492

# NICSURE MOD
# This firmware is a stand alone radio only firmware. It is not to be used with TIDSTATION and  not to be flashed with TIDSTATION. GET IT?  
Nicsure mod is changing with every release. It has a custom menu system. To access it, press the Menu (Blue) button to open the regular menu then press PTT-A to open the custom menu.  
In the custom menu:  
Up/Down - Change value of curent setting.  
Menu (Blue) - Advance to next setting.  
Cancel (Red) - Exit menu.  
  
Current available functions.  
  
Full size S-Meter enabled by standard.  
  
Menu 0 AM/USB Ovr. Overrides the default mode of operation and forces reception only into AM or USB. When OFF the radio will operate as normal.  
  
Menu 1 Kill Killer. When enabled, Prevents the radio from entering Kill Mode. It may still show "Kill All Lock", just press the red button, then turn off and on and it'll be unkilled.  
  
Menu 2 Fine Tune. Allows finer tuning steps, useful for USB listening.  
  
Menu 3 Mod Hooks. When set to "Blocked", prevents most of the mod's functions from operating. Meant as a trouble shooting feature, if a problem is encountered, set this to Blocked to see if it still occurs. If it does, it's likely not a problem with the mod but with the base firmware, if it doesn't then it's probably some error in the mod.  
  
Menu 4 Tone Monitor. When enabled, displays the CTCSS tone currently being received on the device's screen.  
  
Menu 5 Batt Display: Choose between the regular battery icon and a percentage readout.  
  
Menu 6 Sigbar Style: Selects a solid or segmented RSSI bar.  
  
Menu 7 Freq Adjust: Causes a positive shift in frequency by the selected amount.  
  
Menu 8 WL Copy Freq: Moves the Wireless Copy function's frequency to 433.250 MHz in order to be compliant with some durastictional regulations.  
  
Menu 9 PTT VFO Sel: When enabled, switches VFO when the PTT other than the selected VFO is pressed.  





# TID Station
# Virus/Malware detections are false positives. I have no idea why this is happening. If you are worried then don't download and use it.

An application designed to replace the three apps supplied by TIDRADIO into a single app.  
It also allows configuration changes to be made in real time (Live Mode) which gives some remote functionality.
TID Station is currently in Beta, it may be updated frequently and will have bugs and glitches.

0.30b onwards has the ability to unlock TX all the way down to 18 MHz. Before some other Edgar with a "lifetime of RF engineering" chimes in virtue signalling, let's just clear something up. It is almost guaranteed the radio will not operate correctly outside of the capabilities of the filters and PA, and I DO NOT condone anyone transmitting where they shouldn't be doing so. I CERTAINLY AM NOT! 

The TD-H3 will not transmit on the Air Band frequencies anyway regardless of the limits.

I am interested in seeing a frequency analysis into a dummy load of the radio on the HF bands though. I suspect it would be the same deal as the Quansheng.

0.34b onwards incorporates some firmware mods for extra functions.  

Modulation Override  
S-Meter  
Spectrum Scope  
PTT (PC Side)  
  
This is very  experimental at this stage and I'm dealing with low level assembly here, so don't expect butter smooth functionality yet, this is work in progress.  
To enable the extended functions, you need to flash a patched firmware, this can be accomplished in the firmware flashing menu by checking the options under the "Patches" selection. Please note that the patches are only compatible with the original firmware version 240530 (Do not use my previous Modded firmwares, they were just tests, use the original firmware). You can also use the "Save" button to save the patched firmware .BIN file to disk and use another firmware flashing application if you wish.  

The S-Meter is displayed under the two VFOs and should move as signals are receieved. It's not fancy looking at the moment, in fact it's just a re-purposed progress bar, I'll make it look a little nicer in future updates.  

To use the Modulation override click the "〜" top right of the app window, this will cycle through modulation modes.  
〜 = No override, the radio simply selects the mode it would normally, such as AM in Air Band and FM everywhere else.  
AM/USB/FM = Forces the selected mode regardless of what the radio would normally do on a particular frequency.  

All extended mods require operation in Live Mode to function and require the use of the USB-C port.
There is also a fine tune system in place, you can do this by right clicking the step selection on the VFOs. Note that this does not get saved to the radio, it's local to TID Station only.  

# TA3782F
Most of the components in this radio are well known off the shelf stuff. However this TA3782F MCU is not and there is practically no documentation for it. I initially believed this to be some MCU utilizing an Arm Cortex-M4 core, but now I'm almost convinced this is not the case. I'm leaning toward some kind of Intel 8051 MCU architecture such as the AT89S51, P89V51RD2 or W78E052DDG etc..  
This is providing some meaningful disassembly in IDA Pro.  

Here's a typical snippet of disassembly of the firmware image assuming Intel 8051 code architecture

```
code:0000B98D code_B98D:                              ; CODE XREF: code_B949+5B↓j
code:0000B98D                 mov     A, #0x52 ; 'R'
code:0000B98F                 add     A, RAM_30
code:0000B991                 mov     DPL, A          ; Data Pointer, Low Byte
code:0000B993                 clr     A
code:0000B994                 addc    A, #4
code:0000B996                 mov     DPH, A          ; Data Pointer, High Byte
code:0000B998                 movx    A, @DPTR
code:0000B999                 mov     R7, A
code:0000B99A                 lcall   code_F101
code:0000B99D                 inc     RAM_30
code:0000B99F                 mov     A, RAM_30
code:0000B9A1                 clr     C
code:0000B9A2                 subb    A, #0x25 ; '%'
code:0000B9A4                 jc      code_B98D
code:0000B9A6                 ret
```

The structure and logic of this section does seem to make sense, it's performing some kind of loop, incrementing a ram pointer, calling some other function until some condition is met then returning.

# Byte Frequency Analysis of Firmware image: H3_240427(1).BIN
```
00: 05.32% 03350
01: 02.38% 01497
02: 02.18% 01376
03: 01.72% 01084
04: 01.89% 01193
05: 00.71% 00444
06: 00.52% 00328
07: 00.34% 00215
08: 00.45% 00281
09: 00.25% 00157
0A: 00.31% 00198
0B: 00.19% 00120
0C: 00.31% 00194
0D: 00.18% 00112
0E: 00.22% 00139
0F: 00.42% 00266
10: 00.54% 00340
11: 00.19% 00121
12: 05.89% 03707
13: 00.20% 00123
14: 00.40% 00255
15: 00.12% 00076
16: 00.19% 00118
17: 00.14% 00086
18: 00.21% 00131
19: 00.21% 00133
1A: 00.17% 00105
1B: 00.14% 00090
1C: 00.20% 00125
1D: 00.08% 00050
1E: 00.12% 00076
1F: 00.28% 00174
20: 02.95% 01857
21: 00.12% 00077
22: 01.33% 00838
23: 00.15% 00095
24: 00.59% 00370
25: 00.56% 00352
26: 00.18% 00114
27: 00.15% 00092
28: 00.26% 00162
29: 00.18% 00114
2A: 00.10% 00060
2B: 00.10% 00061
2C: 00.15% 00097
2D: 00.24% 00153
2E: 00.31% 00197
2F: 00.31% 00195
30: 02.10% 01323
31: 00.61% 00385
32: 00.53% 00333
33: 00.56% 00353
34: 00.63% 00395
35: 00.44% 00275
36: 00.24% 00153
37: 00.30% 00187
38: 00.34% 00213
39: 00.23% 00144
3A: 00.28% 00177
3B: 00.35% 00220
3C: 00.45% 00285
3D: 00.23% 00144
3E: 00.24% 00151
3F: 00.20% 00126
40: 00.82% 00514
41: 00.30% 00192
42: 00.19% 00118
43: 00.29% 00184
44: 00.31% 00194
45: 00.29% 00181
46: 00.31% 00196
47: 00.25% 00159
48: 00.19% 00117
49: 00.15% 00096
4A: 00.32% 00201
4B: 00.14% 00090
4C: 00.31% 00194
4D: 00.63% 00396
4E: 00.56% 00352
4F: 00.48% 00303
50: 00.72% 00452
51: 00.17% 00107
52: 00.31% 00194
53: 00.42% 00263
54: 00.60% 00376
55: 00.18% 00113
56: 00.09% 00055
57: 00.06% 00040
58: 00.12% 00074
59: 00.09% 00057
5A: 00.13% 00082
5B: 00.07% 00042
5C: 00.10% 00065
5D: 00.09% 00059
5E: 00.13% 00084
5F: 00.12% 00075
60: 00.61% 00383
61: 00.19% 00120
62: 00.19% 00117
63: 00.15% 00097
64: 00.44% 00279
65: 00.16% 00100
66: 00.11% 00067
67: 00.08% 00048
68: 00.07% 00041
69: 00.13% 00079
6A: 00.22% 00137
6B: 00.09% 00059
6C: 00.21% 00131
6D: 00.24% 00154
6E: 00.24% 00150
6F: 00.32% 00201
70: 00.49% 00308
71: 00.18% 00111
72: 00.24% 00148
73: 00.17% 00110
74: 00.95% 00601
75: 01.16% 00731
76: 00.07% 00043
77: 00.05% 00029
78: 00.30% 00186
79: 00.28% 00176
7A: 00.29% 00181
7B: 00.56% 00355
7C: 00.13% 00083
7D: 00.64% 00401
7E: 00.28% 00174
7F: 01.11% 00696
80: 01.09% 00686
81: 00.07% 00046
82: 00.33% 00205
83: 00.26% 00165
84: 00.04% 00026
85: 00.20% 00124
86: 00.04% 00026
87: 00.06% 00039
88: 00.33% 00208
89: 00.27% 00167
8A: 00.12% 00077
8B: 00.05% 00034
8C: 00.08% 00050
8D: 00.14% 00091
8E: 00.06% 00040
8F: 00.21% 00131
90: 04.13% 02599
91: 00.05% 00034
92: 00.21% 00135
93: 00.19% 00121
94: 00.61% 00386
95: 00.13% 00085
96: 00.12% 00078
97: 00.13% 00084
98: 00.12% 00073
99: 00.10% 00061
9A: 00.07% 00044
9B: 00.07% 00041
9C: 00.05% 00032
9D: 00.39% 00243
9E: 00.11% 00070
9F: 00.12% 00075
A0: 00.10% 00063
A1: 00.09% 00054
A2: 00.20% 00123
A3: 00.84% 00526
A4: 00.14% 00088
A5: 00.08% 00052
A6: 00.06% 00038
A7: 00.04% 00024
A8: 00.11% 00070
A9: 00.13% 00083
AA: 00.14% 00090
AB: 00.16% 00098
AC: 00.06% 00039
AD: 00.38% 00242
AE: 00.07% 00046
AF: 00.31% 00198
B0: 00.09% 00055
B1: 00.05% 00033
B2: 00.08% 00052
B3: 00.07% 00045
B4: 00.48% 00301
B5: 00.12% 00074
B6: 00.09% 00056
B7: 00.09% 00056
B8: 00.16% 00099
B9: 00.06% 00040
BA: 00.05% 00033
BB: 00.13% 00080
BC: 00.13% 00084
BD: 00.11% 00067
BE: 00.14% 00090
BF: 00.13% 00082
C0: 00.33% 00206
C1: 00.19% 00117
C2: 00.92% 00577
C3: 00.54% 00342
C4: 00.16% 00098
C5: 00.16% 00098
C6: 00.08% 00050
C7: 00.08% 00048
C8: 00.17% 00106
C9: 00.12% 00078
CA: 00.11% 00067
CB: 00.08% 00052
CC: 00.12% 00076
CD: 00.09% 00057
CE: 00.11% 00067
CF: 00.17% 00108
D0: 00.35% 00220
D1: 00.08% 00051
D2: 00.89% 00558
D3: 00.36% 00225
D4: 00.07% 00043
D5: 00.10% 00063
D6: 00.07% 00043
D7: 00.14% 00088
D8: 00.20% 00123
D9: 00.08% 00053
DA: 00.12% 00074
DB: 00.18% 00114
DC: 00.09% 00058
DD: 00.09% 00058
DE: 00.07% 00044
DF: 00.21% 00135
E0: 02.92% 01841
E1: 00.16% 00098
E2: 00.10% 00066
E3: 00.13% 00084
E4: 01.56% 00981
E5: 00.86% 00539
E6: 00.24% 00149
E7: 00.17% 00106
E8: 00.11% 00070
E9: 00.09% 00054
EA: 00.13% 00082
EB: 00.16% 00099
EC: 00.44% 00276
ED: 00.22% 00138
EE: 00.27% 00172
EF: 00.69% 00432
F0: 02.86% 01801
F1: 00.14% 00089
F2: 00.10% 00065
F3: 00.11% 00068
F4: 00.25% 00160
F5: 01.84% 01157
F6: 00.10% 00062
F7: 00.05% 00029
F8: 00.27% 00169
F9: 00.15% 00092
FA: 00.14% 00091
FB: 00.23% 00144
FC: 00.38% 00237
FD: 00.45% 00282
FE: 00.45% 00286
FF: 01.78% 01119
```
