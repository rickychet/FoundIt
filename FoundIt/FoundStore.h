//
//  FoundStore.h
//  FoundIt
//
//  Created by Logan Eklund on 5/7/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundStore : NSObject{
NSMutableArray *color;
NSString *item;
NSArray *coordinates;
    NSArray *turnInLocation;
}
@property(nonatomic,strong)NSMutableArray* color;
@property(strong,nonatomic)NSString *item;
@property(strong,nonatomic)NSArray *foundLocation;
@property(strong, nonatomic)NSArray *turnInLocation;

+ (FoundStore *) sharedStore;
@end
