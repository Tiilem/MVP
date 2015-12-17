//
//  TemplateNormalView.m
//  MVP
//
//  Created by guochaoyang on 15/12/17.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateNormalView.h"
#import "TemplatePicModel.h"
#import "TemplateNormalTapView.h"
#import "TemplateNormalSubModel.h"

@class TemplateNormalSubModel;
@implementation TemplateNormalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (CGSize)calculateSizeWithData:(id<TemplateRenderProtocol>)data constrainedToSize:(CGSize)size
{
    return CGSizeMake(ScreenWidth, 100);
}

- (void)processData:(id <TemplateRenderProtocol>)data
{
    TemplateNormalSubModel *subModel = (TemplateNormalSubModel *)data;
    NSArray *picList = subModel.picList;
    switch ([subModel.pattern integerValue]) {
        case TemplateNormalStyle001:
            [self addNormalTapViewWithCount:1 picList:picList];
            break;
        case TemplateNormalStyle002:
            [self addNormalTapViewWithCount:2 picList:picList];
            break;
        case TemplateNormalStyle003:
            [self addNormalTapViewWithCount:2 picList:picList];
            break;
        case TemplateNormalStyle004:
            [self addNormalTapViewWithCount:3 picList:picList];
            break;
        case TemplateNormalStyle005:
            [self addNormalTapViewWithCount:3 picList:picList];
            break;
        case TemplateNormalStyle006:
            [self addNormalTapViewWithCount:3 picList:picList];
            break;
        case TemplateNormalStyle007:
            [self addNormalTapViewWithCount:3 picList:picList];
            break;
        case TemplateNormalStyle008:
            [self addNormalTapViewWithCount:4 picList:picList];
            break;
        case TemplateNormalStyle009:
            [self addNormalTapViewWithCount:4 picList:picList];
            break;
        default:
            break;
    }
}

- (void)addNormalTapViewWithCount:(NSInteger)count picList:(NSArray *)picList
{
    
}

@end
