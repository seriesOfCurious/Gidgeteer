//
//  SettingsViewTableViewCell.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    // [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setViewUsingData:(GidgetSettingsObject *)gidgetSettingsObject {
    self.cellTitle.text = gidgetSettingsObject.gidgetTitle;
    if (gidgetSettingsObject.isEnabled) {
        
    }
    else {
        
    }
}

@end
