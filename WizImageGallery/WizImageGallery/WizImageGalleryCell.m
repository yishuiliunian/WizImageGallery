//
//  WizImageGalleryCell.m
//  WizImageGallery
//
//  Created by wiz on 12-7-12.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import "WizImageGalleryCell.h"

@implementation WizImageGalleryCell
@synthesize imageView;

- (void) dealloc
{
    [self removeObserver:imageView forKeyPath:@"imageView.image" context:nil];
    [imageView release];
    [super dealloc];
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"imageView.image"])
    {
        id valueNew = [change valueForKey:@"new"];
        if (valueNew && [valueNew isKindOfClass:[UIImage class]]) {
            NSLog(@"image is %@",valueNew);
            UIImage* image = (UIImage*)valueNew;
            CGSize imageViewSize = self.frame.size;
            CGPoint currentAncor = CGPointMake(0.0, 0.0);
            CGFloat imageViewWidth = image.size.width > imageViewSize.width ? imageViewSize.width:image.size.width;
            CGFloat imageViewHeight = image.size.height > imageViewSize.height ? imageViewSize.height:image.size.height;
            imageView.frame = CGRectMake(currentAncor.x + (imageViewSize.width - imageViewWidth)/2, (imageViewSize.height - imageViewHeight)/2, imageViewWidth, imageViewHeight);
        }
       
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        [self addObserver:self forKeyPath:@"imageView.image" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    imageView.frame = CGRectMake(0.0, 0.0, rect.size.width, rect.size.width);
    [self addSubview:imageView];
}


@end
