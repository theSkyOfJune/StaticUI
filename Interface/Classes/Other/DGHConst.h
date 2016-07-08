//
//  DGHConst.h
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+Frame.h"

// 颜色
#define DGHRGBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]
// 全局色
#define DGHGlobalColor DGHRGBColor(223, 223, 223, 1)


/** Medium字体 */
UIKIT_EXTERN NSString *const DGHMediumFont;
/** Regular字体 */
UIKIT_EXTERN NSString *const DGHRegularFont;
/** Light字体 */
UIKIT_EXTERN NSString *const DGHLightFont;
/** 选择图片完成后的key */
UIKIT_EXTERN NSString *const DGHImagePickerOriginalImageKey;
/** 选择图片完成后发出通知的key */
UIKIT_EXTERN NSString *const DGHImagePickerDidFinishKey;

/** 余额提现导航栏右边item的右边距 */
UIKIT_EXTERN CGFloat const DGHNavigationItemRightMargin;
/** 余额提现导航栏右边item的宽高 */
UIKIT_EXTERN CGFloat const DGHNavigationItemWH;


/** 余额提现单元格图片左边距 */
UIKIT_EXTERN CGFloat const DGHWithdrawCellImageLeftMargin;
/** 余额提现单元格图片上边距 */
UIKIT_EXTERN CGFloat const DGHWithdrawCellImageUpMargin;
/** 余额提现单元格图片的宽高 */
UIKIT_EXTERN CGFloat const DGHWithdrawCellImageWH;
/** 余额提现单元格高度 */
UIKIT_EXTERN CGFloat const DGHWithdrawCellHeight;
/** 余额提现按钮上边距 */
UIKIT_EXTERN CGFloat const DGHWithdrawButtonUpMargin;
/** 提现金额单元格的高度 */
UIKIT_EXTERN CGFloat const DGHRoundRectCellHeight;


/** 余额明细单元格的高度 */
UIKIT_EXTERN CGFloat const DGHDetailCellHeight;




