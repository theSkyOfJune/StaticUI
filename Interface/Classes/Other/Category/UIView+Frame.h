//
//  UIView+Frame.h
//  MobileShop
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
/** <#注释#> */
@property (nonatomic, assign)CGSize size;
/** <#注释#> */
@property (nonatomic, assign)CGFloat centerX;
/** <#注释#> */
@property (nonatomic, assign)CGFloat centerY;
@end
