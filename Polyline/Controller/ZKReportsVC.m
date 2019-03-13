//
//  ZKReportsVC.m
//  TeacherSystem
//
//  Created by yuqiang on 2018/6/27.
//  Copyright © 2018年 izhikang. All rights reserved.
//

#import "ZKReportsVC.h"
#import "ZKReportsCell.h"
#import "ZKCourseHoursModel.h"
#import "ZKDataInfoModel.h"
#import "MJExtension.h"

@interface ZKReportsVC ()
@property (nonatomic,strong)__block NSIndexPath* index;
@property (nonatomic,strong) NSMutableArray<ZKCourseHoursModel *> *courseHours;
@property(nonatomic ,assign) NSInteger max;
@property (nonatomic,strong)ZKDataInfoModel *dataInfoModel;

@end

@implementation ZKReportsVC

-(NSMutableArray *)courseHours{
    if (_courseHours == nil) {
        _courseHours = [[NSMutableArray alloc]init];
    }
    return _courseHours;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self requestTotalCourse];
    
}

-(void)setupUI{
    self.title = @"数据图表";
//    [self.tableView registerNib:[UINib nibWithNibName:@"ZKReportsCell" bundle:nil] forCellReuseIdentifier:@"ZKReportsCellID"];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;

}

-(void)requestTotalCourse{
    NSString *str = @"{\"ret\":true,\"msg\":\"成功\",\"data\":{\"range\":[],\"courseHours\":[{\"name\":\"2019年上半年\",\"year\":2019,\"halfYear\":1,\"data\":[{\"hours\":138,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2019,\"month\":1,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":70,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2019,\"month\":2,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":30,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2019,\"month\":3,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":0,\"teacherId\":\"\",\"year\":2019,\"month\":4,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":0,\"teacherId\":\"\",\"year\":2019,\"month\":5,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":0,\"teacherId\":\"\",\"year\":2019,\"month\":6,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]},{\"name\":\"2018年下半年\",\"year\":2018,\"halfYear\":2,\"data\":[{\"hours\":176,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":7,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":150,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":8,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":60,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":9,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":92,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":10,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":94,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":11,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":122,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":12,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]},{\"name\":\"2018年上半年\",\"year\":2018,\"halfYear\":1,\"data\":[{\"hours\":56,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":1,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":108,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":2,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":84,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":3,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":82,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":4,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":94,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":5,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":100,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2018,\"month\":6,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]},{\"name\":\"2017年下半年\",\"year\":2017,\"halfYear\":2,\"data\":[{\"hours\":122,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":7,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":64,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":8,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":48,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":9,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":82,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":10,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":66,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":11,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":92,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":12,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]},{\"name\":\"2017年上半年\",\"year\":2017,\"halfYear\":1,\"data\":[{\"hours\":106,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":1,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":170,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":2,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":114,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":3,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":124,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":4,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":106,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":5,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":44,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2017,\"month\":6,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]},{\"name\":\"2016年下半年\",\"year\":2016,\"halfYear\":2,\"data\":[{\"hours\":200,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":7,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":48,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":8,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":42,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":9,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":82,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":10,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":82,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":11,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":100,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":12,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]},{\"name\":\"2016年上半年\",\"year\":2016,\"halfYear\":1,\"data\":[{\"hours\":72,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":1,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":128,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":2,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":122,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":3,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":138,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":4,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":170,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":5,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"},{\"hours\":48,\"teacherId\":\"000000000000000000005d88801301058d4de11da\",\"year\":2016,\"month\":6,\"maxHours\":\"\",\"avgHours\":\"\",\"subject\":\"\",\"cityCode\":\"\"}]}]},\"errcode\":0}";

    
    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    
    NSDictionary *dataDic = [dictionary valueForKey:@"data"];
    NSArray *hours = [dataDic valueForKey:@"courseHours"];
    
    self.courseHours = [ZKCourseHoursModel mj_objectArrayWithKeyValuesArray:hours];
    __block NSInteger max = 1;
    if (!self.courseHours.count) {
    }else{
        [self.courseHours enumerateObjectsUsingBlock:^(ZKCourseHoursModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.data enumerateObjectsUsingBlock:^(Data * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (max < [obj.hours integerValue]) {
                    max = [obj.hours integerValue];
                }
            }];
        }];
        self.max = max;·
        [self.tableView reloadData];


    }
}

-(void)requestDataInfoYear:(NSInteger)year month:(NSInteger)month {
    NSString *str = @"{\"ret\":true,\"msg\":\"成功\",\"data\":{\"totalHours\":78,\"maxHours\":188,\"avgHours\":85,\"needFeedBack\":\"\",\"feedBacked\":\"\"},\"errcode\":0}";
    
    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    NSDictionary *dataDic = [dictionary valueForKey:@"data"];
    self.dataInfoModel = [ZKDataInfoModel mj_objectWithKeyValues:dataDic];
    self.dataInfoModel.year = [NSString stringWithFormat:@"%ld",(long)year];
    self.dataInfoModel.month = [NSString stringWithFormat:@"%ld",(long)month];
    
    [self.tableView reloadData];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courseHours.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//     ZKReportsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZKReportsCellID" forIndexPath:indexPath];
    
    ZKReportsCell *cell= (ZKReportsCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"ZKReportsCell" owner:self options:nil]  lastObject];
    cell.max = self.max;
    ZKCourseHoursModel *model = self.courseHours[indexPath.row];
    if (indexPath.row == self.index.row) {
        model.dataInfoModel = self.dataInfoModel.mutableCopy;
    }
    cell.courseHoursModel = model;
    [cell setClickSelectBtnBlock:^(int index) {
        
//        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        self.index = indexPath;
        if(self.courseHours[indexPath.row].isOpen){
            [self requestDataInfoYear:[self.courseHours[indexPath.row].data[index].year integerValue] month:[self.courseHours[indexPath.row].data[index].month integerValue]];
        }else{
            [self.tableView reloadData];
        }
    }];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if (self.courseHours[indexPath.row].isOpen) {
        height = 239 + 85 + 17 - 2 -1;
    }else{
        height = 239 - 2 - 1;
    }
    return height;
}

@end
