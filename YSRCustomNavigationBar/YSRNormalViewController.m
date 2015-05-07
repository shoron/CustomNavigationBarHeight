//
//  YSRNormalViewController.m
//  YSRCustomNavigationBar
//
//  Created by 于守仁 on 15/5/7.
//  Copyright (c) 2015年 TEST. All rights reserved.
//

#import "YSRNormalViewController.h"
#import "ViewController.h"

static const float standardNavigationBarHeight = 44.0f;

@interface YSRNormalViewController ()

@end

@implementation YSRNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addNavigationActions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)addNavigationActions {
    ViewController *viewController = (ViewController *)self.navigationController;
    UINavigationItem * navigationItem = [[[viewController customNavigationBar] items] objectAtIndex:0];
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, standardNavigationBarHeight, standardNavigationBarHeight)];
    [leftButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBarButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    navigationItem.leftBarButtonItem = leftBarButton;
    
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setFrame:CGRectMake(0, 0, standardNavigationBarHeight, standardNavigationBarHeight)];
    [rightButton setImage:[UIImage imageNamed:@"add.jpeg"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)leftBarButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonClicked {
    [self pushNewViewController];
}

- (void)pushNewViewController {
    UIViewController *viewController = [[UIViewController alloc] init];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [self getBackGroundColor];
    [viewController.view addSubview:view];
    view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 180);
    [viewController.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSInteger allViewControllerNumber = [[self.navigationController viewControllers] count];
    // add label
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"第%ld个",allViewControllerNumber-1];
    [viewController.view addSubview:label];
    CGRect currentViewFrame = self.view.frame;
    label.frame = CGRectMake(CGRectGetWidth(currentViewFrame)/2, CGRectGetHeight(currentViewFrame)/2, 100, 20);
    
}

- (UIColor *)getBackGroundColor {
    NSArray *colorsArray = [NSArray arrayWithObjects:[UIColor blueColor],[UIColor greenColor],[UIColor purpleColor],[UIColor orangeColor], nil];
    NSInteger randNumber = (int)(arc4random() * 10);

    return [colorsArray objectAtIndex:randNumber % [colorsArray count]];
}

@end
