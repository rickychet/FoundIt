//
//  FoundStore.h
//  FoundIt
//
//  Created by Logan Eklund on 5/7/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface FoundStore : NSObject{
NSMutableArray *color;
NSString *item;
CLLocationCoordinate2D foundLocation;
    CLLocationCoordinate2D turnInLocation;
    NSString* description;

}
@property(nonatomic,strong)NSMutableArray* color;
@property(strong,nonatomic)NSString *item;
@property(assign,nonatomic)CLLocationCoordinate2D foundLocation;
@property(assign, nonatomic)CLLocationCoordinate2D turnInLocation;
@property(strong, nonatomic)NSString* description;

+ (FoundStore *) sharedStore;
@end
