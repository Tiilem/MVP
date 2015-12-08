//
//  TemplateSingleView.m
//  MVP
//
//  Created by ccguo on 15/12/8.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateSingleView.h"
#import "TemplateSkuModel.h"

@interface TemplateSingleView ()
{
    UIImageView *_imageView;
    UILabel     *_pPriceLabel;
    UILabel     *_wPriceLabel;
    UILabel     *_titleLabel;
}


@end
@implementation TemplateSingleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_imageView];
        
        _pPriceLabel = [[UILabel alloc] init];
        _pPriceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_pPriceLabel];
        
        _wPriceLabel = [[UILabel alloc] init];
        _wPriceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_wPriceLabel];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_titleLabel];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(@0);
            make.left.mas_equalTo(@10);
            make.width.mas_equalTo(@100);
            make.height.mas_equalTo(@100);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(@0);
            make.left.equalTo(_imageView);
            make.right.mas_equalTo(@(5));
            make.height.mas_equalTo(@(120));
        }];
    }
    return self;
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    return size;
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    TemplateSkuModel<TemplateContentProtocol> *skuModel = (TemplateSkuModel *)data;
    
    [_imageView setImageWithURL:[NSURL URLWithString:skuModel.img]];
    [_titleLabel setText:skuModel.title];
}
@end
