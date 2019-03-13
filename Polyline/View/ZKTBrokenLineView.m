//
//  ZKTBrokenLineView.m
//  LineChart
//
//  Created by yuqiang on 2017/4/13.
//  Copyright © 2017年 yuqiang. All rights reserved.
//

#import "ZKTBrokenLineView.h"
#import "UIColor+Helper.h"

#define kBtnWidth  [UIScreen mainScreen].bounds.size.width/6
#define kBtnHeight 20
#define kMargin 0
#define kBrokenLineHeight 128

@interface ZKTBrokenLineView ()
@property (nonatomic, assign) CGFloat maxMinDiff;
@end

@implementation ZKTBrokenLineView

- (instancetype)init {
    if (self = [super init]) {
        self.maxMinDiff = 180;
    }
    return self;
}
- (instancetype)initWithMaxMinDiff:(CGFloat)diff {
    ZKTBrokenLineView *instance = [self init];
    instance.maxMinDiff = diff;
    return instance;
}
-(NSMutableArray *)scoreArrM{
    if (_scoreArrM == nil) {
        _scoreArrM = [[NSMutableArray alloc]init];
    }

    return _scoreArrM;
}
//高度为180
- (void)drawRect:(CGRect)rect{
    self.maxMinDiff = 88;
    if (!self.scoreArrM.count) return;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat originY;
    if (self.maxScore - self.minScore == 0) {
        originY = self.maxMinDiff;
    }else{
        originY = ((self.maxScore - [self.scoreArrM[0] doubleValue]) * self.maxMinDiff)/(self.maxScore - self.minScore);
    }

    CGContextMoveToPoint(ctx, kBtnWidth/2, originY);
    for (int i = 1; i < self.scoreArrM.count; i++) {
        CGFloat y;
        if (self.maxScore - self.minScore == 0) {
            y = self.maxMinDiff;
        }else{
            y = ((self.maxScore - [self.scoreArrM[i] doubleValue]) * self.maxMinDiff)/(self.maxScore - self.minScore);
        }
        CGContextAddLineToPoint(ctx, kBtnWidth/2 + i*(kBtnWidth+kMargin), y);
    }
    CGContextSetLineWidth(ctx, 2);
    
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor hexStringToColor:@"fe5700"].CGColor);

    CGContextStrokePath(ctx);

}
@end
