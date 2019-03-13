//
//  ZKTBrokenLineView.h
//  LineChart
//
//  Created by yuqiang on 2017/4/13.
//  Copyright © 2017年 yuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKTBrokenLineView : UIView
@property (nonatomic,strong)NSMutableArray *scoreArrM;
@property(nonatomic ,assign) CGFloat minScore;
@property(nonatomic ,assign) CGFloat maxScore;


- (instancetype)initWithMaxMinDiff:(CGFloat)diff;
@end
