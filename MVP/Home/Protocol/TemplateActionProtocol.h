//
//  TemplateActionProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateJumpModel.h"
/**
 *  <#Description#>
 */
@protocol TemplateActionProtocol <NSObject>

- (TemplateJumpModel *)jumpFloorModelAtIndexPath:(NSIndexPath *)indexPath;

@end

