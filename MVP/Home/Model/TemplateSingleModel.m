//
//  TemplateSingleModel.m
//  MVP
//
//  Created by ccguo on 15/12/8.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateSingleModel.h"

@implementation TemplateSingleModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"itemList" : @"skuList"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"itemList" : @"TemplateSkuModel"
             };
}

#pragma mark - TemplateContainerProtocol

- (NSInteger)numberOfChildModelsInContainer
{
    NSUInteger rows = 0;
    if (self.fheader) rows ++;
    if (self.itemList) rows += (self.itemList.count);
    if (self.margin) rows ++;
    return rows;
}

- (id <TemplateRenderProtocol>)childFloorModelAtIndex:(NSInteger)index
{
    if (self.fheader && (index == 0))
        return self.fheader;
    if ((index > 0) && (index < self.itemList.count))
        return self.itemList[index];
    if ((self.margin)&&(index+1) == [self numberOfChildModelsInContainer])
        return self.margin;  //最后一行
    return nil;
}

#pragma mark - TemplateJumpProtocol

- (TemplateJumpModel *)jumpFloorModelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
