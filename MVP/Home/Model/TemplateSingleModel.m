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
    if (self.margin) rows++;
    if (self.itemList) rows += (self.itemList.count);
    return rows;
}

- (id <TemplateContentProtocol>)childFloorModelAtIndex:(NSInteger)index
{
    if ((self.margin)&&(index+1) == [self numberOfChildModelsInContainer])
        return self.margin;  //最后一行
    return self.itemList[index];
}

#pragma mark - TemplateJumpProtocol

- (TemplateJumpModel *)jumpFloorModelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark -  TemplateRenderProtocol
- (NSString *)floorIdentifier
{
    if ((self.margin)&&(NSInteger)(index+1) == [self numberOfChildModelsInContainer])
        return @"TemplateHeaderCell";  //最后一行
    return @"TemplateSingleCell";
}

@end
