//
//  UIView+YSEmptyData.m
//  EmptyDataDemo
//
//  Created by angrybirds on 2017/7/4.
//  Copyright © 2017年 YuanMedia. All rights reserved.
//

#import "UIView+YSEmptyData.h"
#import <objc/runtime.h>


static const void *emptyViewKey = "YSEmptyViewKey";
static const void *emptyImageKey = "YSEmptyImageKey";
static const void *emptyTitleKey = "YSEmptyTitleKey";
static const void *emptyDesKey = "YSEmptyDesKey";
static const void *emptyViewBackgroundColorKey = "YSEmptyViewBackgroundColorKey";
static const void *emptyTitleColorKey = "YSEmptyTitleColorKey";
static const void *emptyDesColorKey = "YSEmptyDesColorKey";
static const void *emptyTitleFontKey = "YSEmptyTitleFontKey";
static const void *emptyDesFontKey = "YSEmptyDesFontKey";
static const void *emptyCanScrollKey = "YSEmptyCanScrollKey";
static const void *emptyDelegateKey = "YSEmptyDelegateKey";
static const void *emptyEmptyViewTapKey = "YSEmptyEmptyViewTapKey";

@implementation UIView (YSEmptyData)
@dynamic emptyViewImage;
@dynamic emptyViewTitle;
@dynamic emptyViewDes;
@dynamic emptyTitleFont;
@dynamic emptyDesFont;
@dynamic emptyViewBackgroundColor;
@dynamic emptyTitleColor;
@dynamic emptyDesColor;
@dynamic emptyView;
@dynamic isCanScroll;
@dynamic emptyDelegate;
@dynamic emptyViewTap;

- (void)showEmptyView{

    [self.superview layoutIfNeeded];
    [self.superview layoutSubviews];
    
    NSLog(@"%f",self.frame.size.width);
    NSLog(@"%f",self.frame.size.height);
    
    self.emptyView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:self.emptyView];
    
    self.emptyView.image = objc_getAssociatedObject(self, emptyImageKey);
    self.emptyView.title = objc_getAssociatedObject(self, emptyTitleKey);
    self.emptyView.des = objc_getAssociatedObject(self, emptyDesKey);
    self.emptyView.emptyBackgroudColor = objc_getAssociatedObject(self, emptyViewBackgroundColorKey);
    self.emptyView.titleFont = objc_getAssociatedObject(self, emptyTitleFontKey);
    self.emptyView.desFont = objc_getAssociatedObject(self, emptyDesFontKey);
    self.emptyView.titleColor = objc_getAssociatedObject(self, emptyTitleColorKey);
    self.emptyView.desColor = objc_getAssociatedObject(self, emptyDesColorKey);
    
    [self.emptyView setLayout];
    
    BOOL isCanScroll = [objc_getAssociatedObject(self, emptyCanScrollKey) boolValue];
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        if (isCanScroll) {
            ((UIScrollView *)self).scrollEnabled = YES;
        }else{
            ((UIScrollView *)self).scrollEnabled = NO;
        }
    }
}

- (void)hideEmptyView{
    [self.emptyView removeFromSuperview];
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        ((UIScrollView *)self).scrollEnabled = YES;
    }   
}

- (void)tapView{
    
    if (self.emptyViewTap) {
        self.emptyViewTap();
    }
    
    
    id<YSEmptyViewDelegate> delegate = objc_getAssociatedObject(self, emptyDelegateKey);
    if ([delegate respondsToSelector:@selector(ys_emptyDataTapView:)]) {
        [delegate ys_emptyDataTapView:self.emptyView];
    }
    
}


#pragma mark - Getter
- (YSEmptyDataView *)emptyView{
    
    YSEmptyDataView *emptyView = objc_getAssociatedObject(self, emptyViewKey);
    
    if (!emptyView) {
        emptyView = [[YSEmptyDataView alloc]initWithFrame:CGRectZero];
        [self setEmptyView:emptyView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
        tap.numberOfTapsRequired = 1;
        [emptyView addGestureRecognizer:tap];
    }
    return emptyView;
}

- (EmptyViewTap)emptyViewTap{
    return  objc_getAssociatedObject(self, emptyEmptyViewTapKey);
}

#pragma mark - Setter
- (void)setEmptyView:(YSEmptyDataView *)emptyView{
    objc_setAssociatedObject(self, emptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setEmptyViewImage:(UIImage *)emptyViewImage{
    objc_setAssociatedObject(self, emptyImageKey, emptyViewImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.image = objc_getAssociatedObject(self, emptyImageKey);
    }
}

- (void)setEmptyViewDes:(NSString *)emptyViewDes{
    objc_setAssociatedObject(self, emptyDesKey, emptyViewDes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.des = objc_getAssociatedObject(self, emptyDesKey);
    }
}

- (void)setEmptyViewTitle:(NSString *)emptyViewTitle{
    objc_setAssociatedObject(self, emptyTitleKey, emptyViewTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.title = objc_getAssociatedObject(self, emptyTitleKey);
    }
}

-(void)setEmptyViewBackgroundColor:(UIColor *)emptyViewBackgroundColor{
    objc_setAssociatedObject(self, emptyViewBackgroundColorKey, emptyViewBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.emptyBackgroudColor = objc_getAssociatedObject(self, emptyViewBackgroundColorKey);
    }
}

- (void)setEmptyTitleFont:(UIFont *)emptyTitleFont{
    objc_setAssociatedObject(self, emptyTitleFontKey, emptyTitleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.titleFont = objc_getAssociatedObject(self, CFBridgingRetain(emptyTitleFont));
    }
}

- (void)setEmptyDesFont:(UIFont *)emptyDesFont{
    objc_setAssociatedObject(self, emptyDesFontKey, emptyDesFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.desFont = objc_getAssociatedObject(self, emptyDesFontKey);
    }
}

- (void)setEmptyTitleColor:(UIColor *)emptyTitleColor{
    objc_setAssociatedObject(self, emptyTitleColorKey, emptyTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.titleColor = objc_getAssociatedObject(self, CFBridgingRetain(emptyTitleColor));
    }
}

- (void)setEmptyDesColor:(UIColor *)emptyDesColor{
    objc_setAssociatedObject(self, emptyDesColorKey, emptyDesColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.emptyView) {
        self.emptyView.desColor = objc_getAssociatedObject(self, emptyDesColorKey);
    }
}

- (void)setIsCanScroll:(BOOL)isCanScroll{
    objc_setAssociatedObject(self, emptyCanScrollKey, [NSNumber numberWithBool:isCanScroll], OBJC_ASSOCIATION_RETAIN);
    
}

- (void)setEmptyDelegate:(id<YSEmptyViewDelegate>)emptyDelegate{
    objc_setAssociatedObject(self, emptyDelegateKey, emptyDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setEmptyViewTap:(EmptyViewTap)emptyViewTap{
    objc_setAssociatedObject(self, emptyEmptyViewTapKey, emptyViewTap, OBJC_ASSOCIATION_RETAIN);
}

@end
