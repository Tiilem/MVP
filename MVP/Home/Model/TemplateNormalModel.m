//
//  TemplateFloorNormalModel.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateNormalModel.h"

@implementation TemplateNormalModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"itemList" : @"hybridList"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"itemList" : @"TemplateNormalSubModel"
             };
}

#pragma mark - TemplateContainerProtocol

- (NSInteger)numberOfChildModelsInContainer
{
    NSUInteger rows = 0;
    if (self.fheader) rows ++;
    if (self.itemList.count) rows += self.itemList.count;
    if (self.margin) rows++;
    return rows;
}

- (id <TemplateRenderProtocol>)childFloorModelAtIndex:(NSInteger)index
{
    if (self.fheader && (index == 0))
        return self.fheader;
    if ((index > 0) && (index < self.itemList.count)) {
        return self.itemList[index];
    }
    if ((self.margin)&&(index+1) == [self numberOfChildModelsInContainer])
        return self.margin;  //最后一行
    return nil;
}

@end
