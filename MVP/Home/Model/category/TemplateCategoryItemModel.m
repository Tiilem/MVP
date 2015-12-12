//
//  TemplateCategoryItemModel.m
//  MVP
//
//  Created by ccguo on 15/12/12.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateCategoryItemModel.h"

@implementation TemplateCategoryItemModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"subs" : @"TemplateCategorySubItemModel"
             };
}

@end
