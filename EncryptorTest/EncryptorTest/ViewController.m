//
//  ViewController.m
//  EncryptorTest
//
//  Created by ule-admin on 15/7/28.
//  Copyright (c) 2015年 lizemeng. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RSAEncryptor* rsaEncryptor = [[RSAEncryptor alloc] init];
    NSString* publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    NSString* privateKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    [rsaEncryptor loadPublicKeyFromFile: publicKeyPath];
    [rsaEncryptor loadPrivateKeyFromFile: privateKeyPath password:@"ule.com"];    // 这里，请换成你生成p12时的密码
    
    NSString* restrinBASE64STRING = [rsaEncryptor rsaEncryptString:@"I.O.S"];
    NSLog(@"Encrypted: %@", restrinBASE64STRING);       // 请把这段字符串Copy到JAVA这边main()里做测试
    NSString* decryptString = [rsaEncryptor rsaDecryptString: restrinBASE64STRING];
    NSLog(@"Decrypted: %@", decryptString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
