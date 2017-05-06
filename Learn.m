//
//  Learn.m
//  ios学习系统
//
//  Created by 邹前立 on 2017/2/15.
//  Copyright © 2017年 邹前立. All rights reserved.
//
/**  学习服务类：
     类型描述：实现具体的学习功能
     要求：
     (1) 设定方法通过获取输入的序号来实现对应序号的功能。其中1是观看iOS学习视频，2是下载iOS学习视频，3是直接退出学习系统，其他序号是输入指令错误。在观看iOS学习视频中再实现查询、增加、删除iOS学习视频的功能。
 */
#import "Learn.h"

@implementation Learn
// 获取输入内容
+ (NSString *)getInputContent
{
    char buffer[1000];
    scanf("%s",buffer);
    NSString *flag = [NSString stringWithUTF8String:buffer];
    return flag;
}

// 序号
+ (int)getIntValue
{
    int serialNumber = 0;
    char buffer[1000];
    scanf("%s",buffer);
    NSString *flag = [NSString stringWithUTF8String:buffer];
    serialNumber = (int)[flag intValue];
    return serialNumber;
}

@end
