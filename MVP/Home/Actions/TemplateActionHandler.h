//
//  TemplateActionHandler.h
//  MVP
//
//  Created by guochaoyang on 15/12/18.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateAction.h"

@class TemplateActionHandler;
@protocol TemplateActionHandlerDelegate <NSObject>

@optional
- (void)actionHandler:(TemplateActionHandler *)handler willHandlerAction:(TemplateAction *)action;
- (void)actionHandler:(TemplateActionHandler *)handler didHandlerAction:(TemplateAction *)action;

@end

@interface TemplateActionHandler : NSObject

+ (instancetype)shareInstance;

- (BOOL)handlerAction:(TemplateAction *)action;

@end
