//
//  UIView+YSEmptyData.h
//  EmptyDataDemo
//
//  Created by angrybirds on 2017/7/4.
//  Copyright © 2017年 YuanMedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSEmptyDataView.h"

@protocol YSEmptyViewDelegate <NSObject>

- (void)ys_emptyDataTapView:(UIView *)view;

@end

typedef void(^EmptyViewTap) (void);

@interface UIView (YSEmptyData)

/// 图片
@property (nonatomic, strong) UIImage *emptyViewImage;

/// 标题
@property (nonatomic, strong) NSString *emptyViewTitle;

/// 描述
@property (nonatomic, strong) NSString *emptyViewDes;

/// 标题Font
@property (nonatomic, strong) UIFont *emptyTitleFont;

/// 描述Font
@property (nonatomic, strong) UIFont *emptyDesFont;

/// 背景色
@property (nonatomic, strong) UIColor *emptyViewBackgroundColor;

/// 标题颜色
@property (nonatomic, strong) UIColor *emptyTitleColor;

/// 描述颜色
@property (nonatomic, strong) UIColor *emptyDesColor;

/// Scroller是否可以滚动 默认不能
@property (nonatomic, assign) BOOL isCanScroll;

@property (nonatomic, strong, readonly) YSEmptyDataView *emptyView;

@property (nonatomic, strong) EmptyViewTap emptyViewTap;

@property (nonatomic, weak) id <YSEmptyViewDelegate> emptyDelegate;

- (void)showEmptyView;

- (void)hideEmptyView;


@end

