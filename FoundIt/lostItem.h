//
//  lostItem.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/9/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface lostItem : NSObject<NSCoding>{
    NSArray *color;
    NSString *type;
    NSNumber *locationLatitude;
    NSNumber *locationLongitude;

}
@property(strong, nonatomic)NSArray *color;
@property(strong,nonatomic)NSString *type;
@property(strong,nonatomic)NSNumber *locationLatitude;
@property(strong,nonatomic)NSNumber *locationLongitude;


@end
