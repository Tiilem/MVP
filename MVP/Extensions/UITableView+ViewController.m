//
//  ViewController+TableView.m
//  MVP
//
//  Created by guochaoyang on 15/12/17.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "ViewController+TableView.h"
//#import "TemplateFocusCell.h"
#import "TemplateSingleCell.h"
#import "TemplateHeaderCell.h"
#import "TemplateCategoryCell.h"
#import "TemplateCategoryHeaderCell.h"
#import "TemplateMarginCell.h"

@implementation ViewController (tableView)

- (void)registTableViewCell
{
    NSArray *array = @[
                       @"TemplateFocusCell",
                       @"TemplateSingleCell",
                       @"TemplateHeaderCell",
                       @"TemplateCategoryCell",
                       @"TemplateMarginCell",
                       @"TemplateCategoryHeaderCell"
                       ];
    
    for (NSString *cell in array) {
        [self.tableView registerClass:NSClassFromString(cell) forCellReuseIdentifier:cell];
    }
}

@end
