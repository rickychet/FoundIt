//
//  homeViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 4/23/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "homeViewController.h"
#import "lostItem.h"
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
  //  [self.display reloadData];

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
        return [defaults integerForKey:@"count"];
    }
    else{
        return 0;
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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *encrypted = [defaults dataForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        lostItem *lost = [NSKeyedUnarchiver unarchiveObjectWithData:encrypted];
        NSString *type = lost.type;
        NSString *color = @"";

        for(int j = 0; j<lost.color.count;j++){
            color = [NSString stringWithFormat:@"%@ %@",color,[lost.color objectAtIndex:j]];
        }
        [cell.textLabel setText:type];
        [cell.detailTextLabel setText:color];
    
    
    
    return cell;
}


@end

