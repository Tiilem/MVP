//
//  TemplateSkuModel.h
//  MVP
//
//  Created by ccguo on 15/12/8.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateContentProtocol.h"

@interface TemplateSkuModel : NSObject<TemplateContentProtocol>

@property (nonatomic, strong) NSString *skuId;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *pprice;
@property (nonatomic, strong) NSString *wprice;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL top;
@property (nonatomic, assign) BOOL onSell;

@end
