//
//  main.m
//  ios学习系统
//
//  Created by 邹前立 on 2017/2/15.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserManage.h"

//int getInputValue();
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary *video = [[NSMutableDictionary alloc] init]; // 存储一个学习视频
//        video[@"ID"] = nil;
//        video[@"name"] = nil;
//        NSLog(@"%ld",[video count]);
//        return 0;
        
        // 创建注册用户、登录用户对象
        UserInfo *user = [[UserInfo alloc] init];
        Login *loginUser = [[Login alloc] init];
        
        do {
            // 注册
            UserManage *userManager = [[UserManage alloc] init];
            [userManager regist:user];
            // 注册成功 登录
            if (userManager.isRegisted) {
                [userManager login:loginUser andUser:user]; // 登录
            }
            // 登录成功 显示iOS学习功能选择界面
            if (userManager.isLogged) {
                do {
                    [userManager showMenu:user andVideo:video];
                    // 检验退出状态
                    if (userManager.isLogout) {
                        break;
                    }
                } while (true);
            }
        } while (true);
        
    }
    return 0;
}
