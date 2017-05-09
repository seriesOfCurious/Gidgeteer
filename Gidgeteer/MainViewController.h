//
//  MainViewController.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BaseGidget.h"

@interface MainViewController : BaseViewController<GidgetUpdateProtocol>

@property (nonatomic) IBOutlet UIButton *settingsButton;
@property (nonatomic) IBOutlet UIStackView *mainStackView;

@end
