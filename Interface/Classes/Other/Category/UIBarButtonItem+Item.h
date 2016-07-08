//
//  UIBarButtonItem+Item.h
//  微博
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
