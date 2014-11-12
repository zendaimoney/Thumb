//
//  financialTableCell.h
//  Thumb
//
//  Created by peter on 14/11/12.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface financialTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *investLabel;
@property (weak, nonatomic) IBOutlet UILabel *investTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *shouYiLabel;
@property (weak, nonatomic) IBOutlet UIImageView *smallImageView;

@end
