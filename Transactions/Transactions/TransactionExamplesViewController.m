//
//  TransactionExamplesViewController.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "MutableTransactionsViewController.h"

#import "DerivedTransactionsViewController.h"
#import "TransactionExamplesViewController.h"
#import "ReactiveTransactionsViewController.h"
#import "ReactiveMVVMTransactionsViewController.h"


#import "Transaction.h"

@interface TransactionExamplesViewController ()

@property (nonatomic) NSArray *viewControllers;

@end

@implementation TransactionExamplesViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"Examples";

        self.viewControllers =
        @[
          [[MutableTransactionsViewController alloc] initWithTransactions:[self randomTransactions:4]],
          
          [[DerivedTransactionsViewController alloc] initWithTransactions:[self randomTransactions:4]],
          
          [[ReactiveTransactionsViewController alloc] initWithTransactions:[self randomTransactions:4]],
         
          [[ReactiveMVVMTransactionsViewController alloc] initWithViewModel:
          [[ReactiveMVVMTransactionsViewModel alloc] initWithTransactions:[self randomTransactions:4]]]

        ];
        
    }
    return self;
}

- (NSArray *)randomTransactions:(NSUInteger)numberOfTransactions {
    NSMutableArray *transactions = [NSMutableArray new];
    for (int i = 0; i < numberOfTransactions; i++) {
        [transactions addObject:[[Transaction alloc] initWithRandomAmount]];
    }
    return [NSArray arrayWithArray:transactions];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    UIViewController *vc = self.viewControllers[indexPath.row];
    cell.textLabel.text = vc.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:self.viewControllers[indexPath.row] animated:YES];
}

@end
