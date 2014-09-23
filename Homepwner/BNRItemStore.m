//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Matthew Linaberry on 9/22/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import "BNRItemStore.h"

@implementation BNRItemStore

+(instancetype) sharedStore
{
    static BNRItemStore *sharedStore;
    
    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype) init
{
    [NSException raise:@"Singleton"
                format:@"Use + [BNRItemStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    return self;
}
@end
