//
//  lostViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 4/28/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "lostViewController.h"
#import "ColorViewController.h"
#import "itemsViewController.h"
#import "locationViewController.h"
#import <CoreData/CoreData.h>
#import "lostItem.h"
@interface lostViewController ()

@end

@implementation lostViewController
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
    
    Store* myStore = [Store sharedStore];
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text = colors;
    _itemSelected.text = item;
    if(myStore.coordinates.latitude != 0.0){
        _locationLabel.hidden = true;
        _locationCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:TRUE];
    
    Store* myStore = [Store sharedStore];
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text = colors;
    _itemSelected.text = item;
    if(myStore.coordinates.latitude != 0.0){
        _locationLabel.hidden = true;
        _locationCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)viewContent:(id)sender {
    Store* myStore = [Store sharedStore];
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text =colors;
    _itemSelected.text = item;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"LostColor"]){
        ColorViewController *next = (ColorViewController*)segue.destinationViewController;
        next.lostSegue = true;
    }
    else if([segue.identifier isEqualToString:@"LostType"]){
        itemsViewController *next = (itemsViewController*)segue.destinationViewController;
        next.lostSegue = true;
    }else if([segue.identifier isEqualToString:@"LostLocation"]){
        locationViewController *next = (locationViewController*)segue.destinationViewController;
        next.segueType = 0;
    }

}
- (IBAction)clearFields:(id)sender {
    Store* myStore = [Store sharedStore];
    myStore.item = NULL;
    myStore.color = NULL;
    myStore.coordinates = CLLocationCoordinate2DMake(0.0, 0.0);
    
    //update the views
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text =colors;
    _itemSelected.text = item;
    _locationLabel.hidden = false;
    _locationCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 3){
        Store* myStore = [Store sharedStore];

        if(myStore.color != nil && myStore.item != nil && myStore.coordinates.latitude != 0 && myStore.coordinates.longitude != 0){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *lostItems;
        if([defaults objectForKey:@"lostItems"]){
            lostItems = [defaults objectForKey:@"lostItems"];
            
        }
        else{
            lostItems = [[NSMutableArray alloc]init];
        }
        lostItem *lost = [[lostItem alloc]init];
        lost.color = myStore.color;
        lost.type = myStore.item;
        lost.location = myStore.coordinates;
        NSData *lostI = [NSKeyedArchiver archivedDataWithRootObject:lost];
        [defaults setObject:lostI forKey:@"lostItems"];
        [defaults synchronize];
        [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please fill things in all the fields" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
}


@end
