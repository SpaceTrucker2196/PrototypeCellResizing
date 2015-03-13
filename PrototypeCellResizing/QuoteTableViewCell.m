//
//  QuoteTableViewCell.m
//  PrototypeCellResizing
//
//  Created by Jeff Kunzelman on 3/12/15.
//  Copyright (c) 2015 River.io. All rights reserved.
//
//  This example handles dynamic type by listening for UIContentSizeCategoryDidChangeNotification
//  and changing font size accordingly.

#import "QuoteTableViewCell.h"

@implementation QuoteTableViewCell

//our cell will listen for resizing notifications. This supports dynamic type resizing for accessablity. To test goto general -> accessablity -> large type
- (void)awakeFromNib {
    // Initialization code
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemContentSizeChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}
//remove ourselves as an observer
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//handled layout subviews so we can set the font and force layout changes
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView layoutIfNeeded];
    
     self.quoteLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.quoteLabel.frame);
}

//This is needed so we set the font
- (void)configureCellForString:(NSString *)content
{
    [self.quoteLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    [self.quoteLabel setText:content];

}

//when the system changes the font size reset the font to get the change
- (void)systemContentSizeChanged:(NSNotification *)notification
{
    [self.quoteLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    
}
@end
