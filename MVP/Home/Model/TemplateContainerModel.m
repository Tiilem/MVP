//
//  TemplateFloorContainerModel.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateContainerModel.h"

@implementation TemplateContainerModel


#pragma mark - TemplateContainerProtocol

- (NSInteger)numberOfChildModelsInContainer
{
    return [self.itemList count];
}

- (id <TemplateRenderProtocol>)childFloorModelAtIndex:(NSInteger)index
{
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
