//
//  UserManage.m
//  ios学习系统
//
//  Created by 邹前立 on 2017/2/15.
//  Copyright © 2017年 邹前立. All rights reserved.
//
/**
 *  用户操作管理类：
     类型描述：实现注册、登录两项功能
     要求：
     (1) 显示注册成功后方可登录
     (2) 登录成功的条件必须是登录时的用户名、密码和注册时的用户名密码保持一致
     (3) 是否登录，通过序号1（登录）、2（不登录）表示
     (4) 通过scanf获取控制台输入的内容。
 */
#import "UserManage.h"
#import "UserInfo.h"
#import "Login.h"
#import "Learn.h"
@implementation UserManage

//video[@"name"] = nil;
// 获取输入内容
- (NSString *)getInputContent
{
    char buffer[1000];
    scanf("%s",buffer);
    NSString *flag = [NSString stringWithUTF8String:buffer];
    return flag;
}
// 序号
- (int)getIntValue
{
    int serialNumber = 0;
    char buffer[1000];
    scanf("%s",buffer);
    NSString *flag = [NSString stringWithUTF8String:buffer];
    serialNumber = (int)[flag intValue];
    return serialNumber;
}

// 注册用户
- (void)regist:(UserInfo *) user
{
//    _isLogout = true; // 标示没有登录
    NSLog(@"********** ios学习系统注册界面 *************");
    NSLog(@"请输入注册用户名");
    user.userName =  [self getInputContent];
    NSLog(@"请输入注册密码");
    user.userPassword = [self getInputContent];
    NSLog(@"注册成功");
    _isRegisted = true; // 标示注册成功
}
// 登录
- (void) login:(Login *) loginUser andUser:(UserInfo *) user
{
    NSLog(@"********** ios学习系统登录界面 *************");
    // 注册成功，是否登录(登录选项）
    [Login loginItems];
    // 获取登录序号
    int serialNumber = [Login getIntValue];
    switch (serialNumber) {
        case 1: // 登录
            NSLog(@"请输入登录用户名");
            loginUser.loginName = [self getInputContent];
            NSLog(@"请输入登录密码");
            loginUser.loginPassword = [self getInputContent];
            if (loginUser.loginName == user.userName && loginUser.loginPassword == user.userPassword) {
                NSLog(@"登录成功");
                _isLogged = true; // 标示登录成功
                // todo 功能选择
                ///////////////////////////////////////////////
                NSLog(@"***** ios学习系统功能选择界面 *****");
                
                // 根据登录成功标识isLogged 单独调用方法
//                do {
//                    [Learn learnUI];
//                } while (true);
//            
                ///////////////////////////////////////////////
            }
            else
            {
                if (loginUser.loginName != user.userName || loginUser.loginPassword != user.userPassword) {
                    NSLog(@"用户名或密码错误");
                    [self login:loginUser andUser:user];
                }
            }
            break;
        case 2: // 不登录
            NSLog(@"退出iOS学习系统......");
            break;
        default:
            NSLog(@"输入指令错误，请重新输入");
    }
      
}

// 显示当前用户学习界面
- (void)showMenu:(UserInfo *) user andVideo:(NSMutableDictionary *) video
{
    // 一级菜单
    [self showLearnMainMenu];
    int serialNumber = [self getIntValue];
    switch(serialNumber)
    {
        case 1:// 子菜单
            [self showLearnSubMenu:video];
            // TODO观看视频
            
            break;
        case 2:// 下载
            [self downLoad];
            break;
        case 3:// 退出
            [self logout];
            // 退出后显示注册、注册成功登录、登录成功功能选择
            // 1） 回到最开始？检测退出状态 ✅
            
            // 2） 嵌套循环？❌
//            do {
//                // 注册 
//                UserManage *userManager = [[UserManage alloc] init];
//                [userManager regist:user];
//                // 注册成功 登录
//                if (userManager.isRegisted) {
//                    [userManager login:loginUser andUser:user]; // 登录
//                }
//                // 登录成功 显示iOS学习功能选择界面
//                if (userManager.isLogged) {
//                    do {
//                        [userManager showMenu:user];
//                    } while (true);
//                }
//            } while (true);
            break;
        default:
            NSLog(@"输入指令错误");
            break;
    }
}
// 显示一级菜单
- (void) showLearnMainMenu
{
    NSLog(@"请输入要选择的功能:\n 1 观看iOS学习视频\n 2 下载iOS学习资料\n 3 直接退出");
}
// 显示子菜单
- (void) showLearnSubMenu:(NSMutableDictionary *) video
{
    NSLog(@"***** 观看ios学习视频界面 *****");
    NSLog(@"请输入要选择的功能:\n 1 查询所有iOS视频\n 2 通过ID选择播放某一iOS学习视频\n 3 添加一个新的iOS视频\n 4 删除某一iOS视频");
    
    // 子菜单选项（序号）
    int serialNumber = [self getIntValue];
    switch (serialNumber) {
        // 查看
        case 1:
        {
            // todo 判断数量 ?  用字典还是数组存储
            if([video count] != 0) {
                NSLog(@"有视频哦");
                NSLog(@"视频ID: %@ 视频名称: %@ ",[video objectForKey:@"ID"],[video objectForKey:@"name"]);
            }
            else{
                NSLog(@"视频为空");
            }
            
            NSLog(@"观看iOS学习视频中...");
            break;

        }
        // ID 播放
        case 2:
        {
            // todo 判断数量
            NSLog(@"请输入要观看的视频ID");
            int ID = [self getIntValue];
            //            if ([video count] == 0) { // 改进
            if([video[@"ID"] intValue] == ID) {
//                NSLog(@"视频ID：%@ 视频名称：%@",video[@"ID"],video[@"name"]);
                NSLog(@"视频ID：%@ 视频名称：%@",[video objectForKey:@"ID"],video[@"name"]);
            }else{
                NSLog(@"您查找的视频不存在");

            }
            NSLog(@"观看iOS学习视频中...");
            break;
        }
        // 添加
        case 3:
        {
            NSLog(@"请输入要添加的视频名称");
            NSString *videoName = [self getInputContent];
            NSLog(@"请输入要添加的视频ID,ID不能重复");// 对应ID有值 重新输入
            NSString *videoKey = [self getInputContent];
            [video setObject:videoKey forKey:@"ID"];
            [video setObject:videoName forKey:@"name"];
            NSLog(@"观看iOS学习视频中...");
            break;
        }
        // 删除
        case 4:
        {
            NSLog(@"请输入要删除的视频ID");
            int ID = [self getIntValue];
            if([[video objectForKey:@"ID"] intValue] == ID)
            {
                [video removeObjectForKey:@"ID"];
                [video removeObjectForKey:@"name"];
                NSLog(@"删除成功");

            }else{
                NSLog(@"删除失败");
            }
            NSLog(@"观看iOS学习视频中...");
            break;
        }
        
        default:
            NSLog(@"输入指令错误");
            break;
    }

}

// 下载视频
- (void)downLoad
{
    NSLog(@"***** 下载ios学习视频界面 *****");
    NSLog(@"下载ios学习资料中...");
}
// 退出
- (void)logout
{
    NSLog(@"***** 退出ios学习系统界面 *****");
    NSLog(@"退出ios学习系统...");
    // 改变登录状态
    _isLogged = false;
    _isLogout = true;
}
@end
