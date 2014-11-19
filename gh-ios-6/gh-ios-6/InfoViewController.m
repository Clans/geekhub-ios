//
//  InfoViewController.m
//  gh-ios-6
//
//  Created by Dmitry on 19.11.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, assign) UIWebView *webView; // ??

@end

@implementation InfoViewController

- (instancetype) initWithDeviceName:(NSString *)deviceName {
    self = [super initWithNibName:nil bundle:nil];
    if (!self) {
        return nil;
    }
    
    _deviceName = deviceName;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    _webView = webView;
    [webView release];
    
    NSString *urlPath = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", _deviceName];
    urlPath = [urlPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:_deviceName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    [_deviceName release];
    
    [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
