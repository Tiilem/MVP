//
//  TemplateHeaderCell.m
//  MVP
//
//  Created by ccguo on 15/12/8.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateHeaderCell.h"

@implementation TemplateHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    return CGSizeMake(ScreenWidth, 20);
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    
}


@end
