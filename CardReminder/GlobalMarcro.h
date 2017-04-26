//
//  GlobalMarcro.h
//  playmate
//
//  Created by AZoo on 4/14/16.
//  Copyright © 2016 egame. All rights reserved.
//

#ifndef GlobalMarcro_h
#define GlobalMarcro_h



//NavBar高度
#define NAVIGATIONBARHEIGHT                         44
//获取屏幕 宽度、高度
#define SCREENWIDTH                                 ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT                                ([UIScreen mainScreen].bounds.size.height)
#define ScrWidth                                    ([UIScreen mainScreen].bounds.size.width)
#define ScrHeight                                   ([UIScreen mainScreen].bounds.size.height)


#define PM_COLOR_YELLOW HexRGB(0xffb109)
#define PM_COLOR_GREY HexRGB(0xd8d8d8)
#define PM_COLOR_BLUE HexRGB(0x12abee)
#define PM_COLOR_TAB_GREY HexRGB(0x999999)
#define PM_COLOR_TAB_YELLOW HexRGB(0xfaa505)
#define PM_COLOR_DARK_GREY HexRGB(0x777777)
#define PM_COLOR_BG_GREY HexRGB(0xF7F5F0)
#define PM_COLOR_BTN_NORMAL_Y HexRGB(0xfff4db)
#define PM_COLOR_BTN_PRESS_Y HexRGB(0xffe6b9)
#define PM_COLOR_TEXT_GRAY HexRGB(0xcccccc)
#define PM_COLOR_LIGHT_YELLOW HexRGB(0xFFF2D8)
#define PM_COLOR_LIGHT_NAMEGRAY HexRGB(0xbbbbbb)


/**
 *  函数宏定义
 */
#define PLAYMATEUSERDEFAULT                         [NSUserDefaults standardUserDefaults]
//获取系统版本
#define IOSVERSION                                  [[[UIDevice currentDevice] systemVersion] floatValue]
#define CURRENTSYSVERSION                           [[UIDevice currentDevice] systemVersion]
//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
//读取本地图片
#define LOADIMAGE(file,ext)                         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
//定义UIImage对象
#define PMFETCHIMAGE(A)                             [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
// rgb颜色转换（16进制->10进制）
#define COlORFROMRGB(RGBVALUE)                    [UIColor colorWithRed:((float)((RGBVALUE & 0xFF0000) >> 16))/255.0 green:((float)((RGBVALUE & 0xFF00) >> 8))/255.0 blue:((float)(RGBVALUE & 0xFF))/255.0 alpha:1.0]

#define strIsUrl(str) ([str hasPrefix:@"http"])
//color
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 是否是调试模式
#define IS_DEBUG_MODE 1
#if IS_DEBUG_MODE
#define TRACE(...) NSLog(__VA_ARGS__)
#else
#define TRACE(...)
#endif

//判空
#define strIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

#endif /* GlobalMarcro_h */
