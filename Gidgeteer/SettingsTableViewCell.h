//
//  SettingsViewTableViewCell.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsConstants.h"

@interface SettingsTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UILabel *cellTitle;
@property (nonatomic) IBOutlet UIButton *settingsButton;
@property (nonatomic) IBOutlet UIButton *enableButton;
@property (nonatomic) IBOutlet UIView *moveCellView;

-(void)setViewUsingData:(GidgetSettingsObject *)gidgetSettingsObject;

@end
