# TD-H3-Engineering

Facebook: https://www.facebook.com/groups/456942886822492

# TID Station
An application designed to replace the three apps supplied by TIDRADIO into a single app.  
It also allows configuration changes to be made in real time (Live Mode) which gives some remote functionality.
TID Station is currently in Beta, it may be updated frequently and will have bugs and glitches.

The latest version 0.30b has the ability to unlock TX all the way down to 18 MHz. Before some other Edgar with a "lifetime of RF engineering" chimes in virtue signalling, let's just clear something up. It is almost guaranteed the radio will not operate correctly outside of the capabilities of the filters and PA, and I DO NOT condone anyone transmitting where they shouldn't be doing so. I CERTAINLY AM NOT! 

The TD-H3 will not transmit on the Air Band frequencies anyway regardless of the limits.

I am interested in seeing a frequency analysis into a dummy load of the radio on the HF bands though. I suspect it would be the same deal as the Quansheng.


# TA3782F
Most of the components in this radio are well known off the shelf stuff. However this TA3782F MCU is not and there is practically no documentation for it. I initially believed this to be some MCU utilizing an Arm Cortex-M4 core, but now I'm almost convinced this is not the case. I'm leaning toward some kind of Intel 8051 MCU architecture as this is providing some meaningful disassembly in IDA Pro.
