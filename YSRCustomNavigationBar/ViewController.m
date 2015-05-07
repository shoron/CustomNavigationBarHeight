//
//  ViewController.m
//  YSRCustomNavigationBar
//
//  Created by shoron on 15/5/7.
//  Copyright (c) 2015年 TEST. All rights reserved.
//

#import "ViewController.h"

static const float customNavigationBarHeight = 80.0f;
static const float standardNavigationBarHeight = 44.0f;

@interface ViewController () <UINavigationBarDelegate>

@property (nonatomic, strong) UINavigationBar *placeholderNavigationBar;

@end

@implementation ViewController

@synthesize customNavigationBar = _customNavigationBar;
@synthesize customNavigationItem = _customNavigationItem;

#pragma mark - overwrite getter & setter
- (UINavigationBar *)customNavigationBar {
    if (!_customNavigationBar) {
        _customNavigationBar = [[UINavigationBar alloc] init];
        
        // this color can be changed
        _customNavigationBar.backgroundColor = [UIColor whiteColor];
        _customNavigationBar.layer.borderWidth = 0.0f;
        _customNavigationBar.delegate = self;		
    }
    return _customNavigationBar;
}

- (UINavigationBar *)placeholderNavigationBar {
    if (!_placeholderNavigationBar) {
        _placeholderNavigationBar = [[UINavigationBar alloc] init];
        _placeholderNavigationBar.backgroundColor = [UIColor whiteColor];
        _placeholderNavigationBar.delegate = self;
    }
    return _placeholderNavigationBar;
}

- (UINavigationItem *)customNavigationItem {
    if (!_customNavigationItem) {
        _customNavigationItem = [[UINavigationItem alloc] init];
    }
    return _customNavigationItem;
}

// must user this method, when hide navigation bar
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden {
    self.customNavigationBar.hidden = navigationBarHidden;
    self.placeholderNavigationBar.hidden = navigationBarHidden;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addCustomNavigationbar];
    [self addPlaceHolderNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)addPlaceHolderNavigationBar {
    [self.view addSubview:self.placeholderNavigationBar];
    self.placeholderNavigationBar.frame = CGRectMake(0, standardNavigationBarHeight + (customNavigationBarHeight - standardNavigationBarHeight) / 2.0, self.view.bounds.size.width, (customNavigationBarHeight - standardNavigationBarHeight) / 2.0);
}

- (void)addCustomNavigationbar {
    [self.view addSubview:self.customNavigationBar];
    self.customNavigationBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, standardNavigationBarHeight + (customNavigationBarHeight - standardNavigationBarHeight) / 2.0);
    
    [self.customNavigationBar pushNavigationItem:self.customNavigationItem animated:NO];
}

- (void)addNavigationBarConstraints {

}

#pragma mark - UINavigationBarDelegate 
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar {
    return UIBarPositionAny;
}

@end
