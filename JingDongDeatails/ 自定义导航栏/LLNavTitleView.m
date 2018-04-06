//
//  LLNavTitleView.m
//  JingDongDeatails
//
//  Created by 兰林林 on 2018/4/6.
//  Copyright © 2018年 兰林. All rights reserved.
//

#import "LLNavTitleView.h"

@implementation LLNavTitleView
static const CGFloat btnWidth = 40.f;
static const CGFloat btnSpace = 20.f;//btn之间的间距

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.scrollEnabled = NO;
        self.contentSize = CGSizeMake(frame.size.width, frame.size.height *2);
    }
    
    return self;
}

-(void)setTitleArr:(NSArray*)titleArr{
    
    _titleArr = titleArr;
    
    for (int i =0; i<3; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(btnWidth +btnSpace), 0.f, btnWidth, 44.0f);
        [btn setTitle:_titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100 + i;
        btn.titleLabel.font = [UIFont systemFontOfSize:17.f];
        [self addSubview:btn];
        
        //添加黑色指示label
        if (i == 0) {
            [self addSubview:self.indicatorLabel];
            _indicatorLabel.frame = ({
                CGRect frame = btn.frame;
                frame.origin.y = btn.frame.size.height-2;
                frame.size.height = 2.f;
                frame;
            });
        }
        CGAffineTransform originalTransform = _indicatorLabel.transform;
    }
    
    //添加图文详情的nextTitleView和文字的titleLabel
    UIView *nextTitleView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 44.f, btnWidth*3+2*btnSpace, 44.f)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, nextTitleView.frame.size.width, nextTitleView.frame.size.height)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [nextTitleView addSubview:titleLabel];
    [self addSubview:nextTitleView];
    
    
}

-(void)btnClick:(UIButton*)sender
{
    int index = (int)sender.tag - 100;
    
    if (_btnClickBlock) {
        _btnClickBlock(index);
    }
    
}
#pragma mark - getter method
- (UILabel *)indicatorLabel {
    
    if (!_indicatorLabel) {
        
        _indicatorLabel = [[UILabel alloc] init];
        _indicatorLabel.backgroundColor = [UIColor blackColor];
        
    }
    return _indicatorLabel;
}

@end







