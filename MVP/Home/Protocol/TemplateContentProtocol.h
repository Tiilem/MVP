//
//  TemplateContentProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateActionProtocol.h"

@protocol TemplateContainerProtocol;
@protocol TemplateContentProtocol <NSObject,TemplateActionProtocol>

- (NSString *)floorIdentifier;
- (id <TemplateContentProtocol>)headerFloor;

@end