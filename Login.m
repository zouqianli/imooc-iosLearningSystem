//
//  Login.m
//  ios学习系统
//
//  Created by 邹前立 on 2017/2/15.
//  Copyright © 2017年 邹前立. All rights reserved.
//
/**  登录服务类：
     类型描述：声明用户登录时的用户名、密码属性，以及实现选择是否登录对应的具体操作
     要求：
     (1) 用户名、密码都使用字符串类型
     (2) 设定方法通过获取输入的序号来实现对应序号的功能。其中1是登录相关操作，2是不登录相关操作，其他序号是输入指令错误。
 */
#import "Login.h"
@implementation Login
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

+ (void) loginItems
{
    NSLog(@"是否登录\n 1 登录\n 2 不登录");
//    NSLog(@"1.登录");
//    NSLog(@"2.不登录");
}
@end
