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

- (BOOL)isValid
{
    if (self.pattern.integerValue == TemplateNormalStyle001 && self.picList.count >= 1) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle002 && self.picList.count >= 1) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle003 && self.picList.count >= 2) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle004 && self.picList.count >= 2) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle005 && self.picList.count >= 3) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle006 && self.picList.count >= 3) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle007 && self.picList.count >= 3) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle008 && self.picList.count >= 4) {
        return YES;
    }
    else if (self.pattern.integerValue == TemplateNormalStyle009 && self.picList.count >= 4) {
        return YES;
    }
    else {
        return NO;
    }

}

@end
