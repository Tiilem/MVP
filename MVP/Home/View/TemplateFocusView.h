//
//  TemplateFloorFocusView.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateCellProtocol.h"
#import "TemplateRenderProtocol.h"

@protocol TemplateCellProtocol;
@protocol TemplateRenderProtocol;

@interface TemplateFocusView : UIView<TemplateCellProtocol>

@end
