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
#import "detailViewController.h"
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


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:TRUE];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

    PFObject *item = [_list objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:item[@"itemType"]];
    NSArray *color =item[@"colors"];
    NSString *c = @"";
    for(int i = 0; i<color.count; i++){
        c = [[NSString alloc]initWithFormat:@"%@ %@",c,[color objectAtIndex:i]];
    }
    [cell.detailTextLabel setText:c];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PFObject *item = [_list objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    detailViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"detail"];
    PFGeoPoint *foundL =item[@"foundLocation"];
    controller.foundlocation = CLLocationCoordinate2DMake(foundL.latitude, foundL.longitude);
    controller.turnInlocation = CLLocationCoordinate2DMake([item[@"turnInLocationLatitude"]doubleValue],[item[@"turnInLocationLongitude"]doubleValue]);
    controller.description = item[@"decsription"];
    controller.imageID = item[@"imageObjectId"];
    controller.foundItemID = [item objectId];
    controller.index = _index;
    [self.navigationController pushViewController:controller animated:YES];

}

- (IBAction)deleteLostItem:(UIBarButtonItem *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"WARNING" message:@"Clicking OK will delete this item from the database" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked cancel
    if (buttonIndex == 0) {
        NSLog(@"this is button index 0");
    }
    //the user clicked okay
    if (buttonIndex == 1) {
        //delete from NSUserData
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger count = [defaults integerForKey:@"count"];
        NSInteger decCount = count - 1;
        [defaults setInteger:decCount forKey:@"count"];
        [defaults removeObjectForKey:[NSString stringWithFormat:@"%d",_index]];
        
        
        //fill the empty hole left by deleted item
        for (int i = _index; i < decCount; i++) {
            [defaults setObject:[defaults objectForKey:[NSString stringWithFormat:@"%d",i + 1]] forKey:[NSString stringWithFormat:@"%d", i]];
        }
        
        [defaults synchronize];
        
        //pop back to root controller
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        NSLog(@"this is button index 1");
    }
    
}


@end
