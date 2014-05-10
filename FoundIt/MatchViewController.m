//
//  MatchViewController.m
//  FoundIt
//
//  Created by Logan Eklund on 5/9/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "MatchViewController.h"
#import "lostItem.h"
#import <Parse/Parse.h>
@interface MatchViewController ()

@end

@implementation MatchViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encrypted = [defaults dataForKey:[NSString stringWithFormat:@"%d",(int)index]];
    lostItem *lost = [NSKeyedUnarchiver unarchiveObjectWithData:encrypted];
        
    PFQuery *query = [PFQuery queryWithClassName:@"foundObject"];
    
    [query whereKey:@"itemType" equalTo:lost.type];
    PFObject *item = [query getFirstObject];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



@end
