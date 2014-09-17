//
//  MKSCandyDetailViewController.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/16/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "MKSCandyDetailViewController.h"

@interface MKSCandyDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *candyNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *candyImageView;

@end

@implementation MKSCandyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.candyNameLabel.text = self.candy.candyName;
    self.candyImageView.image = [UIImage imageWithData:self.candy.candyImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
