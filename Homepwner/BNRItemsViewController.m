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

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[[BNRItemStore sharedStore] allItems] count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *allItems = [[BNRItemStore sharedStore] allItems];
    NSInteger lastSectionIndex = [tableView numberOfSections] - 1;
    if (section == lastSectionIndex) {
        return [allItems[section] count] + 1;
    } else {
        return [allItems[section] count];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *allItems = [[BNRItemStore sharedStore] allItems];
    if ([allItems[section] count] > 0) {
        if (section == 0) {
            return @"Items Over $50";
        } else {
            return @"Items Under $50";
        }
    } else {
        return nil;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *allItems = [[BNRItemStore sharedStore] allItems];
    
    NSInteger lastSectionIndex = [tableView numberOfSections] - 1;
    NSInteger lastRowIndex = [tableView numberOfRowsInSection:lastSectionIndex] - 1;
    
    if ((indexPath.section == lastSectionIndex) && (indexPath.row == lastRowIndex)) {
        cell.textLabel.text = @"No more items!";
    } else {
        BNRItem *item = allItems[indexPath.section][indexPath.row];
        cell.textLabel.text = [item description];
    }
    
    return cell;
}


@end
