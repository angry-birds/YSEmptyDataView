//
//  YSEmptyDataView.m
//  EmptyDataDemo
//
//  Created by angrybirds on 2017/7/4.
//  Copyright © 2017年 YuanMedia. All rights reserved.
//

#import "YSEmptyDataView.h"

@interface YSEmptyDataView()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *desLabel;

@end

@implementation YSEmptyDataView

#pragma mark - LifeCycle
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.desLabel];
        
    }
    return self;
}



#pragma mark - PrivateMethod

- (void)setLayout{
    
    [self.imageView sizeToFit];
    self.imageView.center = CGPointMake(self.center.x, self.center.y - 120);
    
    CGFloat maxImageY = CGRectGetMaxY(self.imageView.frame);
    CGPoint point = CGPointMake(self.center.x, maxImageY + 20);

    if (self.title.length > 0) {
        self.titleLabel.frame = CGRectMake(20, maxImageY + 20, self.frame.size.width - 40, 0);
        [self.titleLabel sizeToFit];
        self.titleLabel.center = CGPointMake(point.x, self.titleLabel.center.y);

        if (self.des.length > 0) {
            self.desLabel.frame = CGRectMake(20, CGRectGetMaxY(self.titleLabel.frame) + 10, self.frame.size.width - 40, 0);
            [self.desLabel sizeToFit];
            self.desLabel.center = CGPointMake(point.x, self.desLabel.center.y);
        }
    }else{
        self.desLabel.frame = CGRectMake(0, maxImageY + 20, 0, 0);
        [self.desLabel sizeToFit];
        self.desLabel.center = CGPointMake(point.x, self.desLabel.center.y);
    }
}




#pragma mark - Getter and Setter


- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)desLabel{
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
        _desLabel.numberOfLines = 0;
    }
    return _desLabel;
}



- (void)setImage:(UIImage *)image{
    _image = image;
    if (!_image) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ys_empty_data_image@2x" ofType:@"png"];
        _image = [UIImage imageWithContentsOfFile:path];
    }
    self.imageView.image = _image;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    if (!_title) {
        _title = @"暂无内容";
    }
    self.titleLabel.text = _title;
}

- (void)setDes:(NSString *)des{
    _des = des;
    if (!_des) {
        _des = @"";
    }
    self.desLabel.text = _des;
}

- (void)setEmptyBackgroudColor:(UIColor *)emptyBackgroudColor{
    _emptyBackgroudColor = emptyBackgroudColor;
    if (!_emptyBackgroudColor) {
        _emptyBackgroudColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    }
    self.backgroundColor = _emptyBackgroudColor;
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:14];
    }
    self.titleLabel.font = _titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    if (!_titleColor) {
        _titleColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
    }
    self.titleLabel.textColor = _titleColor;
}

- (void)setDesFont:(UIFont *)desFont{
    _desFont = desFont;
    if (!_desFont){
        _desFont = [UIFont systemFontOfSize:12];
    }
    self.desLabel.font = _desFont;
}

- (void)setDesColor:(UIColor *)desColor{
    _desColor = desColor;
    if (!_desColor) {
        _desColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    }
    self.desLabel.textColor = _desColor;
}


@end
