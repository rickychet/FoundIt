//
//  lostItem.m
//  FoundIt
//
//  Created by Yuqian Chen on 5/9/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "lostItem.h"

@implementation lostItem
@synthesize color;
@synthesize type;
@synthesize locationLatitude;
@synthesize locationLongitude;
-(void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:color forKey:@"color"];
    [encoder encodeObject:type forKey:@"type"];
    [encoder encodeObject:locationLatitude forKey:@"locationLatitude"];
    [encoder encodeObject:locationLongitude forKey:@"locationLongitude"];
}
-(id)initWithCoder:(NSCoder *)decoder{
    color = [decoder decodeObjectForKey:@"color"];
    type = [decoder decodeObjectForKey:@"type"];
    locationLongitude = [decoder decodeObjectForKey:@"locationLongitude"];
    locationLatitude =[decoder decodeObjectForKey:@"locationLatitude"];
    return self;
}
@end
