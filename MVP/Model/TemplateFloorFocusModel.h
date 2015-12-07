//
//  TemplateFloorFocusModel.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateChannelFloorModel.h"

@interface TemplateFloorFocusModel : TemplateChannelFloorModel<TemplateContentProtocol>

@property (nonatomic,assign) NSNumber *width;
@property (nonatomic,assign) NSNumber *height;

@end
