//
//  InterfaceController.h
//  hand2hand WatchKit Extension
//
//  Created by 鲁逸沁 on 2018/12/26.
//  Copyright © 2018年 鲁逸沁. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface InterfaceController : WKInterfaceController
@property(nonatomic,strong) CMMotionManager *manager;
- (void)pushAccelerometer;

- (void)setSensorDataGetPull;
- (void)getAccelerometer;
@end