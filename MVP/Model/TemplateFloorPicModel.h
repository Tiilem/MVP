//
//  TemplateFloorPicModel.h
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemplateJumpModel.h"
#import "TemplateFloorShareModel.h"

@interface TemplateFloorPicModel : NSObject
@property (nonatomic,strong) NSString           *identityId;
@property (nonatomic,strong) NSString           *img;
@property (nonatomic,assign) BOOL               isShare;
@property (nonatomic,strong) TemplateJumpModel  *jump;
@property (nonatomic,strong) TemplateFloorShareModel  *share;
@property (nonatomic,strong) NSNumber           *height;
@property (nonatomic,strong) NSNumber           *width;

@end
