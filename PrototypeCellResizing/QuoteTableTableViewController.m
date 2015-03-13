//
//  QuoteTableTableViewController.m
//  PrototypeCellResizing
//
//  Created by Jeff Kunzelman on 3/12/15.
//  Copyright (c) 2015 River.io. All rights reserved.
//
//  Unfortuantly I did not come up with this pattern I was just shown a better way
//  by Kevin Macaulay

#import "QuoteTableTableViewController.h"
#import "QuoteTableViewCell.h"

@interface QuoteTableTableViewController ()

@property (nonatomic,strong)NSArray *quotes; // our content array
@property (nonatomic, strong) QuoteTableViewCell *prototypeCell; //a prototype cell we'll use to calculate size
@end

@implementation QuoteTableTableViewController

- (void)viewDidLoad
{
   [super viewDidLoad];

    //create a an array of content with random lenths
    self.quotes = @[
                        @"Frankly, my dear, I don't give a damn - Rhett Butler",
                        @"I'm going to make him an offer he can't refuse. -	Vito Corleone",
                        @"You don't understand! I coulda had class. I coulda been a contender. I could've been somebody, instead of a bum, which is what I am -Terry Malloy",
                        @"Toto, I've got a feeling we're not in Kansas anymore. -Dorothy Gale",
                        @"Here's looking at you, kid. -	Rick Blaine",
                        @"Go ahead, make my day. -Harry Callahan",
                        @"What we've got here is failure to communicate. -Captain",
                        @"I'm as mad as hell, and I'm not going to take this anymore! -Howard Beale",
                        @"Louis, I think this is the beginning of a beautiful friendship. -Rick Blaine",
                        @"A census taker once tried to test me. I ate his liver with some fava beans and a nice Chianti. -Hannibal Lecter",
                        @"Badges? We ain't got no badges! We don't need no badges! I don't have to show you any stinking badges! -Gold Hat",
                        @"One morning I shot an elephant in my pajamas. How he got in my pajamas, I don't know.",
                        @"Cinderella story. Outta nowhere. A former greenskeeper, now, about to become the Masters champion. It looks like a mirac...It's in the hole! It's in the hole! It's in the hole! -Carl Spackler",
                        @"Striker: \"Surely you can't be serious.\" Rumack: \"I am serious...and don't call me Shirley."
                        ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// create a prototype cell. this will be used to calculate size
- (QuoteTableViewCell *)prototypeCell
{
    if (!_prototypeCell)
    {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"QuoteCell"];
    }
    return _prototypeCell;
}

#pragma mark - Table view data source
//There are no sections in this example so our section count will always be 1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.quotes count];
}

//configure each cell as needed by the tableview.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuoteCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

//configure out cell for content
-(void)configureCell:(QuoteTableViewCell*)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.quoteLabel.text = [self.quotes objectAtIndex:indexPath.row];
}

//calculate the height of each row using the table's size.
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.prototypeCell configureCellForString:[self.quotes objectAtIndex:[indexPath row]]];
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    [self.prototypeCell layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

@end
