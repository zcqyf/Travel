//
//  BluetoothHeader.h
//  FYBluetooth
//
//  Created by zhangfei on 15/12/31.
//  Copyright © 2015年 zhangfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>


#define CMD_SEND_BATTERYLEVEL_REMIND @"2101"
/**
 *  版本信息
 */
#define CMD_SW_REV_INFO @"8001"
//存储设置uuid的字段
#define ST_DEVICEIDENTIFI_ID @"ST_DEVICEIDENTIFI_ID"

#define ST_SERVICE_UUID @"D100"
#define ST_CHARACTERISTIC_UUID_WRITE_AND_NOTIFY @"8D00"
#define ST_CHARACTERISTIC_UUID_READ @"8A00"

@protocol FYBluetoothDelegate <NSObject>

@optional

//开始扫描
- (void) onScanStart;

//停止扫描
- (void) onScanStop;

//未找到设备
- (void) onScanNotFound;

//连接失败
- (void) onConnectFailed;

//连接成功
- (void) onConnected;

//连接断开
- (void) onConnectBreak;

- (void) onGetVersion:(NSString *)version;

//获取电量
- (void) onGetBattery:(int)battery;

//获取设备标示
- (void)deviceIdentifier:(NSString *)identifier;

@end


@interface BluetoothHeader : NSObject

@property (nonatomic, strong)id<FYBluetoothDelegate>delegate;

@property (nonatomic, strong)CBPeripheral *peripheral;
@property (nonatomic, strong)CBCharacteristic *write;
@property (nonatomic, strong) CBCharacteristic *read;

+ sharedInstance;
//初始化
- (void)initDevice;

//开始扫描
- (void) scan;

//开始连接，传入：address：设备(UUID)
- (void) connect:(NSString *)identify;

//断开连接
- (void) disconnect;

//获取设备版本号
- (void) getVersion;

//获取电量
- (void) getBattery;

@end
