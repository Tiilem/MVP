//
//  TemplateRenderProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/12.
//  Copyright © 2015年 ccguo. All rights reserved.
//
#import "TemplateActionProtocol.h"

@protocol TemplateRenderProtocol <NSObject,TemplateActionProtocol>

- (NSString *)floorIdentifier;

@end
