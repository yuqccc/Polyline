//
//  ZKReportsCell.h
//  TeacherSystem
//
//  Created by yuqiang on 2018/6/28.
//  Copyright © 2018年 izhikang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKCourseHoursModel.h"
#import "ZKDataInfoModel.h"
@interface ZKReportsCell : UITableViewCell
@property (nonatomic,copy)void (^clickSelectBtnBlock)(int);
@property (weak, nonatomic) IBOutlet UIView *view;
@property (nonatomic,strong)ZKCourseHoursModel *courseHoursModel;
@property(nonatomic ,assign) NSInteger max;
@property (nonatomic,strong)ZKDataInfoModel *dataInfoModel;

@end
