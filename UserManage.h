//
//  UserManage.h
//  ios学习系统
//
//  Created by 邹前立 on 2017/2/15.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "Login.h"
#import "Learn.h"
@interface UserManage : NSObject

@property (nonatomic,assign) BOOL isRegisted;   // 注册成功?
@property (nonatomic,assign) BOOL isLogged;     // 登录成功？
@property (nonatomic,assign) BOOL isLogout;     // 退出成功？
- (NSString *) getInputContent; // 获取控制台输入内容
- (int) getIntValue; // 获取序号


- (void) regist:(UserInfo *) user; // 注册
- (void) login:(Login *) loginUser andUser:(UserInfo *) user; // 登录


- (void) showMenu:(UserInfo *) user andVideo:(NSMutableDictionary *) video;    // 显示当前用户学习界面
- (void) showLearnMainMenu; // 主菜单功能选择
- (void) showLearnSubMenu:(NSMutableDictionary *) video;  // 观看视频子菜单
- (void) downLoad;  // 下载视频
- (void) logout;    // 退出
@end
