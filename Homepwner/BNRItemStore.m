//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Matthew Linaberry on 9/22/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@property (strong, nonatomic) NSMutableArray *allItemsOver50;
@property (strong, nonatomic) NSMutableArray *allItemsUnder50;
@end

@implementation BNRItemStore
-(NSMutableArray *) allItemsUnder50
{
    
    if (!_allItemsUnder50)
    {
        _allItemsUnder50 = [[NSMutableArray alloc] init];
    }
    
    return _allItemsUnder50;
}
-(NSMutableArray *) allItemsOver50
{
    
    if (!_allItemsOver50)
    {
        _allItemsOver50 = [[NSMutableArray alloc] init];
    }
    
    return _allItemsOver50;
}
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
    if (self)
    {
        _privateItems = [[NSMutableArray alloc] init];
        _allItemsOver50 = [[NSMutableArray alloc] init];
        _allItemsUnder50 = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems
{
    return [self.privateItems copy];
}

-(BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    if (item.valueInDollars > 50) {
        
        if ([self.allItemsOver50 count] == 0) { // If the itemsOver50 array currently has no items inside, add it to the privateItems array
            [self.privateItems addObject:self.allItemsOver50];
        }
        
        [self.allItemsOver50 addObject:item];
        
    } else {
        
        if ([self.allItemsUnder50 count] == 0) { // If the itemsUnder50 array currently has no items inside, add it to the privateItems array
            [self.privateItems addObject:self.allItemsUnder50];
        }
        
        [self.allItemsUnder50 addObject:item];
        
    }
    
    return item;
}

@end
