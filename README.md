Readme
======
In this project, an RF fingerprint identification system based on WiFi signals is constructed. A dataset containing WiFi signals collected from different batches (dates) of 10 cellular devices is also provided. Detailed collection setups for different sub-datasets can be found in the chapter dataset descriptions.

Dataset Introduction
======

The dataset can be found under this link  
https://drive.google.com/drive/folders/1dWg8Fui_0I93p6BI4VWaICMuMGoeuYqP?usp=sharing

Experimental Devices
------
Ten commonly used cell phones were included in the experiment. The following table provides more details about them.
| Device Index  | Device Model | Device Model | 
| ------------- | ------------- |------------- |
|0	|V2118A|	3.2GHz Qualcomm Snapdragon 870 Eight-core|
|1	|PHK110	|Qualcomm Snapdragon S1®8+Mobile Platform |
|2	|PGT-AN10	|Qualcomm Snapdragon S2®8 Mobile Platform|
|3	|Redmi K30S Ultra	|Qualcomm Snapdragon 865 |
|4	|Redmi Note 11 5G	|Mediarek Dimensity 810 |
|5	|Xiaomi 12	|Qualcomm Snapdragon 8 Gen 1|
|6	|PGBM10	|MediaTek Dimensity 1300 Eight-core |
|7	|Xiaomi 12	|Qualcomm Snapdragon 8 Gen 1|
|8	|HUAWEI MatePad	|HUAWEI Kirin 820|
|9	|Xiaomi 14	|Qualcomm Snapdragon s3®8 Mobile Platformhline|

All device messages are captured by the USRP N210 software-defined radio (SDR), and we use the USRP Radio Communications Toolkit support package for matlab to control the USRP and obtain IQ samples from it, with parameters including 20 MS/s, a bandwidth of 20 MHz, and a carrier frequency of 2.462 GHz.

Experimental Environment
------
The experimental environment consisted of a laboratory and a utility room, both measuring 8 m x 7.5 m. The laboratory consisted of a number of desktop computers, tables with partitions, chairs, etc., and a portion of miscellaneous items; the utility room contained two round tables, two chairs, four mainframes, a server, a large monitor, and a lot of miscellaneous items. The environment was crowded, and in addition, the door was closed during all experiments.
![image](https://github.com/1064947738/ASCII-Encoding-and-decoding/assets/163235170/f1deff5c-3d03-4231-87c1-dadb13ff0116)


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

The Wi-Fi and USRP receivers were placed at the Tx and Rx locations, respectively, and the receivers were kept stationary at a fixed location during each data acquisition. The devices, on the other hand, are placed at 0m, 1m, and 2m from Rx depending on different experimental requirements, and the placement points are on the A,B,C,D positions. Since there are other clutter items between the device and the receiver in all cases except the 0m case where it can be considered as having a direct path of realization, especially the device placed in the utility room, there is no direct line of sight path between the device under test and the receiver since the doors are closed as well as there is a wall.

In each temperature sub-dataset, the data collection time for each device was approximately 1.5 hours to collect temperature data while using five different applications. Each device was required to collect 200 data packets per application for the training set and 40 data packets for the test set. The main app_label is '0','1','2','3','4'.

In the scenario dataset, the data collection time for each device was approximately 3 hours, with 500 packets collected as a training set and 100 packets as a test set for each of the stationary, slow-moving, and fast-moving scenarios at a fixed distance from the applications in the visible case, and 500 packets collected as a training set and 100 packets as a test set for each of the stationary scenarios at a fixed distance from the applications in the non-visible case, with 500 packets as training set and 100 packets as test set. The main position labels are 'L0S fixed', 'L0S move slow', 'L0S move fast', 'NLOS fixed'.

In the location dataset, the data collection time for each device is about 1 hour, and 1000 packets are collected as training set and 200 packets as test set for each device when the same application is used at a distance of 0 m, 1 m and 2 m, respectively. The main distance labels are '0m' , '1m' , '2m'.

The rest of the temperature labels and date labels are specific to the situation.

Here is the structure of each packet

| Reserved Bits| Short Training Field| Long Training Field  | Signal Field  | MAC Header  | Frame Control  | Duration     | Address 1      | Address 2      | Address 3      | Sequence Control  | Frame Body    | Date         | Temperature   | App_label    | Distance    | Position    | Frame Check Sequence |Reserved Bits|
|:--------------:|:--------------:|:--------------:|:--------------:|:--------------:|:--------------:|:------------:|:--------------:|:--------------:|:--------------:|:------------------:|:-------------:|:------------:|:-------------:|:------------:|:-----------:|:-----------:|:---------------------:|:---------------------:|
| 50 bits         | 160 bits         | 160 bits         | 48 bits         | 240 bits         | 16 bits         | 16 bits       | 48 bits         | 48 bits         | 48 bits         | 16 bits             | Variable      | "24_xx_xx"   | 'xx'          | 'x'          | 'xm'        | 'string'    | 32 bits                |40 bits         |


where app is labeled 0, 1, 2, 3, 4; position is labeled 'LOS_fixed', 'LOS_move_slow', 'LOS_move_ fast', 'NLOS_fixed'
