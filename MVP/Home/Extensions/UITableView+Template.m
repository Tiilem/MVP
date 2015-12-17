//
//  UITableView+Template.m
//  MVP
//
//  Created by guochaoyang on 15/12/17.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "UITableView+Template.h"

@implementation UITableView (Template)

- (void)registTableViewCell
{
    NSArray *cellIdentifier = @[
                       @"TemplateFocusCell",
                       @"TemplateSingleCell",
                       @"TemplateHeaderCell",
                       @"TemplateCategoryCell",
                       @"TemplateMarginCell",
                       ];
    
    for (NSString * cell in cellIdentifier) {
        [self registerClass:NSClassFromString(cell) forCellReuseIdentifier:cell];
    }
    
    NSArray *headerIdentifier = @[
                                  @"TemplateCategoryHeaderCell"
                                  ];
    
    for (NSString * cell in headerIdentifier) {
        [self registerClass:NSClassFromString(cell) forHeaderFooterViewReuseIdentifier:cell];
    }

}

@end