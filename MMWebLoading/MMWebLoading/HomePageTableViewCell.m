//
//  HomePageTableViewCell.m
//  Investment
//
//  Created by iMac on 15/7/15.
//
//

#import "HomePageTableViewCell.h"

@implementation HomePageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // self.selectedIndicator.hidden = !selected;

    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 5;      // 左右侧间距都为5
    frame.size.height -= 1;  // 高度减1
    frame.size.width -= 2*frame.origin.x; // 宽度减去两边的间距
    [super setFrame:frame];
}



@end
