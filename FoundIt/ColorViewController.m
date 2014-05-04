//
//  ColorViewController.m
//  FoundIt
//
//  Created by Logan Eklund on 5/2/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController
@synthesize colorlist;

- (IBAction)passData:(id)sender {
    Store* myStore = [Store sharedStore];
    myStore.color = colorlist;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Color Saved" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)redSelect:(id)sender {
    if(red.on){
        [colorlist addObject:@"Red"];
    }
    else{
        [colorlist removeObject:@"Red"];
    }
}

- (IBAction)orangeSelect:(id)sender {
    if(orange.on){
        [colorlist addObject:@"Orange"];
    }
    else{
        [colorlist removeObject:@"Orange"];
    }
}

- (IBAction)yellowSelct:(id)sender {
    if(yellow.on){
        [colorlist addObject:@"Yellow"];
    }
    else{
        [colorlist removeObject:@"Yellow"];
    }
    
}

- (IBAction)greenSelect:(id)sender {
    if(green.on){
        [colorlist addObject:@"Green"];
    }
    else{
        [colorlist removeObject:@"Green"];
    }
    
}

- (IBAction)blueSelect:(id)sender {
    if(blue.on){
        [colorlist addObject:@"Blue"];
    }
    else{
        [colorlist removeObject:@"Blue"];
    }
}

- (IBAction)purpleSelect:(id)sender {
    if(purple.on){
        [colorlist addObject:@"Purple"];
    }
    else{
        [colorlist removeObject:@"Purple"];
    }
}

- (IBAction)pinkSelect:(id)sender {
    if(pink.on){
        [colorlist addObject:@"Pink"];
    }
    else{
        [colorlist removeObject:@"Pink"];
    }
}

- (IBAction)whiteSelect:(id)sender {
    if(white.on){
        [colorlist addObject:@"White"];
    }
    else{
        [colorlist removeObject:@"White"];
    }
}

- (IBAction)graySelect:(id)sender {
    if(gray.on){
        [colorlist addObject:@"Gray"];
    }
    else{
        [colorlist removeObject:@"Gray"];
    }
}

- (IBAction)blackSelect:(id)sender {
    if(black.on){
        [colorlist addObject:@"Black"];
    }
    else{
        [colorlist removeObject:@"Black"];
    }
}

- (IBAction)clearSelect:(id)sender {
    if(clear.on){
        [colorlist addObject:@"Clear"];
    }
    else{
        [colorlist removeObject:@"Clear"];
    }
}

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
    colorlist = [[NSMutableArray alloc]init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
