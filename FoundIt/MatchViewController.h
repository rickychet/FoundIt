//
//  MatchViewController.h
//  FoundIt
//
//  Created by Logan Eklund on 5/9/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchViewController : UITableViewController
@property (assign, nonatomic) NSInteger index;
@property(strong,nonatomic)NSArray *list;
- (IBAction)deleteLostItem:(UIBarButtonItem *)sender;

@end
