//
//  Login.h
//  ios学习系统
//
//  Created by 邹前立 on 2017/2/15.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Login : NSObject
@property (nonatomic,copy) NSString *loginName;// 登录名
@property (nonatomic,copy) NSString *loginPassword;// 登录密码
+ (int) getIntValue; // 获取登录输入序号
+ (void) loginItems; // 是否登录选项
@end
