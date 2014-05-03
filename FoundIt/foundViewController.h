//
//  foundViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
@interface foundViewController : UITableViewController{
    NSMutableArray *passedColor;
}
@property (weak, nonatomic) IBOutlet UILabel *colorchange;

- (IBAction)contentview:(id)sender;
@end
