//
//  InterfaceController.m
//  hand2hand WatchKit Extension
//
//  Created by 鲁逸沁 on 2018/12/26.
//  Copyright © 2018年 鲁逸沁. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController ()

@end


@implementation InterfaceController

NSString * const SENSOR_DATA_GET = @"pull";
bool const SENSOR_SHOW_FREQ = false;

-(CMMotionManager *) manager {
    if (!_manager) {
        self.manager = [[CMMotionManager alloc] init];
    }
    return _manager;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    if ([SENSOR_DATA_GET isEqualToString:@"push"]) {
        [self pushAccelerometer];
    } else if ([SENSOR_DATA_GET isEqualToString:@"pull"]) {
        [self setSensorDataGetPull];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
    
    NSLog(@"bye");
}

- (void)pushAccelerometer {
    if (!self.manager.isAccelerometerAvailable) return;
    self.manager.accelerometerUpdateInterval = 1/100.0;
    __block int freqCnt = 0;
    NSDate *startTime = [NSDate date];
    [self.manager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (error) return;
        CMAcceleration acceleration = accelerometerData.acceleration;
        NSLog(@"%f__%f__%f", acceleration.x, acceleration.y, acceleration.z);
        if (SENSOR_SHOW_FREQ) {
            freqCnt ++;
            float freq = freqCnt / (-[startTime timeIntervalSinceNow]);
            NSLog(@"accfreq: %f", freq);
        }
    }];
}

- (void)setSensorDataGetPull {
    if (self.manager.isAccelerometerAvailable) {
        self.manager.accelerometerUpdateInterval = 1/100.0;
        [self.manager startAccelerometerUpdates];
    }
}

- (void)getAccelerometer {
    
}

@end


