//
//  WizImageGalleryViewController.m
//  WizImageGallery
//
//  Created by wiz on 12-7-11.
//  Copyright (c) 2012年 wiz.cn. All rights reserved.
//

#import "WizImageGalleryViewController.h"
#define WizImageGalleryImageViewCount   3

@interface WizImageGalleryViewController ()<UIScrollViewDelegate>
{
    UIScrollView* contentScrollView;
    
    NSArray* imageViews;
}
@property (nonatomic, retain) NSArray* imageViews;
@end

@implementation WizImageGalleryViewController
@synthesize imageViews;
@synthesize sourceDelegate;

- (void) dealloc
{
    sourceDelegate = nil;
    [imageViews release];
    [contentScrollView release];
    [super dealloc];
}
- (void) buildImageViews
{
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:WizImageGalleryImageViewCount];
    for (int i=0; i<WizImageGalleryImageViewCount; i++) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*i, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
        [array addObject:imageView];
        [contentScrollView addSubview:imageView];
        
        
        //
        switch (i) {
            case 0:
                imageView.backgroundColor = [UIColor redColor];
                break;
            case 1:
                imageView.backgroundColor = [UIColor lightGrayColor];
                break;
            case 2:
                imageView.backgroundColor = [UIColor blueColor];
                break;
                
            default:
                break;
        }
        
        //
        [imageView release];
    }
    self.imageViews = array;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
        contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        contentScrollView.delegate = self;
        contentScrollView.pagingEnabled = YES;
        contentScrollView.showsHorizontalScrollIndicator = NO;
        contentScrollView.showsVerticalScrollIndicator = NO;
    }
    return self;
}
- (void) reloadData
{
    [self buildImageViews];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    contentScrollView.frame = self.view.frame;
    [self.view addSubview:contentScrollView];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
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

@end
