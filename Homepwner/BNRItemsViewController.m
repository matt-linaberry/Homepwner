//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Matthew Linaberry on 9/22/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController
- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        for (int i = 0; i < 5; i ++)
        {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
    
}

- (instancetype) initWithStyle:(UITableViewStyle) style
{
    return [self init];
}
@end
