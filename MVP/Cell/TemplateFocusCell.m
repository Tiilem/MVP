//
//  TemplateFocusCell.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateFocusCell.h"
#import "TemplateFloorFocusView.h"
#import "TemplateFloorFocusModel.h"

@interface TemplateFocusCell (){
    TemplateFloorFocusView *_focusView;
}

@property (nonatomic,strong) id <TemplateContentProtocol> data;

@end
@implementation TemplateFocusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _focusView = [[TemplateFloorFocusView alloc] init];
        _focusView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_focusView];
        
        [_focusView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(@(ScreenWidth));
            make.height.mas_equalTo(@(164));
        }];
    }
    return self;
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    if([data isKindOfClass:[TemplateFloorFocusModel class]])
    {
        self.data = data;
        [_focusView processData:(id <TemplateContentProtocol>)data];
    }
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    return size;
}


@end
