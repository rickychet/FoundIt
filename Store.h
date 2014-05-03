//
//  Store.h
//  FoundIt
//
//  Created by Yuqian Chen on 5/3/14.
//  Copyright (c) 2014 Yuqian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject{
    NSMutableArray *color;
}
@property(nonatomic,strong)NSMutableArray* color;
+ (Store *) sharedStore;
@end
