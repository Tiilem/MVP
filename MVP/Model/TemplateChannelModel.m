//
//  TemplateBaseModel.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateChannelModel.h"
#import "TemplateChannelFloorModel.h"

NSString *const TemplateChannelPatternFocus         = @"Focus";
NSString *const TemplateChannelPatternHorizonSkus   = @"SingleGoods";
NSString *const TemplateChannelPatternNormal        = @"NormalFloor";

@implementation TemplateChannelModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"tempFloors" : @"TemplateChannelFloorModel"
             };
}

- (void)mj_objectDidFinishConvertingToKeyValues
{
    NSMutableArray * modelArray = [NSMutableArray array];
    for (NSDictionary *floorDict in self.tempFloors) {
        NSString* modelType = [self getModelWithPattern:floorDict[@"pattern"]];
        if (modelType)
        {
            Class aclass = NSClassFromString(modelType);
            if (aclass)
            {
                TemplateChannelFloorModel *floorModel = [aclass mj_objectWithKeyValues:floorDict];
                floorModel.channelModel = self;
                if (floorModel) {
                    [modelArray addObject:floorModel];
                }
            }
        }
    }
    self.floors = modelArray;
}

- (NSString *)getModelWithPattern:(NSString *)pattern
{
    return @"";
}
@end

