//
//  TemplateFloorFocusModel.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateContainerModel.h"

@interface TemplateFloorFocusModel : TemplateContainerModel<TemplateContentProtocol>

@property (nonatomic,assign) NSNumber *width;
@property (nonatomic,assign) NSNumber *height;

@end
