//
//  SettingsViewController.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SettingsViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) IBOutlet UIButton *locationButton;
@property (nonatomic) IBOutlet UITableView *settingsTableView;

@end
