//
//  TemplateSpecialRenderProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/13.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateRenderProtocol.h"

@protocol TemplateSpecialRenderProtocol <NSObject>

- (NSString *)headerFloorIdentifier;
- (id <TemplateSpecialRenderProtocol>)headerFloorModelAtIndex:(NSInteger)index;

@end
