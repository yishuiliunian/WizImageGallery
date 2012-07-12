//
//  WizImageGalleryCell.h
//  WizImageGallery
//
//  Created by wiz on 12-7-12.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WizImageGalleryCell : UIScrollView
{
    UIImageView* imageView;
}
@property (nonatomic, readonly) UIImageView* imageView;
@end
