//
//  ViewController.m
//  Tipster
//
//  Created by Natalie Ghidali on 6/26/18.
//  Copyright © 2018 Natalie Ghidali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *slideview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    double bill = [self.billField.text doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tipPercentage = [defaults doubleForKey:@"default_tip_percentage"];
    NSNumber* tipObject = [NSNumber numberWithDouble:tipPercentage];
    double tip = tipPercentage * bill;
    double total = bill + tip;

    self.tipsLabel.text = [NSString stringWithFormat: @"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f",total];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    self.tipControl.selectedSegmentIndex = [percentages indexOfObject:tipObject];
    
    NSLog(@"View will appear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEditingBegin:(id)sender {
    /*CGRect newFrame = self.billField.frame;
    newFrame.origin.y +=30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];*/
    [UIView animateWithDuration:1 animations:^{
        self.slideview.alpha = 0;
    }];

}
- (IBAction)onEditingEnd:(id)sender {
    /*CGRect newFrame = self.billField.frame;
    newFrame.origin.y -=30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];*/
    [UIView animateWithDuration:1 animations:^{
        self.slideview.alpha = 1;
    }];
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipsLabel.text = [NSString stringWithFormat: @"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f",total];
}

@end
