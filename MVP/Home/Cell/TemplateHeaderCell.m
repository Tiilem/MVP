//
//  TemplateHeaderCell.m
//  MVP
//
//  Created by ccguo on 15/12/8.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateHeaderCell.h"

@interface TemplateHeaderCell ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation TemplateHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
//        _label = [[UILabel alloc] init];
//        _label.backgroundColor = [UIColor greenColor];
//        [self.contentView addSubview:_label];
//        
//        [_label mas_makeConstraints:^(MASConstraintMaker *make){
//            make.top.equalTo(@(5));
//            make.left.equalTo(@(10));
//            make.right.equalTo(@(10));
//            make.height.equalTo(@(20));
//        }];
        
    }
    return self;
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    return CGSizeMake(ScreenWidth, 20);
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    
}


@end
