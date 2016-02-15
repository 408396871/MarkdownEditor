//
//  ViewController.m
//  MarkdownTest
//
//  Created by 董江 on 16/2/12.
//  Copyright © 2016年 greenpoint. All rights reserved.
//
//https://daringfireball.net/projects/markdown/dingus
//https://github.com/mdiep/MMMarkdown

#import "ViewController.h"
#import "MMMarkdown.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.view.backgroundColor = [UIColor whiteColor];
    _textView.delegate = self;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSString     *markdown = textView.text;
    NSError  *error;
    NSString *HTML = [MMMarkdown HTMLStringWithMarkdown:markdown error:&error];
    
    [self loadHtmlFile:HTML];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSString     *markdown = textView.text;
    NSError  *error;
    NSString *HTML = [MMMarkdown HTMLStringWithMarkdown:markdown error:&error];
    
    [self loadHtmlFile:HTML];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSString     *markdown = textView.text;
    NSError  *error;
    NSString *HTML = [MMMarkdown HTMLStringWithMarkdown:markdown error:&error];
    
    [self loadHtmlFile:HTML];
}



//加载html数据
-(void)loadHtmlFile:(NSString *)str{
    
    [_webView loadHTMLString:str baseURL:nil];
    
}

@end
