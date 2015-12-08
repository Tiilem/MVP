//
//  TemplateBaseModel.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateChannelModel.h"
#import "TemplateFloorContainerModel.h"
#import "TemplateFloorFocusModel.h"

NSString *const TemplateChannelPatternFocus         = @"Focus";
NSString *const TemplateChannelPatternNormal        = @"NormalFloor";

@implementation TemplateChannelModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"tempFloors" : @"floors"
             };
}

- (void)mj_keyValuesDidFinishConvertingToObject
{
    NSMutableArray * modelArray = [NSMutableArray array];
    for (NSDictionary *floorDict in self.tempFloors) {
        NSString* modelType = [self getModelWithPattern:floorDict[@"pattern"]];
        if (modelType)
        {
            Class aclass = NSClassFromString(modelType);
            if (aclass)
            {
                TemplateFloorContainerModel *floorModel = [aclass mj_objectWithKeyValues:floorDict];
                floorModel.channelModel = self;
                if (floorModel) {
                    [modelArray addObject:floorModel];
                }
            }
        }
    }
    self.tempFloors = nil;
    self.floors = modelArray;
}

//- (id <TemplateContainerProtocol>)rowFloorModelAtIndexPath:(NSIndexPath *)indexPath
//{
//    return nil;
//}

- (id <TemplateContentProtocol>)rowModelAtIndexPath:(NSIndexPath *)indexPath
{
    TemplateFloorContainerModel *floorModel = [self.floors objectAtIndex:indexPath.section];
    id<TemplateContentProtocol> rowModel = [floorModel childFloorModelAtIndex:indexPath.row];
    return rowModel;
}

- (NSString *)getModelWithPattern:(NSString *)pattern
{
    if ([pattern isEqualToString:TemplateChannelPatternFocus]) {
        return @"TemplateFloorFocusModel";
    }
    
    if ([pattern isEqualToString:TemplateChannelPatternNormal]) {
//        return @"TemplateFloorNormalModel";
    }
    return nil;
}
@end

