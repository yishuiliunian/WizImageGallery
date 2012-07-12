//
//  WizImageGalleryView.m
//  WizImageGallery
//
//  Created by wiz on 12-7-11.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import "WizImageGalleryView.h"

#import "WizImageGalleryCell.h"

#define WizImageGalleryImageViewCount   3

@interface WizImageGalleryView() <UIScrollViewDelegate>
{
    NSArray* imageViews;
    CGSize imageViewSize;
    NSInteger numberOfImages;
    NSInteger currentIndexOfImage;
}
@property (nonatomic, retain) NSArray* imageViews;

@end

@implementation WizImageGalleryView
@synthesize sourceDelegate;
@synthesize imageViews;
@synthesize isScrolling = isScrolling_;
- (void) dealloc
{
    sourceDelegate = nil;
    [imageViews release];
    imageViews = nil;
    [super dealloc];
}
- (void) buildImageViews
{
    if ([imageViews count] >0) {
        return;
    }
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:numberOfImages];
    for (int i=0; i<numberOfImages; i++) {
        WizImageGalleryCell* imageView = [[WizImageGalleryCell alloc] initWithFrame:CGRectMake(imageViewSize.width*i, 0.0, imageViewSize.width, imageViewSize.height)];
        [array addObject:imageView];
        [self addSubview:imageView];
        [imageView release];
    }
    self.imageViews = array;
    self.contentSize = CGSizeMake(imageViewSize.width*numberOfImages, imageViewSize.height);

}
- (void) reloadData
{
    numberOfImages = [self.sourceDelegate numberOfImagesInImageGallery:self];
    imageViewSize = self.frame.size;
    [self buildImageViews];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
        self.delegate = self;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        //
        currentIndexOfImage = 0;
    }
    return self;
}
- (void) showImageInIndex:(NSInteger)index
{
    if (index < 0) {
        index = 0;
    }
    if (index > numberOfImages) {
        index = numberOfImages;
    }
    UIImage* image = [self.sourceDelegate imageSourceUrlForItem:index  inImageGallery:self];
    WizImageGalleryCell* imageView = [imageViews objectAtIndex:index];
    imageView.imageView.image = image;
}

- (NSInteger) theImageIndexForOffset:(CGPoint)offSet
{
    CGFloat currentIndexOffWidth = currentIndexOfImage * imageViewSize.width;
    CGFloat distance = offSet.x - currentIndexOffWidth;
    NSInteger distaceIndex=0;
    if (distance>0) {
       distaceIndex = ceilf(distance/imageViewSize.width);
    }
    else if (distance <0)
    {
        distaceIndex = floorf(distance/imageViewSize.width);
    }
    NSInteger ret = currentIndexOfImage + distaceIndex;
    if (ret >= numberOfImages) {
        ret = numberOfImages -1;
    }
    else if (ret <0)
    {
        ret = 0;
    }
    return ret;
}

- (void) didScrollEnd
{
    isScrolling_ = NO;
    currentIndexOfImage = [self theImageIndexForOffset:self.contentOffset];
    UIImage* image = [self.sourceDelegate imageSourceUrlForItem:currentIndexOfImage  inImageGallery:self];
    WizImageGalleryCell* imageView = [imageViews objectAtIndex:currentIndexOfImage];
    
//    CGPoint currentAncor = CGPointMake(imageViewSize.width*currentIndexOfImage, 0.0);
//    CGFloat imageViewWidth = image.size.width > imageViewSize.width ? imageViewSize.width:image.size.width;
//    CGFloat imageViewHeight = image.size.height > imageViewSize.height ? imageViewSize.height:image.size.height;
//    imageView.frame = CGRectMake(currentAncor.x + (imageViewSize.width - imageViewWidth)/2, (imageViewSize.height - imageViewHeight)/2, imageViewWidth, imageViewHeight);
    imageView.imageView.image = image;
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self didScrollEnd];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    isScrolling_ = YES;
    CGPoint currentOffSet = scrollView.contentOffset;
    NSInteger willShowIndex = [self theImageIndexForOffset:currentOffSet];
    
}
- (void)drawRect:(CGRect)rect
{
    [self reloadData];
}


@end
