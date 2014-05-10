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
@property (weak, nonatomic) IBOutlet UILabel *itemSelected;
@property (weak, nonatomic) IBOutlet UITableViewCell *locationCell;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
- (IBAction)clearFields:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *table;
@end
