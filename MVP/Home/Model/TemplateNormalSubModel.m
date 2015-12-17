//
//  TemplateNormalSubModel.m
//  MVP
//
//  Created by guochaoyang on 15/12/17.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateNormalSubModel.h"

@implementation TemplateNormalSubModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"picList" : @"TemplatePicModel"
             };
}

- (NSString *)floorIdentifier
{
    return @"TemplateNormalCell";
}

@end
