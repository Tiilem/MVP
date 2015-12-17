//
//  TemplateNormalSubModel.h
//  MVP
//
//  Created by guochaoyang on 15/12/17.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateRenderProtocol.h"
@interface TemplateNormalSubModel : NSObject<TemplateRenderProtocol>

@property (nonatomic,strong) NSString * pattern;
@property (nonatomic,strong) NSArray  * picList;
@property (nonatomic,strong) NSNumber * identityId;
@end
