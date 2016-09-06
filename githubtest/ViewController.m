//
//  ViewController.m
//  githubtest
//
//  Created by cloudmaxis on 06/09/16.
//  Copyright © 2016 cloudmaxis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>

@end

@implementation ViewController
@synthesize label1,label2,button1,button2,button3;
- (void)viewDidLoad {
    label1.text = @"Username";
    label2.text = @"Password";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)click1:(id)sender
{
    
       NSString *string = @"https://api.github.com/users/";
   NSString *str1 = [string stringByAppendingString:_text1.text];
        NSURL *url = [NSURL URLWithString:str1];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dict-->%@",dict);
        //NSString *errstr = [dict valueForKey: @"message"];
        if (dict[@"message"])
        {
//            NSLog(@"hai");
//           UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Not Found" preferredStyle:UIAlertControllerStyleAlert];
//           
//           UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];           [alertController addAction:ok];
//           
//           [self presentViewController:alertController animated:YES completion:nil];
//                   }
//        
//            NSLog(@"hello");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"hai" message:@"hello" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
            [alert show];
        }
        
      
   
                }];
  
   [task resume];
   
    

}


@end
