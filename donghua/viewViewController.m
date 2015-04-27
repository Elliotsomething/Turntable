//
//  viewViewController.m
//  donghua
//
//  Created by mac book on 13-7-11.
//  Copyright (c) 2013年 mac book. All rights reserved.
//

#import "viewViewController.h"
#define DEGREES_TO_RADIANS(d)(d*M_PI/180)
@interface viewViewController ()

@end

@implementation viewViewController
@synthesize turnlayer_;
- (void)viewDidLoad
{
    CALayer *turnlayer=[CALayer layer];
    turnlayer=[CALayer layer];
    turnlayer.bounds=CGRectMake(0, 0, 300, 300);
    turnlayer.contents=(id)[UIImage imageNamed:@"turntable.png"].CGImage;
    turnlayer.position=CGPointMake(160, 200);
    self.turnlayer_=turnlayer;
    [self.view.layer addSublayer:self.turnlayer_];
    CALayer *pinlayer=[CALayer layer];
    pinlayer.bounds=CGRectMake(0, 0, 72, 54);
    pinlayer.contents=(id)[UIImage imageNamed:@"pin.png"].CGImage;
    pinlayer.position=CGPointMake(160, 160);
    pinlayer.transform=CATransform3DMakeRotation(DEGREES_TO_RADIANS(55), 0, 0, 1);
    [self.view.layer addSublayer:pinlayer];
    
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    if (0==[sender tag]) {
        [sender setTag:1];
        [sender setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
        [self addAnimation];
    }
else{
    [sender setTag:0];
    [sender setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
    [self removeAnimation];
   }
}
-(void)addAnimation{
    CABasicAnimation *rotationanimation=nil;
    rotationanimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationanimation.toValue=[NSNumber numberWithFloat:(DEGREES_TO_RADIANS(360))];
    rotationanimation.duration=0.1f;
    rotationanimation.autoreverses=NO;
    rotationanimation.repeatCount=HUGE_VALF;
    rotationanimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [turnlayer_ addAnimation:rotationanimation forKey:@"rotationanimation"];
}
-(void)removeAnimation{
    [turnlayer_ removeAllAnimations];
    int angle=[self randomAngle];
    turnlayer_.transform=CATransform3DMakeRotation(DEGREES_TO_RADIANS(angle*36), 0, 0, 1);
}
-(int)randomAngle{
    
    int angle=arc4random()%9;
    return angle;
}
@end
