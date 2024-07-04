Readme
======
This project builds a radio frequency fingerprint recognition system based on WiFi signals. It also provides a dataset containing WiFi signals collected from different batches (dates) of 10 mobile devices. The detailed collection settings of different sub-datasets can be found in the chapter Dataset Introduction.

Dataset Introduction
======
Experimental Devices
------
Ten commonly used mobile phones were included in the experiment. The following table provides more details about them.
| Device Index  | Device Model | Device Model | 
| ------------- | ------------- |------------- |
|0	|V2118A|	3.2GHz 骁龙 870 八核|
|1	|PHK110	|第一代骁龙®8+移动平台|
|2	|PGT-AN10	|第二代骁龙8移动平台|
|3	|Redmi K30S Ultra	|高通骁龙865|
|4	|Redmi Note 11 5G	|天玑810|
|5	|Xiaomi 12	|全新一代骁龙8|
|6	|PGBM10	|天玑 1300 八核|
|7	|Xiaomi 12	|全新一代骁龙8|
|8	|HUAWEI MatePad	|HUAWEI Kirin 820|
|9	|Xiaomi 14	|第三代骁龙®8移动平台|

All device messages are captured by USRP N210 software defined radio (SDR). We use the USRP Radio Communication Toolbox support package of MATLAB to control the USRP and obtain IQ samples from it. The parameters include 20MS/s, 20MHz bandwidth, and 2.462GHz carrier frequency.

Experimental Environment
------
The experimental environment includes a laboratory and a utility room, both of which are 8 meters by 7.5 meters in size. The laboratory includes multiple desktop computers, multiple tables with partitions, chairs, etc., as well as some sundries; the utility room contains two round tables, two chairs, four hosts, a server, a large monitor, and a lot of sundries. The environment is crowded, and the doors are closed during all experiments.

Dataset Structure
------
The dataset consists of n sub-datasets, each of which is a file. Each file contains multiple signals and corresponding device labels as well as labels for other situations. The following is an introduction to our dataset:

Root directory  
├── temperature  
│  ├── 2024_04_25-26  
│  ├── 2024_04_28-30  
│  └── 2024_05_06-07  
│  └── ...  
├── scene  
│  └── 24_05_21  
└── location  
&nbsp;&nbsp;&nbsp;└── 24_05_10  
In each sub-dataset of temperature, data collection for each device lasts about 1.5 hours, and temperature data is collected when using five different apps. Each device needs to collect 200 data packets as training sets and 40 data packets as test sets on each app.

In the scene dataset, data collection time for each device is about 3 hours. Data packets are collected in the visible case, fixed distance and app, static, slow moving, and fast moving conditions. 500 data packets are collected in each case as training sets and 100 data packets are collected as test sets; in the invisible case, fixed distance and app, static data packets are collected, of which 500 data packets are used as training sets and 100 data packets are used as test sets.

In the location dataset, data collection for each device lasts about 1 hour. When using the same app, data packets are collected at distances of 0m, 1m, and 2m, respectively. Each device collects 1000 data packets as training sets and 200 data packets as test sets.
