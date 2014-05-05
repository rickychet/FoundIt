//
//  lostViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 4/28/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
@interface lostViewController : UITableViewController{
    NSMutableArray *passedColor;
    NSString *item;
}
@property (weak, nonatomic) IBOutlet UILabel *colorchange;
- (IBAction)viewContent:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *itemSelected;

@end
