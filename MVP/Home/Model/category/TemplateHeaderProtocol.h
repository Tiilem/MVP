//
//  TemplateHeaderProtocol.h
//  MVP
//
//  Created by ccguo on 15/12/13.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateContentProtocol.h"

@protocol TemplateHeaderProtocol <NSObject>

- (NSString *)headerFloorIdentifier;
- (id <TemplateHeaderProtocol>)headerFloorModelAtIndex:(NSInteger)index;

@end
