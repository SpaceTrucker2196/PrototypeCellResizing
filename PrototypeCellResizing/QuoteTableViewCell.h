//
//  QuoteTableViewCell.h
//  PrototypeCellResizing
//
//  Created by Jeff Kunzelman on 3/12/15.
//  Copyright (c) 2015 River.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuoteTableViewCell : UITableViewCell

- (void)configureCellForString:(NSString *)content;

@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

@end
