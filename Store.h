//
//  Store.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Store : NSObject{
    NSMutableArray *color;
    NSString *item;
    CLLocationCoordinate2D coordinates;
}
@property(nonatomic,strong)NSMutableArray* color;
@property(strong,nonatomic)NSString *item;
@property(assign,nonatomic)CLLocationCoordinate2D  coordinates;
+ (Store *) sharedStore;
@end
