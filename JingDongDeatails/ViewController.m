//
//  ViewController.m
//  JingDongDeatails
//
//  Created by 兰林林 on 2018/4/6.
//  Copyright © 2018年 兰林. All rights reserved.
//

#import "ViewController.h"
#import "LLMainViewController.h"
@interface ViewController ()

@property(nonatomic, strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.btn];
}

#pragma mark - event response
- (void)btnAction:(UIButton *)btn {
    
    LLMainViewController *productDetailViewCtrl = [[LLMainViewController alloc] init];
    [self.navigationController pushViewController:productDetailViewCtrl animated:YES];
    
}

#pragma mark - getter方法
- (UIButton *)btn {
    
    if (!_btn) {
        
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100.f, 100.f, 200.f, 100.f)];
        _btn.backgroundColor = [UIColor lightGrayColor];
        
        [_btn setTitle:@"进入商品详情" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
        
    }
    
    return _btn;
    
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
