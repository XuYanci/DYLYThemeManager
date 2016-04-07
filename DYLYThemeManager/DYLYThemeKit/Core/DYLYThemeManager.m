//
//  DYLYThemeManager.m
//  DYLYThemeManager
//
//  Created by Yanci on 16/4/7.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "DYLYThemeManager.h"

NSString* const DYLYThemeChangingNotification = @"DYLYThemeChangingNotification";
NSString* const DYLYThemeCurrentThemeKey = @"com.dyly.theme.currenttheme";
CGFloat const DYLYThemeAnimationDuration = 0.3;


@implementation DYLYThemeManager

+ (id)shareThemeManager {
    static dispatch_once_t once;
    static DYLYThemeManager *instance;
    dispatch_once(&once, ^{
        instance = [self new];
        NSNumber *currentTheme = [[NSUserDefaults standardUserDefaults]objectForKey:DYLYThemeCurrentThemeKey];
        /*! Default theme is DYLYTheme_Day */
        if (currentTheme == nil) {
            currentTheme = [NSNumber numberWithUnsignedInteger:DYLYTheme_Day];
        }
        
        instance.currentTheme = currentTheme.integerValue;
    
    });
    return self;
}

- (void)setCurrentTheme:(DYLYTheme)currentTheme {
    if (self.currentTheme == currentTheme) {
        return;
    }
    
    /*! Save theme */
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithUnsignedInteger:self.currentTheme]
                                             forKey:DYLYThemeCurrentThemeKey];
    [[NSUserDefaults standardUserDefaults]synchronize];

    /*! Dispatch Message & Notify Changing */
    [[NSNotificationCenter defaultCenter]postNotificationName:DYLYThemeChangingNotification object:nil];
}



@end
