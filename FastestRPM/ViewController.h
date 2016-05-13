//
//  ViewController.h
//  FastestRPM
//
//  Created by Anton Moiseev on 2016-05-12.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

#define RADIANS(degrees) (((degrees) * M_PI) / 180.0)
#define MIN_DEGREES -135.0
#define MAX_DEGREES 135.0
#define RANGE_DEGREES (MAX_DEGREES - MIN_DEGREES)

#define LIMIT_VELOCITY 7500.0
#define LIMIT_VELOCITY_DELTA 10.0

#define RESET_DELAY 0.1
#define VELOCITY_DELAY 0.1

@end

