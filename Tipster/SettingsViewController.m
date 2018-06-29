//
//  SettingsViewController.m
//  Tipster
//
//  Created by Natalie Ghidali on 6/27/18.
//  Copyright © 2018 Natalie Ghidali. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    NSNumber* tipObject = [NSNumber numberWithDouble:tipPercentage];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    self.tipControl.selectedSegmentIndex = [percentages indexOfObject:tipObject];
    
    NSLog(@"View will appear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onEdit:(id)sender {
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    //set the tip percentage in user defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"]; //UserDefaults allows you to save arbitrary keys and values and then retrieve these later from anywhere in your app.
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
