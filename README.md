Readme
======
In this project, an RF fingerprint identification system based on WiFi signals is constructed. A dataset containing WiFi signals collected from different batches (dates) of 10 cellular devices is also provided. Detailed collection setups for different sub-datasets can be found in the chapter dataset descriptions.

Dataset Introduction
======
Experimental Devices
------
Ten commonly used cell phones were included in the experiment. The following table provides more details about them.
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

All device messages are captured by the USRP N210 software-defined radio (SDR), and we use the USRP Radio Communications Toolkit support package for matlab to control the USRP and obtain IQ samples from it, with parameters including 20 MS/s, a bandwidth of 20 MHz, and a carrier frequency of 2.462 GHz.

Experimental Environment
------
The experimental environment consisted of a laboratory and a utility room, both measuring 8 m x 7.5 m. The laboratory consisted of a number of desktop computers, tables with partitions, chairs, etc., and a portion of miscellaneous items; the utility room contained two round tables, two chairs, four mainframes, a server, a large monitor, and a lot of miscellaneous items. The environment was crowded, and in addition, the door was closed during all experiments.
![image](https://github.com/1064947738/ASCII-Encoding-and-decoding/assets/163235170/bded9ba3-0057-4172-9419-84b9d6e6858d)

Dataset Structure
------
The dataset consists of n sub-datasets, each sub-dataset is a file, and each file contains multiple signals and the corresponding device labels as well as labels for other situations. Below is a description of our dataset:

Root directory  
├── temperature  
│  ├── 2024_04_25-26  
│  ├── 2024_04_28-30  
│  └── 2024_05_06-07  
│  └── ...  
├── scene  
│  └── 24_05_21  
└── location  
&nbsp;&nbsp;&nbsp;&nbsp;└── 24_05_10  
In each sub-dataset of temperature, data collection lasted about 1.5 hours per device, collecting temperature data while using five different apps. Each device needs to collect 200 data packets on each app as a training set and 40 data packets as a test set.

In the scene dataset, the data collection time for each device was about 3 hours, and the data packets were collected in the visible case, at a fixed distance with the app, in the stationary, slow-moving, and fast-moving cases, with 500 packets collected as a training set and 100 packets collected as a test set for each case; and in the invisible case, at a fixed distance with the app, with the stationary state packets, of which 500 packets are used as training set and 100 packets are used as test set.

In the location dataset, the data collection lasted about 1 hour for each device, and 1000 packets were collected as a training set and 200 packets as a test set for each device when using the same app at distances of 0m, 1m, and 2m, respectively.

Here is the structure of each packet

| Frame Control  | Duration     | Address 1      | Address 2      | Address 3      | Sequence Control  | Frame Body    | Date         | Temperature   | App_label    | Distance    | Position    | Frame Check Sequence |
|:--------------:|:------------:|:--------------:|:--------------:|:--------------:|:------------------:|:-------------:|:------------:|:-------------:|:------------:|:-----------:|:-----------:|:---------------------:|
| 2 Byte         | 2 Byte       | 6 Byte         | 6 Byte         | 6 Byte         | 2 Byte             | Variable      | "24_xx_xx"   | 'xx'          | 'x'          | 'xm'        | 'string'    | 4 Byte                |


where app is labeled 0, 1, 2, 3, 4; position is labeled 'LOS_fixed', 'LOS_move_slow', 'LOS_move_ fast', 'NLOS_fixed'
