//
//  lostItem.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/9/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface lostItem : NSObject{
    NSMutableArray *color;
    NSString *type;
    CLLocationCoordinate2D location;
}
@property(strong, nonatomic)NSMutableArray *color;
@property(strong,nonatomic)NSString *type;
@property(assign,nonatomic)CLLocationCoordinate2D location;

@end
