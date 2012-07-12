//
//  WizImageGalleryViewController.m
//  WizImageGallery
//
//  Created by wiz on 12-7-11.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import "WizImageGalleryViewController.h"

@interface WizImageGalleryViewController ()<UIScrollViewDelegate>
{
    UIScrollView* contentScrollView;
    
    
}
@end

@implementation WizImageGalleryViewController
@synthesize imageGalleryView;
- (void) dealloc
{
    [imageGalleryView release];
    imageGalleryView = nil;
    //
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        imageGalleryView = [[WizImageGalleryView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        imageGalleryView.sourceDelegate = self;
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:imageGalleryView];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger) numberOfImagesInImageGallery:(WizImageGalleryView *)imageGallery
{
    return 5;
}

- (UIImage*) imageSourceUrlForItem:(NSInteger)index inImageGallery:(WizImageGalleryView *)imageGallery
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"%d",index]];
}
@end
