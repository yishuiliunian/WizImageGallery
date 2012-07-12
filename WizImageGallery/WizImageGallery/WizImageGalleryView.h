//
//  WizImageGalleryView.h
//  WizImageGallery
//
//  Created by wiz on 12-7-11.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WizImageGallerySourceDelegate;

@interface WizImageGalleryView : UIScrollView
{
    id<WizImageGallerySourceDelegate> sourceDelegate;
    BOOL isScrolling;
}
@property (nonatomic, retain) id<WizImageGallerySourceDelegate> sourceDelegate;
@property (nonatomic, readonly) BOOL isScrolling;
@end
@protocol WizImageGallerySourceDelegate <NSObject>
- (NSInteger) numberOfImagesInImageGallery:(WizImageGalleryView*)imageGallery;
- (UIImage*) imageSourceUrlForItem:(NSInteger)index  inImageGallery:(WizImageGalleryView*)imageGallery;
@end