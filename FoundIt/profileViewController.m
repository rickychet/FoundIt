//
//  profileViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 4/24/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()

@end

@implementation profileViewController

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
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"stars2"]]];
    

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults doubleForKey:@"radius"]){
        _slider.value = 15.0;
        _miles.text = [[NSString alloc]initWithFormat:@"%2.1f", _slider.value];
       
    }else{
        _slider.value = [defaults doubleForKey:@"radius"];
        _miles.text = [[NSString alloc]initWithFormat:@"%2.1f", _slider.value];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)contact:(UIButton *)sender {
    // Email Subject
    NSString *emailTitle = @"Request to add item type";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"founditcs407@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (IBAction)searchR:(id)sender {
    
    _miles.text = [[NSString alloc]initWithFormat:@"%2.1f", _slider.value];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:_slider.value forKey:@"radius"];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}


@end
