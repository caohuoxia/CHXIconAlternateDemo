//
//  ViewController.m
//  CHXIconAlternateDemo
//
//  Created by admin on 2017/4/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickBtn:(id)sender {
    [self changeAppIcon];
}

- (void)changeAppIcon
{
    NSMutableArray *icomNameArray = [NSMutableArray arrayWithObjects:@"newIcon0",@"newIcon1",@"newIcon2", nil];
    int i = (arc4random() % icomNameArray.count);
    
    //ios10.3之后，更改icon图标的api才有效
    if ([UIApplication sharedApplication].supportsAlternateIcons) {
        NSLog(@"you can change this app's icon");
    }else{
        NSLog(@"you can not change this app's icon");
        return;
    }
    
    NSString *iconName = [[UIApplication sharedApplication] alternateIconName];
    
    if (iconName) {
        // change to primary icon
        [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"set icon error: %@",error);
                return;
            }
            NSLog(@"The alternate icon's name is %@",iconName);
        }];
    }else{
        // change to alterante icon,随机获取alternate icon
        [[UIApplication sharedApplication] setAlternateIconName:[NSString stringWithFormat:@"newIcon%d",i] completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"set icon error: %@",error);
                return;
            }
            NSLog(@"The alternate icon's name is %@",iconName);
        }];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
