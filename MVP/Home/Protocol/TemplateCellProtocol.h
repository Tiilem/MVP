//
//  TemplateCellProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateRenderProtocol.h"

@protocol TemplateBaseProtocol;
@protocol TemplateCellProtocol <NSObject>

+ (CGSize)calculateSizeWithData:(id<TemplateRenderProtocol>)data constrainedToSize:(CGSize)size;

- (void)processData:(id <TemplateRenderProtocol>)data;

@end
