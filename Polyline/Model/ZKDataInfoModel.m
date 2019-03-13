//
//  ZKDataInfoModel.m
//  TeacherSystem
//
//  Created by yuqiang on 2018/7/5.
//  Copyright © 2018年 izhikang. All rights reserved.
//

#import "ZKDataInfoModel.h"

@implementation ZKDataInfoModel
- (id)mutableCopyWithZone:(NSZone *)zone {
    ZKDataInfoModel *instance = [[ZKDataInfoModel alloc] init];
    if (instance) {
        instance.totalHours = [self.totalHours mutableCopyWithZone:zone];
        instance.maxHours = [self.maxHours mutableCopyWithZone:zone];
        instance.avgHours = [self.avgHours mutableCopyWithZone:zone];
        instance.needFeedBack = [self.needFeedBack mutableCopyWithZone:zone];
        instance.feedBacked = [self.feedBacked mutableCopyWithZone:zone];
        instance.year = [self.year mutableCopyWithZone:zone];
        instance.month = [self.month mutableCopyWithZone:zone];
    }
    return instance;
}


@end
