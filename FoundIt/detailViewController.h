//
//  detailViewController.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/10/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface detailViewController : UIViewController{
    
    
    __weak IBOutlet MKMapView *maps;
    
    __weak IBOutlet UISegmentedControl *segements;
    
    __weak IBOutlet UIImageView *imageView;
}
- (IBAction)views:(id)sender;
@property (nonatomic, assign) CLLocationCoordinate2D foundlocation;
@property (nonatomic, assign) CLLocationCoordinate2D turnInlocation;
@property (weak, nonatomic) NSString *description;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (strong, nonatomic) NSString *imageID;
@end
