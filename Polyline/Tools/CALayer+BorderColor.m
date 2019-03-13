//
//  CALayer+BorderColor.m
//  TeacherSystem
//
//  Created by 学而思 on 2017/6/13.
//  Copyright © 2017年 izhikang. All rights reserved.
//

#import "CALayer+BorderColor.h"


@implementation CALayer (BorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
