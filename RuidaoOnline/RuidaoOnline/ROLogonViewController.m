//
//  ROLogonViewController.m
//  RuidaoOnline
//
//  Created by hegf on 15/7/2.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "ROLogonViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import <MBProgressHUD.h>
#import "MBProgressHUD+ROHUD.h"
#import <ACSimpleKeychain.h>
#import "ROLogonReturnModel.h"
#import "RONetworkMngTool.h"
#import "ROMainTabBarController.h"

@interface ROLogonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *checkCode;
@property (weak, nonatomic) IBOutlet UIImageView *checkCodeImage;
@property (weak, nonatomic) IBOutlet UIButton *saveUserPwdButton;
- (IBAction)saveUserPwd:(UIButton *)sender;

@end

@implementation ROLogonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化验证图片
    [self setupCheckImage];
    
    //从keychain取用户名和密码 如果取到 则自定填充到_userName _passWord.
    [self featchUserNamePwd];
}

#pragma mark 从keychain取用户名和密码 如果取到 则自定填充到_userName _passWord
- (void)featchUserNamePwd{
    NSDictionary* userPwdDict =  [[ACSimpleKeychain defaultKeychain] credentialsForIdentifier:@"user1" service:@"userpassword"];
    
    if (userPwdDict!= nil) {
        _userName.text = [userPwdDict valueForKey:ACKeychainUsername];
        _passWord.text = [userPwdDict valueForKey:ACKeychainPassword];
    }
}

#pragma mark 初始化验证图片
- (void)setupCheckImage{
    //给验证图片添加点击手势识别器 以响应用户对图片的点击事件
    _checkCodeImage.userInteractionEnabled = YES;
    
    //生成一个点击手势识别器
    UIGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkImageClicked:)];
    //添加手势识别器
    [_checkCodeImage addGestureRecognizer:tapRecognizer];
    
    //显示验证图片
    [self checkImageClicked:tapRecognizer];
}

#pragma mark 验证图片点击的响应函数
- (void)checkImageClicked:(UIGestureRecognizer*)recognizer
{
    //显示验证图片
    NSString* checkImageURLString = @"http://www.neuedu.cn/imgcode";
    NSURL* checkImageURL = [NSURL URLWithString:checkImageURLString];
  
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:checkImageURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.f];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    [_checkCodeImage setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"publish_pic1"] success:nil failure:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logon:(UIButton *)sender {
#ifdef DEBUG
    //切换window的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = [[ROMainTabBarController alloc]init];
#else
    //取得用户名和密码
    if (_userName.text.length == 0) {
        [MBProgressHUD showDelayHUDToView:self.view messeage:@"用户名没有输入"];
    }
    else
    {
        if (_passWord.text.length == 0) {
            [MBProgressHUD showDelayHUDToView:self.view messeage:@"密码没有输入"];
        }
        else
        {
            //使用Keychain 保存用户名密码
            /*
             username  用户名
             pwd       密码
             imgcode    验证码
             */
            NSDictionary *parameters = @{
                                         @"username": _userName.text,
                                         @"pwd": _passWord.text,
                                         @"imgcode": _checkCode.text,
                                         };
            
            [[RONetworkMngTool sharedNetworkMngTool] RONetwork_LogonWithParameters:parameters View:self.view Result:^(NSString *flag) {
                if ([flag isEqualToString:@"1"]) {
                    if (_saveUserPwdButton.selected == YES) {
                        [[ACSimpleKeychain defaultKeychain] storeUsername:_userName.text password:_passWord.text identifier:@"user1" forService:@"userpassword"];
                    }
                    else
                    {
                        [[ACSimpleKeychain defaultKeychain] deleteAllCredentialsForService:@"userpassword"];
                    }
                    //切换window的根控制器
                    [UIApplication sharedApplication].keyWindow.rootViewController = [[ROMainTabBarController alloc]init];
                }
            }];
        }
    }
#endif
}

#pragma mark 用户密码保存与否的选择
/*
 normal/default 按钮的默认状态 
 highlighted 当用点击了按钮 没有抬起的那段时间  按钮是处于这个状态
 selected 这种状态和用户的操作无关，用户操作不会讲按钮改变selected状态，只能是用代码改变。
 */
- (IBAction)saveUserPwd:(UIButton *)sender {
    //改变按钮的选中状态 每次点击切换选中状态
    sender.selected = !sender.selected;
}

@end
