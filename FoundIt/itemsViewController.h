//
//  itemsViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
@interface itemsViewController : UITableViewController{
    
}
@property (strong, nonatomic) IBOutlet UITableView *items;
- (IBAction)submit:(id)sender;


@end
