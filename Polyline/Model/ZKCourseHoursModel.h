//
//  ZKCourseHoursModel.h
//  TeacherSystem
//
//  Created by yuqiang on 2018/7/6.
//  Copyright © 2018年 izhikang. All rights reserved.
//

#import "ZKDataInfoModel.h"

@class Data;
@interface ZKCourseHoursModel : NSObject
//"name": "2018年下半季度",
//"year": 2018,
//"halfYear": 2,
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *year;
@property (nonatomic,copy)NSString *halfYear;
@property (nonatomic, strong) NSArray<Data*> *data;
@property(nonatomic ,assign) BOOL isOpen;

@property (nonatomic,strong) ZKDataInfoModel *dataInfoModel;

@end


@interface Data : NSObject
//"hours": 24,
//"teacherId": "ff8080813654ef6c013681d0fa2b7dde",
//"year": 2018,
//"month": 7,
//"maxHours": "",
//"avgHours": "",
//"subject": "",
//"cityCode": ""
@property (nonatomic, copy) NSString *hours;
@property (nonatomic, copy) NSString *teacherId;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *maxHours;
@property (nonatomic, copy) NSString *avgHours;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *cityCode;
@property(nonatomic ,assign) BOOL isSelected;

@end
