//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Matthew Linaberry on 9/22/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+(instancetype) sharedStore;

-(BNRItem *)createItem;
-(void) removeItem:(BNRItem *)item;
-(void) moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;
@end
