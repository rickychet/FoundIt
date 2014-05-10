//
//  Store.m
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import "Store.h"

@implementation Store
@synthesize color;
@synthesize item;
@synthesize coordinates;
static Store *sharedStore = nil;

// Store* myStore = [Store sharedStore];
+ (Store *) sharedStore {
    @synchronized(self){
        if (sharedStore == nil){
            sharedStore = [[self alloc] init];
        }
    }
    
    return sharedStore;
}
@end
