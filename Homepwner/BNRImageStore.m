//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Matthew Linaberry on 11/17/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import "BNRImageStore.h"
@interface BNRImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore
+(instancetype) sharedStore
{
    static BNRImageStore *sharedStore;
    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// call the init and its an error!
- (instancetype) init
{
    [NSException raise:@"Singleton" format:@"Use + [BNRImageStore sharedStore]"];
    
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    if (self)
    {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void) setImage:(UIImage *)image forKey:(NSString *) key
{
    self.dictionary[key]=image;
}

- (UIImage *) imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void) deleteImageForKey:(NSString *)key
{
    if (!key)
    {
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
}
@end
