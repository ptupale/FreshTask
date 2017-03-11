//
//  DetailController.h
//  FreshTask
//
//  Created by Pavankumar on 11/03/17.
//  Copyright © 2017 Sample. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet NSString *titleString;
@property (strong, nonatomic) IBOutlet NSArray *subString;

@end
