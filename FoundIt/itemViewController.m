//
//  itemViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 4/28/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "itemViewController.h"

@interface itemViewController ()
@property (strong,nonatomic) NSArray *itemType;
@end

@implementation itemViewController

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
    NSArray *data = [[NSArray alloc]initWithObjects:@"Keys",@"Bags",@"Laptop",@"Water Bottle",@"Umbrella",
                     @"Jacket/Coat",@"Watches",nil];
    self.itemType = data;
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_itemType count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_itemType objectAtIndex:row];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
