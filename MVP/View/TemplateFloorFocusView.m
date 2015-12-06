//
//  TemplateFloorFocusView.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateFloorFocusView.h"
@interface TemplateFloorFocusView ()
{
    UIImageView   *_imageView;
    UIPageControl *_pageControl;
}

@end
@implementation TemplateFloorFocusView

- (instancetype)init
{
    self = [super init];
    if (self) {
        //imageView
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_imageView];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(@0);
            make.left.mas_equalTo(@0);
            make.width.mas_equalTo(@(ScreenWidth));
            make.height.mas_equalTo(@(165));
        }];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    CGSize size1;
    return size1;
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    [_imageView setImageWithURL:[NSURL URLWithString:@""]];

}
@end
