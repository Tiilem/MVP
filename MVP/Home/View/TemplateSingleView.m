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
    
    UIView *_lineView;
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
        _titleLabel.numberOfLines = 0;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_titleLabel];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor blackColor];
        [self addSubview:_lineView];
        
        _titleLabel.backgroundColor = [UIColor yellowColor];
        _pPriceLabel.backgroundColor = [UIColor purpleColor];
        _wPriceLabel.backgroundColor = [UIColor greenColor];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(@10);
            make.left.mas_equalTo(@10);
            make.width.mas_equalTo(@120);
            make.height.mas_equalTo(@120);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(@10);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.right.equalTo(@(-20));
            make.height.lessThanOrEqualTo(@(70));
        }];
        
        [_pPriceLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_titleLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(69);
            make.width.lessThanOrEqualTo(@(150));
            make.bottom.equalTo(_imageView.mas_bottom).offset(0);
        }];
        
        [_wPriceLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_pPriceLabel.mas_right).offset(20);
            make.top.equalTo(_pPriceLabel.mas_top);
            make.width.lessThanOrEqualTo(@(100));
            make.bottom.equalTo(_pPriceLabel);
        }];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(_wPriceLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(80);
            make.width.equalTo(_wPriceLabel);
            make.height.equalTo(@(1));
        }];
        
    }
    return self;
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    return size;
}

- (void)processData:(id <TemplateRenderProtocol>)data
{
    TemplateSkuModel<TemplateRenderProtocol> *skuModel = (TemplateSkuModel *)data;
    [_imageView setImageWithURL:[NSURL URLWithString:skuModel.img]];
    [_titleLabel setText:skuModel.title];
    _pPriceLabel.text = skuModel.pprice;
    _wPriceLabel.text = skuModel.wprice;
}
@end
