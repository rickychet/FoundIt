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

@interface locationViewController : UIViewController{
    NSString *longtitude;
    NSString *latitude;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end
