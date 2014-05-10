//
//  foundViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundStore.h"
@interface foundViewController : UITableViewController{
    NSMutableArray *passedColor;
    NSString *item;
    NSString *colors;

}


@property (weak, nonatomic) IBOutlet UILabel *colorchange;
@property (weak, nonatomic) IBOutlet UILabel *itemSelected;
@property (weak, nonatomic) IBOutlet UILabel *foundLocationLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *foundLocationCell;
@property (weak, nonatomic) IBOutlet UILabel *turnInLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearButton;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
- (IBAction)clearFields:(id)sender;
@property (weak, nonatomic) IBOutlet UITableViewCell *turnInCell;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *cameraDetailImage;



@end
