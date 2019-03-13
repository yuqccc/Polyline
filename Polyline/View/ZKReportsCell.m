//
//  ZKReportsCell.m
//  TeacherSystem
//
//  Created by yuqiang on 2018/6/28.
//  Copyright © 2018年 izhikang. All rights reserved.
//

#import "ZKReportsCell.h"
#import "ZKTBrokenLineView.h"
#import "UIColor+Helper.h"
#import "UIView+Frame.h"

#define kBtnWidth  [UIScreen mainScreen].bounds.size.width/6
#define kBtnHeight 20
#define kMargin 0
#define kBrokenLineHeight 90

@interface ZKReportsCell()
@property (weak, nonatomic) IBOutlet ZKTBrokenLineView *brokenLineView;
@property (nonatomic,strong)UIColor *btnColer;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (nonatomic,strong)NSMutableArray<UIButton *> *btns;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (weak, nonatomic) IBOutlet UILabel *myLab;
@property (weak, nonatomic) IBOutlet UILabel *topLab;
@property (weak, nonatomic) IBOutlet UILabel *averageLab;
@property (weak, nonatomic) IBOutlet UIStackView *stackViewMonth;

@property (nonatomic,strong)NSArray *firstHalf;
@property (nonatomic,strong)NSArray *secondHalf;
@property (nonatomic,strong)UIButton *btn;

@end

@implementation ZKReportsCell

-(NSArray *)firstHalf{
    if (_firstHalf == nil) {
        _firstHalf = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月"];
    }
    return _firstHalf;
}

-(NSArray *)secondHalf{
    if (_secondHalf == nil) {
        _secondHalf = @[@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"];
    }
    return _secondHalf;
}

-(NSMutableArray *)btns{
    if (_btns == nil) {
        _btns = [[NSMutableArray alloc]init];
    }
    return _btns;
}

- (void)setCourseHoursModel:(ZKCourseHoursModel *)courseHoursModel{
    _courseHoursModel = courseHoursModel;
    
    self.averageLab.text = courseHoursModel.dataInfoModel.avgHours;
    self.topLab.text = courseHoursModel.dataInfoModel.maxHours;
    
    if (courseHoursModel.isOpen) {
        self.view.hidden = NO;
    }else{
        self.view.hidden = YES;
    }
    //上半年
    if([courseHoursModel.halfYear isEqualToString:@"1"]) {
        for (int i = 0; i < self.stackViewMonth.subviews.count; i++) {
            UILabel *lab = self.stackViewMonth.subviews[i];
            lab.text = self.firstHalf[i];
        }
    //下半年
    }else if([courseHoursModel.halfYear isEqualToString:@"2"]){
        for (int i = 0; i < self.stackViewMonth.subviews.count; i++) {
            UILabel *lab = self.stackViewMonth.subviews[i];
            lab.text = self.secondHalf[i];
        }
    }
    //分数背景btn
    NSInteger iScoreBtn = 100;
    for (int i = 0; i < self.stackView.subviews.count; i++) {
        if (self.courseHoursModel.data[i].isSelected) {
            iScoreBtn = i;
            UIView *view = self.stackView.subviews[i];
            view.backgroundColor = [UIColor hexStringToColor:@"E6F7FF"];
            view.layer.borderColor = [UIColor hexStringToColor:@"E6F7FF"].CGColor;
            self.myLab.text = courseHoursModel.data[i].hours;
        }
    }

    _courseHoursModel = courseHoursModel;
    self.titleLab.text = courseHoursModel.name;
    
    NSMutableArray *scoreArrM = [NSMutableArray array];
    __block NSInteger max = 0;
    __block NSInteger min = 999;

    [courseHoursModel.data enumerateObjectsUsingBlock:^(Data * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [scoreArrM addObject: @([obj.hours integerValue])];
        if ([obj.hours integerValue] > max) {
            max = [obj.hours integerValue];
        }
        if ([obj.hours integerValue] < min) {
            min = [obj.hours integerValue];
        }
    }];
    
    self.brokenLineView.scoreArrM = scoreArrM;
    self.brokenLineView.minScore = 0;
    
    self.brokenLineView.maxScore = self.max;
    
    NSMutableArray *points = [NSMutableArray array];
    
    for (int i = 0; i < self.brokenLineView.scoreArrM.count; i++) {
        CGFloat y = ((self.brokenLineView.maxScore - [self.brokenLineView.scoreArrM[i] doubleValue]) * 88)/(self.brokenLineView.maxScore - self.brokenLineView.minScore);
        CGPoint point = CGPointMake(kBtnWidth/2 + i*(kBtnWidth+kMargin), y);
        [points addObject:NSStringFromCGPoint(point)];
    }
    
    NSMutableArray *scoreBtns = [NSMutableArray array];
    for (int i = 0; i < points.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((CGPointFromString(points[i])).x - 12.5, (CGPointFromString(points[i])).y - 7 - 25, 25, 25)];
        [scoreBtns addObject:btn];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 3, 0)];
        [self.brokenLineView addSubview:btn];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.brokenLineView.scoreArrM[i]] forState:UIControlStateNormal];
        btn.userInteractionEnabled = NO;
        //        btn.backgroundColor = [UIColor redColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:[UIColor hexStringToColor:@"fe5700"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor hexStringToColor:@"ffffff"] forState:UIControlStateSelected];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"value_n"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"value_p"] forState:UIControlStateSelected];
        
        UIView *roundView = [[UIView alloc]init];
        roundView.h = 8;
        roundView.w = 8;
        roundView.center = CGPointMake((CGPointFromString(points[i])).x, (CGPointFromString(points[i])).y);
        roundView.backgroundColor = [UIColor whiteColor];
        [self.brokenLineView addSubview:roundView];
        roundView.layer.cornerRadius = 4;
        roundView.layer.borderColor = [UIColor orangeColor].CGColor;
        roundView.layer.borderWidth = 2;
    }
    
    if (iScoreBtn != 100) {
        ((UIButton *)scoreBtns[iScoreBtn]).selected = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.brokenLineView.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < self.stackView.subviews.count; i++) {
        [self.btns addObject:self.stackView.subviews[i]];
    }
}

- (IBAction)clickScoreBtn:(id)sender {
//    self.btn.backgroundColor = self.btnColer;
//    self.btnColer = ((UIButton *)sender).backgroundColor;
//    ((UIButton *)sender).backgroundColor = [UIColor hexStringToColor:@"E6F7FF"];
//    self.btn = sender;

    int index = 0;
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn = self.btns[i];
        if ([btn isEqual:sender]) {
            for (int j = 0; j < self.courseHoursModel.data.count; j++) {
                if (i == j) {
                    index = i;
                    self.courseHoursModel.data[j].isSelected = !self.courseHoursModel.data[j].isSelected;
                }else{
                    self.courseHoursModel.data[j].isSelected = NO;
                }
            }
        }
    }
    self.courseHoursModel.isOpen = NO;
    for (Data *data in self.courseHoursModel.data) {
        if (data.isSelected) {
            self.courseHoursModel.isOpen = YES;
            break;
        }
    }
    
    if (self.clickSelectBtnBlock) {
        self.clickSelectBtnBlock(index);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
