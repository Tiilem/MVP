//
//  TemplateFloorFocusView.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "TemplateFloorFocusView.h"
#import <iCarousel/iCarousel.h>
#import "TemplateFloorFocusModel.h"
#import "TemplateFloorPicModel.h"
@interface TemplateFloorFocusView ()<iCarouselDataSource,iCarouselDelegate>
{
    UIPageControl *_pageControl;
    iCarousel  *_scrollView;
}

@property (nonatomic,strong) TemplateFloorFocusModel *focusModel;
@end
@implementation TemplateFloorFocusView

- (instancetype)init
{
    self = [super init];
    if (self) {
        //imageView
        _scrollView = [[iCarousel alloc] init];
        _scrollView.delegate = self;
        _scrollView.dataSource = self;
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_scrollView];
        
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(@0);
            make.left.mas_equalTo(@0);
            make.width.mas_equalTo(@(ScreenWidth));
            make.height.mas_equalTo(@(165));
        }];
    }
    return self;
}

+ (CGSize)calculateSizeWithData:(id<NSObject>)data constrainedToSize:(CGSize)size
{
    CGSize size1;
    return size1;
}

- (void)processData:(id <TemplateContentProtocol>)data
{
    self.focusModel = (TemplateFloorFocusModel *)data;
    [_scrollView reloadData];
    
    [self layoutIfNeeded];
}

#pragma mark -
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return _focusModel.itemList.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView = nil;
    if (!view) {
         imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 165)];
        imageView.contentMode = UIViewContentModeScaleToFill;
    }else{
        imageView = (UIImageView *)view;
    }
   
    TemplateFloorPicModel *model = self.focusModel.itemList[index];
    [imageView setImageWithURL:[NSURL URLWithString:model.img]];
    return imageView;
}

@end
