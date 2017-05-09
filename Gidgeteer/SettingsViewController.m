//
//  SettingsViewController.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "SettingsConstants.h"
#import "SettingsDAO.h"

NSString *const SettingsTableCellReuseIdentifier = @"SettingsTableViewCell";

@interface SettingsViewController ()

@property (nonatomic) NSMutableArray *allGidgetsArray;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingsTableView.tableFooterView = [UIView new];
    self.allGidgetsArray = [SettingsDAO getAllGidgetsSettingsObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

-(IBAction)setLocation:(id)sender {
    
}

#pragma mark - Table View

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellObject = [self.settingsTableView dequeueReusableCellWithIdentifier:SettingsTableCellReuseIdentifier];
    if (!cellObject) {
        cellObject = [[[NSBundle mainBundle] loadNibNamed:SettingsTableCellReuseIdentifier owner:self options:nil] objectAtIndex:0];
    }
    SettingsTableViewCell *cell = cellObject;
    
    if (self.allGidgetsArray && [self.allGidgetsArray count]  >= [indexPath row] + 1) {
        GidgetSettingsObject *rowData = [self.allGidgetsArray objectAtIndex:[indexPath row]];
        [cell setViewUsingData:rowData];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allGidgetsArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
