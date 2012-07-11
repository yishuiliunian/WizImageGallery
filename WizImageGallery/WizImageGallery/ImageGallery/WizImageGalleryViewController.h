//
//  WizImageGalleryViewController.h
//  WizImageGallery
//
//  Created by wiz on 12-7-11.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WizImageGallerySourceDelegate;
@interface WizImageGalleryViewController : UIViewController
{
   id<WizImageGallerySourceDelegate> sourceDelegate;
}
@property (nonatomic, assign) id<WizImageGallerySourceDelegate> sourceDelegate;
@end

@protocol WizImageGallerySourceDelegate <NSObject>

- (NSInteger) numberOfImagesInImageGallery:(WizImageGalleryViewController*)imageGallery;
- (NSURL*) imageSourceUrlForItem:(NSInteger)index  inImageGallery:(WizImageGalleryViewController*)imageGallery;
@end