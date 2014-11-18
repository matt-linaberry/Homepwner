//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Matthew Linaberry on 11/17/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BNRImageStore : NSObject
+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *) imageForKey:(NSString *) key;
- (void) deleteImageForKey:(NSString *) key;
@end
