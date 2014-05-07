//
//  ColorViewController.h
//  FoundIt
//
//  Created by Logan Eklund on 5/2/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
#import "FoundStore.h"
@interface ColorViewController : UITableViewController{
    IBOutlet UISwitch *red;
    IBOutlet UISwitch *orange;
    IBOutlet UISwitch *yellow;
    IBOutlet UISwitch *green;
    IBOutlet UISwitch *blue;
    IBOutlet UISwitch *purple;
    IBOutlet UISwitch *pink;
    IBOutlet UISwitch *white;
    IBOutlet UISwitch *gray;
    IBOutlet UISwitch *black;
    IBOutlet UISwitch *clear;
    NSMutableArray *colorlist;
}
- (IBAction)passData:(id)sender;
- (IBAction)redSelect:(id)sender;
- (IBAction)orangeSelect:(id)sender;
- (IBAction)yellowSelct:(id)sender;
- (IBAction)greenSelect:(id)sender;
- (IBAction)blueSelect:(id)sender;
- (IBAction)purpleSelect:(id)sender;
- (IBAction)pinkSelect:(id)sender;
- (IBAction)whiteSelect:(id)sender;
- (IBAction)graySelect:(id)sender;
- (IBAction)blackSelect:(id)sender;
- (IBAction)clearSelect:(id)sender;

@property(nonatomic,retain) NSMutableArray *colorlist;
@property(assign,nonatomic) BOOL lostSegue;
@end
