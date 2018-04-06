//
//  LLNavTitleView.h
//  JingDongDeatails
//
//  Created by 兰林林 on 2018/4/6.
//  Copyright © 2018年 兰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLNavTitleView : UIScrollView
typedef void (^btnBlock) (int index);

@property(nonatomic,strong)NSArray *titleArr; 
@property(nonatomic,strong)btnBlock btnClickBlock;
@property(nonatomic,strong)UILabel * indicatorLabel; //用Lable画线


@end
