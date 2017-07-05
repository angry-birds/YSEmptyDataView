//
//  EmptyDataView.h
//  EmptyDataDemo
//
//  Created by angrybirds on 2017/7/4.
//  Copyright © 2017年 YuanMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSEmptyDataView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *des;

@property (nonatomic, strong) UIColor *emptyBackgroudColor;

@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIFont *desFont;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIColor *desColor;

- (void)setLayout;

@end
