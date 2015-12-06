//
//  TemplateBaseModel.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateContainerProtocol.h"

#import "TemplateHeaderModel.h"

@interface TemplateChannelModel : NSObject

//netList
@property (nonatomic,strong) NSNumber *channelFloorSize;
@property (nonatomic,strong) NSArray  *tempFloors;
@property (nonatomic,strong) NSArray  *floors;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) BOOL     code;
@property (nonatomic,strong) NSNumber *executeTime;
@property (nonatomic,strong) TemplateHeaderModel *head;

//other add

//- (id <TemplateContainerProtocol>)rowFloorModelAtIndexPath:(NSIndexPath *)indexPath;

- (id <TemplateContentProtocol>)rowModelAtIndexPath:(NSIndexPath *)indexPath;

@end
