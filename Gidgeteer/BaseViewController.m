//
//  BaseViewController.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

+(instancetype) newViewController {
    id vc = [((UIViewController *)[[self class] alloc]) initWithNibName:NSStringFromClass([self class]) bundle:nil];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
