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
@end
