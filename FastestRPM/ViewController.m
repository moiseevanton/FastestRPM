//
//  ViewController.m
//  FastestRPM
//
//  Created by Anton Moiseev on 2016-05-12.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIImageView *speedometer;

@property (strong, nonatomic) UIImageView *needle;

@property (nonatomic) CGFloat currVelocity;

@property (nonatomic) CGFloat maxVelocity;

- (void)moveNeedleWithVelocity:(CGFloat)velocity;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // seting up the speedometer
    self.speedometer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"speedometer"]];
    self.speedometer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.speedometer];

    [self.speedometer.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.speedometer.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    // setting up the needle
    self.needle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"needle"]];
    self.needle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.speedometer addSubview:self.needle];
    
    [self.needle.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.needle.centerYAnchor constraintEqualToAnchor:self.speedometer.centerYAnchor].active = YES;
    [self.needle.widthAnchor constraintEqualToConstant:250].active = YES;
    [self.needle.heightAnchor constraintEqualToConstant:250].active = YES;
    
    self.needle.transform = CGAffineTransformMakeRotation(2.5);
    
    UIPanGestureRecognizer *circularMotions = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(makeCircularMotions:)];
    
    [self.view setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:circularMotions];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeCircularMotions:(UIPanGestureRecognizer *) sender {
    
    CGPoint componentVelocity = [sender velocityInView:self.view];
    CGFloat velocity = sqrt(pow(componentVelocity.x, 2) + pow(componentVelocity.y, 2));
    [self moveNeedleWithVelocity:velocity];
    
    if ((sender.state == UIGestureRecognizerStateEnded) || (sender.state == UIGestureRecognizerStateCancelled) || (sender.state == UIGestureRecognizerStateFailed)) {
        
        [UIView animateWithDuration:2 animations:^{
            self.needle.transform = CGAffineTransformMakeRotation(-1);
            self.needle.transform = CGAffineTransformMakeRotation(-3.9);
            
        }completion:^(BOOL finished) {
            nil;
        }];
        
    }
    
    
}

- (void)moveNeedleWithVelocity:(CGFloat)velocity {
    
    self.currVelocity = velocity;
    
    self.maxVelocity = MAX(self.maxVelocity, velocity);
    
    CGFloat velocityProportion = velocity / LIMIT_VELOCITY;
    
    CGFloat degrees = MIN(RANGE_DEGREES * velocityProportion, RANGE_DEGREES);
    
    self.needle.transform = CGAffineTransformMakeRotation(RADIANS(degrees));
    
}

@end
