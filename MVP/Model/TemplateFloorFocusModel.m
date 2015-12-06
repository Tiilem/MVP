//
//  TemplateFloorFocusModel.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateFloorFocusModel.h"
#import "TemplateFloorPicModel.h"

@implementation TemplateFloorFocusModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"itemList" : @"picList"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"itemList" : @"TemplateFloorPicModel"
             };
}

#pragma mark - TemplateContainerProtocol

- (NSInteger)numberOfChildFloorInContainer
{
    NSUInteger rows = 0;
    if (self.margin) rows++;
    if (self.itemList) rows++;
    return rows;
}

- (id <TemplateContentProtocol>)childFloorModelAtIndex:(NSInteger)index
{
    if ((self.margin)&&(index+1) == [self numberOfChildFloorInContainer])
        return self.margin;  //最后一行
    return nil;
}

#pragma mark - TemplateJumpProtocol

- (TemplateJumpModel *)jumpFloorModelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark -  TemplateRenderProtocol
- (NSString *)floorIdentifier
{
    return nil;
}

@end
