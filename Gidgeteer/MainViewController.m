//
//  MainViewController.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "MainViewController.h"
#import "SettingsViewController.h"
#import "SettingsDAO.h"
#import "FontUtil.h"

@interface MainViewController ()

@property (nonatomic) NSMutableArray *gidgetArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.gidgetArray = [SettingsDAO getAllGidgetsDisplayableGidgetsForViewController:self];
    [self setUpDisplay];
    
    
    //test
    [FontUtil setFontInAllViewsAndSubviewsOf:self.view preserveSize:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for(BaseGidget *eachGidget in self.gidgetArray) {
        [eachGidget updateView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Display
-(void)setUpDisplay {
    for(BaseGidget *eachGidget in self.gidgetArray) {
        [self.mainStackView addArrangedSubview:eachGidget];
    }
}


#pragma mark - Navigation

-(IBAction)goToSettings:(id)sender {
    SettingsViewController *settingsVC = [SettingsViewController newViewController];
    [self.navigationController pushViewController:settingsVC animated:YES];
}

#pragma mark - Gidget Update Protocol
-(void)updateGidget:(BaseGidget *)gidget {
    for(BaseGidget *eachGidget in self.gidgetArray) {
        if(eachGidget == gidget) {
            //
        }
    }
}

@end
