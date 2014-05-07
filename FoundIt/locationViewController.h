//
//  locationViewController.h
//  FoundIt
//
//  Created by Logan Eklund on 5/2/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Store.h"
#import "MapAnnotation.h"

@interface locationViewController : UIViewController{
    NSString *longtitude;
    NSString *latitude;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) MapAnnotation *location;
@property(assign,nonatomic) int segueType; //0 = Lost, 1 = found, 2 = turn in
- (IBAction)submit:(id)sender;


@end
