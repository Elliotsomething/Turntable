//
//  viewViewController.h
//  donghua
//
//  Created by mac book on 13-7-11.
//  Copyright (c) 2013年 mac book. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface viewViewController : UIViewController{
    CALayer *turnlayer_;
}
@property(retain)CALayer *turnlayer_;
- (IBAction)start:(id)sender;
-(void)addAnimation;
-(void)removeAnimation;
-(int)randomAngle;
@end
