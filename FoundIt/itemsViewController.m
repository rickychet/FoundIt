//
//  itemsViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "itemsViewController.h"
#import "FoundStore.h"

@interface itemsViewController (){
    NSArray *itemlist;
    NSString *seleted;
}
@end

@implementation itemsViewController

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
    itemlist = [[NSArray alloc]initWithObjects:@"Laptop",@"Keys",@"Backpack/Bag",@"Umbrella",@"Hat",@"Water Bottle",@"Earphones",@"Gloves", @"Scarf",@"Wallet",@"Jacket",nil];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    seleted = [itemlist objectAtIndex:indexPath.row];
    NSLog(@"%@",seleted);
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //[tableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)submit:(id)sender {
    if(_lostSegue){
        Store* myStore = [Store sharedStore];
        myStore.item = seleted;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Item Type Saved" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        FoundStore* myStore = [FoundStore sharedStore];
        myStore.item = seleted;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Item Type Saved" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }

}
@end
