//
//  MKSNewCandyViewController.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/16/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "MKSNewCandyViewController.h"

@interface MKSNewCandyViewController ()

@property (weak, nonatomic) IBOutlet UITextField *candyName;

@end

@implementation MKSNewCandyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.candyName) {
        Candy *candy = [Candy createCandyWithContext:self.context];
        NSError *error = nil;
        
        [candy setCandyName:self.candyName.text];
        [self.context insertObject:candy];
        [self.context save:&error];
    }
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
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
