//
//  UIBarButtonItem+Item.m
//  微博
//
//  Created by mac on 16/1/22.
//  Copyright © 2016年 李阳. All rights reserved.
//

/*
 UIViewContentModeScaleToFill,
 UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
 UIViewContentModeScaleAspectFill,
 */

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, 35, 25);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
//    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
