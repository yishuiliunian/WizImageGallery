//
//  WizImageGalleryViewController.h
//  WizImageGallery
//
//  Created by wiz on 12-7-11.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WizImageGalleryView.h"
@interface WizImageGalleryViewController : UIViewController<WizImageGallerySourceDelegate>
{
    WizImageGalleryView* imageGalleryView;
}
@property (nonatomic, retain) WizImageGalleryView* imageGalleryView;
@end

