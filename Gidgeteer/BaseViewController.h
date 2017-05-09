//
//  BaseViewController.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic) IBOutlet UIView *navBarView;
@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) IBOutlet UIButton *backButton;

+(instancetype) newViewController;

@end
