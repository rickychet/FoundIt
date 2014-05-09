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
    
    if(myStore.foundLocation.latitude != 0.0){
        _foundLocationLabel.hidden = true;
        _foundLocationCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    if(myStore.turnInLocation.latitude != 0.0){
        _turnInLabel.hidden = true;
        _turnInCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _descriptionText.delegate = self;
    
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
    
    
    if(myStore.foundLocation.latitude != 0.0){
        _foundLocationLabel.hidden = true;
        _foundLocationCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    if(myStore.turnInLocation.latitude != 0.0){
        _turnInLabel.hidden = true;
        _turnInCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    _descriptionText.delegate = self;
    if( myStore.description){
        _descriptionText.text = myStore.description;
    }
    
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

//clears text when textView is touched
- (void) textViewDidBeginEditing:(UITextView *) textView {
    [textView setText:@""];
}

//Makes the return key dismiss the keyboard
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        FoundStore* myStore = [FoundStore sharedStore];
        myStore.description = textView.text;
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}


- (IBAction)clearFields:(id)sender {
    FoundStore* myStore = [FoundStore sharedStore];
    myStore.item = NULL;
    myStore.color = NULL;
    myStore.turnInLocation = CLLocationCoordinate2DMake(0.0, 0.0);
    myStore.foundLocation = CLLocationCoordinate2DMake(0.0, 0.0);
    myStore.description = NULL;
     _descriptionText.text = Nil;
    
    //update the views
    passedColor = myStore.color;
    item = myStore.item;
    NSString *colors = @"";
    for(int i = 0; i<passedColor.count;i++){
        colors = [NSString stringWithFormat:@"%@ %@",colors,[passedColor objectAtIndex:i]];
    }
    _colorchange.text =colors;
    _itemSelected.text = item;
    _turnInLabel.hidden = false;
    _turnInCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _foundLocationLabel.hidden = false;
    _foundLocationCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoundStore* myStore = [FoundStore sharedStore];
    
    if(indexPath.section == 6 ){
        NSLog(@"add");
        if(myStore.color != nil && myStore.item !=nil && myStore.foundLocation.latitude !=0 && myStore.foundLocation.longitude !=0 && myStore.turnInLocation.latitude !=0 && myStore.turnInLocation.longitude != 0 && myStore.description != nil){
        PFObject *foundObject = [PFObject objectWithClassName:@"foundObject"];
                       foundObject[@"colors"]=myStore.color;
        
        foundObject[@"itemType"]= myStore.item;

        PFGeoPoint *foundLocation = [PFGeoPoint geoPointWithLatitude:myStore.foundLocation.latitude longitude:myStore.foundLocation.longitude];
        foundObject[@"foundLocation"] = foundLocation;
        
        NSNumber *turnInLocationLatitude  = [[NSNumber alloc]initWithDouble: myStore.turnInLocation.latitude];
        NSNumber *turnInLocationLongitude = [[NSNumber alloc]initWithDouble:myStore.turnInLocation.longitude];
        foundObject[@"turnInLocationLatitude"] = turnInLocationLatitude;
        foundObject[@"turnInLocationLongitude"] = turnInLocationLongitude;
       
        foundObject[@"decsription"] = myStore.description;
        [foundObject saveInBackground];

            myStore.item = NULL;
            myStore.color = NULL;
            myStore.turnInLocation = CLLocationCoordinate2DMake(0.0, 0.0);
            myStore.foundLocation = CLLocationCoordinate2DMake(0.0, 0.0);
            myStore.description = NULL;
            _descriptionText.text = Nil;
            
            
        [self.navigationController popViewControllerAnimated:YES];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please fill things in all the fields" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];

        }
    }
    
}


@end
