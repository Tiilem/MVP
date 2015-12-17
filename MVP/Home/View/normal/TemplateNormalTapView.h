//
//  TemplateNormalTapView.h
//  MVP
//
//  Created by guochaoyang on 15/12/17.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateNormalTapView : UIImageView

@property (nonatomic,copy) void (^tapBlock)(void);

@end
