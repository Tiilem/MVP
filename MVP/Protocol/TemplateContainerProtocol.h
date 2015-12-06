//
//  TemplateContainerProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateContentProtocol.h"

/**
 *  容器概念
 */
@protocol TemplateContainerProtocol <NSObject>

@required

- (NSInteger)numberOfChildFloorModelsInContainer;

- (id <TemplateContentProtocol>)childFloorModelAtIndex:(NSInteger)index;

@end

