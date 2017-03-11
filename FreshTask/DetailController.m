//
//  DetailController.m
//  FreshTask
//
//  Created by Pavankumar on 11/03/17.
//  Copyright © 2017 Sample. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.titleString;
    self.detailLabel.text = self.subString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
