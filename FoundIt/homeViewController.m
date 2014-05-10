//
//  homeViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 4/23/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "homeViewController.h"
#import "lostItem.h"
#import <Parse/Parse.h>
#import "MatchViewController.h"
@interface homeViewController ()

@end

@implementation homeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back"]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0){
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if([defaults integerForKey:@"count"] ==0){
            return 1;
        }
        return [defaults integerForKey:@"count"];
    }
    else{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        for(int i = 0; i<[defaults integerForKey:@"count"];i++){
        NSData *encrypted = [defaults dataForKey:[NSString stringWithFormat:@"%d",i]];
        lostItem *lost = [NSKeyedUnarchiver unarchiveObjectWithData:encrypted];

        PFQuery *query = [PFQuery queryWithClassName:@"foundObject"];
       // [query whereKey:@"itemType" equalTo:lost.type]
            
        }
        return 1;
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:TRUE];
    [self.display reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if(indexPath.section ==0 ){
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults integerForKey:@"count"]==0){
        [cell.textLabel setText:@"You don't have anything lost yet"];
        [cell.detailTextLabel setText:@""];
    }
    else{
        NSData *encrypted = [defaults dataForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        lostItem *lost = [NSKeyedUnarchiver unarchiveObjectWithData:encrypted];
        NSString *type = lost.type;
        NSString *color = @"";

        for(int j = 0; j<lost.color.count;j++){
            color = [NSString stringWithFormat:@"%@ %@",color,[lost.color objectAtIndex:j]];
        }
        [cell.textLabel setText:type];
        [cell.detailTextLabel setText:color];
    }
    }else{
        [cell.textLabel setText:@"aaaaa"];
    }
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"Lost Items";
    }
    return @"Matched Items" ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MatchViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"match"];
    
    //remove the correct post from the array here, set controller's post property
    controller.index = indexPath.row;
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
}

@end

