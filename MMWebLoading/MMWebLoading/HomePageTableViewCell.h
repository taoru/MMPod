//
//  HomePageTableViewCell.h
//  Investment
//
//  Created by iMac on 15/7/15.
//
//

#import <UIKit/UIKit.h>

@interface HomePageTableViewCell : UITableViewCell
 @property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@property (nonatomic,strong)IBOutlet UIView *backVie;
@property (nonatomic,strong)IBOutlet UIImageView *showAdImageVie;//年化收益
@property (nonatomic,strong)IBOutlet UILabel *NameLabel;//年化收益
@property (nonatomic,strong)IBOutlet UILabel *DetaiLabel;//%label
@end
