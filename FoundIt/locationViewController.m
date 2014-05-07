//
//  locationViewController.m
//  FoundIt
//
//  Created by Logan Eklund on 5/2/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "locationViewController.h"
#import "MapAnnotation.h"
#import "FoundStore.h"

@interface locationViewController ()

@end

@implementation locationViewController

//pin with the location of the item
//MapAnnotation *location;

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
    [self.mapView setDelegate:self];
    [self addGestureRecogniserToMapView];
    
    _location = [[MapAnnotation alloc]init];
    if(_segueType == 0){
        Store* myStore = [Store sharedStore];
        _location.coordinate = myStore.coordinates;
        [self.mapView addAnnotation:_location];
    }else if(_segueType == 1){
        FoundStore* myStore = [FoundStore sharedStore];
        _location.coordinate = myStore.foundLocation;
        [self.mapView addAnnotation:_location];
    }else if(_segueType == 2){
        FoundStore* myStore = [FoundStore sharedStore];
        _location.coordinate = myStore.turnInLocation;
        [self.mapView addAnnotation:_location];
    }
    
}

- (void)addGestureRecogniserToMapView{
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(addPinToMap:)];
    lpgr.minimumPressDuration = 0.5; //
    [self.mapView addGestureRecognizer:lpgr];
    
}

- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    //remove old pin
    [self.mapView removeAnnotation: _location];
    
    //creaet new pin
    _location = [[MapAnnotation alloc]init];
    
    _location.coordinate = touchMapCoordinate;
    //location.subtitle = @"Subtitle";
    //location.title = @"Title";
    
    [self.mapView addAnnotation:_location];
    
}

- (IBAction)addCitiesToMap:(id)sender{
    //Lets fill this in later
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    if(_segueType == 0){
        Store* myStore = [Store sharedStore];
        myStore.coordinates = _location.coordinate;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Location Saved" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self.navigationController popViewControllerAnimated:YES];
        [alert show];
    }else if(_segueType == 1){
        FoundStore* myStore = [FoundStore sharedStore];
        myStore.foundLocation = _location.coordinate;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Location Saved" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self.navigationController popViewControllerAnimated:YES];
        [alert show];
    }else if(_segueType == 2){
        FoundStore* myStore = [FoundStore sharedStore];
        myStore.turnInLocation = _location.coordinate;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Location Saved" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self.navigationController popViewControllerAnimated:YES];
        [alert show];
    }
}
@end
