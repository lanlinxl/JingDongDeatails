//
//  LLMainViewController.m
//  JingDongDeatails
//
//  Created by 兰林林 on 2018/4/6.
//  Copyright © 2018年 兰林. All rights reserved.
//

#import "LLMainViewController.h"
#import "LLNavTitleView.h"

@interface LLMainViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView *mainScrollView;

@property(nonatomic, strong)LLNavTitleView *titleView;

@end

@implementation LLMainViewController
static const CGFloat btnWidth = 40.f;
static const CGFloat btnSpace = 20.f;//btn之间的间距
static const CGFloat btnHeight = 44.f;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //懒加载最底层的mainScrollView
    [self.view addSubview:self.mainScrollView];
    
    //定制导航栏
    [self customNavView];
    
}


-(void)customNavView
{
    NSArray *titleArr = @[@"商品", @"详情", @"评价"];
    
    _titleView = [[LLNavTitleView alloc] initWithFrame:CGRectMake(0.f, 0.f, btnWidth*3+2*btnSpace, btnHeight)];
    _titleView.titleArr = titleArr;
    self.navigationItem.titleView = _titleView;
    
    //点击标题切换页面
    __weak typeof(self)weakSelf = self;
    _titleView.btnClickBlock = ^(int index) {
        
        [weakSelf.mainScrollView scrollRectToVisible:CGRectMake(index*weakSelf.view.frame.size.width, 0.f, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height) animated:YES];
        
    };

    [_mainScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0.f, 0.f, 25.f, 25.f);
    [shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareButtonItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(0.f, 0.f, 25.f, 25.f);
    [moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *moreButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    
    self.navigationItem.rightBarButtonItems = @[moreButtonItem, shareButtonItem];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
     CGFloat xOffset = self.mainScrollView.contentOffset.x;
     CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    int index;
    if (xOffset == screenWidth) {
        
        index = 1;
        self.titleView.indicatorLabel.transform = CGAffineTransformMakeTranslation(index*(btnWidth+btnSpace), 0.f);
        
    } else if (xOffset == 2*screenWidth) {
        
        index = 2;
         self.titleView.indicatorLabel.transform = CGAffineTransformMakeTranslation(index*(btnWidth+btnSpace), 0.f);
        
    } else if (xOffset == 0) {
        
        index = 0;
        self.titleView.indicatorLabel.transform = CGAffineTransformMakeTranslation(index*(btnWidth+btnSpace), 0.f);
    }
}

-(void)dealloc{
    
     [_mainScrollView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - event response
- (void)shareAction {
    
    NSLog(@"分享");
    
}

- (void)moreAction {
    
    NSLog(@"更多");
    
}

#pragma mark - getter方法
- (UIScrollView *)mainScrollView {
    
    if (!_mainScrollView) {
        
        //新建UIScrollView
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, self.view.frame.size.height)];
        _mainScrollView.backgroundColor = [UIColor redColor];
        _mainScrollView.contentSize = CGSizeMake(3*self.view.frame.size.width, self.view.frame.size.height -122.f);
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces = NO;
        _mainScrollView.delegate = self;
        _mainScrollView.showsHorizontalScrollIndicator = YES;
        
    }
    
    return _mainScrollView;
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

@end
