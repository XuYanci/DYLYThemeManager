//
//  ViewController.m
//  DYLYThemeManager
//
//  Created by Yanci on 16/4/6.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "ViewController.h"
#import "DYLYThemeKit/DYLYThemeKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.themeChangeBtn addTarget:self
                            action:@selector(changeTheme:)
                  forControlEvents:UIControlEventTouchUpInside];
    [self.changeLabel dyly_setTextColorPicker:DYLYColorPickerWithKey(@"color")];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeTheme:(id)sender {
    static BOOL reverse = false;
    if (reverse) {
        [self.dyly_manager setCurrentTheme:DYLYThemeDay];
    }
    else {
        [self.dyly_manager setCurrentTheme:DYLYThemeNight];
    }
    reverse = !reverse;
}

@end
