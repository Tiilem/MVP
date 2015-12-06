//
//  TemplateFloorFocusView.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateCellProtocol.h"
#import "TemplateContentProtocol.h"

@protocol TemplateCellProtocol;
@protocol TemplateContentProtocol;
@interface TemplateFloorFocusView : UIView<TemplateCellProtocol>

@end
