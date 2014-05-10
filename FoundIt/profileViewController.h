//
//  profileViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 4/24/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface profileViewController : UIViewController
- (IBAction)contact:(UIButton *)sender;
- (IBAction)searchR:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *miles;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end
