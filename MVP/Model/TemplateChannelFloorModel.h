//
//  TemplateChannelFloorModel.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateJumpProtocol.h"
#import "TemplateContainerProtocol.h"
#import "TemplateRenderProtocol.h"
#import "TemplateFloorHeaderModel.h"
#import "TemplateFloorMarginModel.h"
#import "TemplateChannelModel.h"

@interface TemplateChannelFloorModel : NSObject<TemplateContainerProtocol,TemplateJumpProtocol,TemplateRenderProtocol>

//netList
@property (nonatomic,strong) NSNumber           *identityId;
@property (nonatomic,strong) NSString           *pattern;
@property (nonatomic,strong) TemplateFloorHeaderModel *fheader;
@property (nonatomic,strong) NSArray            *skuList;
@property (nonatomic,strong) TemplateJumpModel  *jump;
@property (nonatomic,strong) TemplateFloorMarginModel *margin;
//other add
@property (nonatomic,strong) TemplateChannelModel *channelModel;
@end
