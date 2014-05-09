//
//  FoundStore.m
//  FoundIt
//
//  Created by Logan Eklund on 5/7/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "FoundStore.h"

@implementation FoundStore
@synthesize color;
@synthesize item;
@synthesize foundLocation;
@synthesize description;
@synthesize turnInLocation;
static FoundStore *sharedStore = nil;

// Store* myStore = [Store sharedStore];
+ (FoundStore *) sharedStore {
    @synchronized(self){
        if (sharedStore == nil){
            sharedStore = [[self alloc] init];
        }
    }
    
    return sharedStore;
}

@end
