//
//  detailViewController.m
//  FoundIt
//
//  Created by Yuqian Chen on 5/10/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "detailViewController.h"
#import "MapAnnotation.h"
#import <Parse/Parse.h>
@interface detailViewController ()

@end

@implementation detailViewController

MapAnnotation *turnInLoc;
MapAnnotation *foundLoc;

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
    
    MKCoordinateRegion region;
    MKCoordinateSpan zoom = MKCoordinateSpanMake(0.1, 0.1);
    region = (MKCoordinateRegion){(_turnInlocation), zoom};
    [maps setRegion:region animated:NO/YES];
    
    PFQuery *query = [PFQuery queryWithClassName:@"images"];
    PFObject *imageObject = [query getObjectWithId:_imageID];
    PFFile * foundItemImageFile = imageObject[@"imageFile"];
    NSData * foundItemImageData = [foundItemImageFile getData];
    UIImage * foundItemImage = [UIImage imageWithData:foundItemImageData];
    
    [imageView setImage:foundItemImage];

    turnInLoc = [[MapAnnotation alloc] init];
    turnInLoc.coordinate = _turnInlocation;
    
    
    foundLoc = [[MapAnnotation alloc] init];
    foundLoc.coordinate = _foundlocation;
    
    _descriptionLabel.text = _description;
    
    maps.hidden = true;
    imageView.hidden = false;
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)views:(id)sender {
    
    
    if(segements.selectedSegmentIndex == 0){
        imageView.hidden =false;
        maps.hidden = true;
        //UIImage *imagaURL = image[@"%@",imageID];

        
    }else if(segements.selectedSegmentIndex ==1){
        maps.hidden = false;
        [maps removeAnnotation:turnInLoc];
        
        [maps addAnnotation: foundLoc];
        imageView.hidden = true;
        
    }else{
        maps.hidden = false;
       [maps removeAnnotation:foundLoc];
        [maps addAnnotation: turnInLoc];
        imageView.hidden=true;
    }
   
    
}
@end
