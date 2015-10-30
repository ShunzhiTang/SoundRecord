//
//  ViewController.m
//  SoundRecord
//
//  Created by Tsz on 15/10/30.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

//声明一个全局的 录音
@property (nonatomic , strong)AVAudioRecorder *recoeder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.recoeder record];
}

#pragma mark 把录音的懒加载出来 , 保存录音
- (AVAudioRecorder *)recoeder{
    
    if (_recoeder == nil) {
        //1、获取沙盒
        NSString *url  = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
      
        NSString *filePath = [url stringByAppendingPathComponent:@"abc.caf"];
        //2、需要加上文件协议  ,需要把NSString 转化为nsurl
        
        
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        
        //创建录音对象
        _recoeder = [[AVAudioRecorder alloc] initWithURL:fileUrl settings:nil error:nil];
    }
    return _recoeder;
}
@end
