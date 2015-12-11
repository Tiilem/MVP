//
//  TemplateCellProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateContentProtocol.h"

@protocol TemplateBaseProtocol;
@protocol TemplateCellProtocol <NSObject>

+ (CGSize)calculateSizeWithData:(id<TemplateContentProtocol>)data constrainedToSize:(CGSize)size;

- (void)processData:(id <TemplateContentProtocol>)data;

@end
