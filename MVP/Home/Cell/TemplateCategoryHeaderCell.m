//
//  TemplateCategoryHeaderCell.m
//  MVP
//
//  Created by ccguo on 15/12/12.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateCategoryHeaderCell.h"

@implementation TemplateCategoryHeaderCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor greenColor];
    }
    
    return self;
}

+ (CGSize)calculateSizeWithData:(id<TemplateContentProtocol>)data constrainedToSize:(CGSize)size
{
    return CGSizeMake(ScreenWidth, 60);
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    
}
@end
