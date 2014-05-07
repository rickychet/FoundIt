//
//  foundViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "foundViewController.h"
#import <Parse/Parse.h>
#import "locationViewController.h"

@interface foundViewController (){
    NSString *colors;
}

@end

@implementation foundViewController

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
    
    FoundStore* myStore = [FoundStore sharedStore];
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text =colors;
    _itemSelected.text = item;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:TRUE];
    
    FoundStore* myStore = [FoundStore sharedStore];
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text =colors;
    _itemSelected.text = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"FoundLocation"]){
        locationViewController *next = (locationViewController*)segue.destinationViewController;
        next.segueType = 1;
    }
    else if([segue.identifier isEqualToString:@"TurnIn"]){
        locationViewController *next = (locationViewController*)segue.destinationViewController;
        next.segueType = 2;
    }
}


@end
