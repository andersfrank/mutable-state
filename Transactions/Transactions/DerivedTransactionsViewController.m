//
//  TransactionsViewController.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "DerivedTransactionsViewController.h"
#import "Transaction.h"
#import "BottomBar.h"
#import "TransactionView.h"

@interface DerivedTransactionsViewController ()

@property (nonatomic) NSArray *transactions;
@property (nonatomic) TransactionView *view;

@end

@implementation DerivedTransactionsViewController

- (instancetype)initWithTransactions:(NSArray *)transactions {
    self = [super init];
    if (self) {
        self.transactions = transactions;
        self.title = @"Derived balance";
    }
    return self;
}

- (void)loadView {
    self.view = [[TransactionView alloc] initWithTarget:self
                                           removeAction:@selector(removeRandomTransaction)
                                        removeAllAction:@selector(removeAllTransactions)
                                              addAction:@selector(addRandomTransaction)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateBalanceLabel];
}

- (void)updateBalanceLabel {
    self.view.balanceLabel.text = [NSString stringWithFormat:@"Current balance: $%0.1f",[self balance]];
}

- (CGFloat)balance {
    return [self sumOfTransactions:self.transactions];
}

- (CGFloat )sumOfTransactions:(NSArray *)transactions {
    __block CGFloat sum = 0;
    [transactions enumerateObjectsUsingBlock:^(Transaction *transaction, NSUInteger idx, BOOL *stop) {
        sum += transaction.amount;
    }];
    return sum;
}

#pragma mark - Actions

- (void)addRandomTransaction {
    if (!self.transactions) {
        self.transactions = @[];
    }
    self.transactions = [self.transactions arrayByAddingObject:[[Transaction alloc] initWithRandomAmount]];
    [self updateBalanceLabel];
}

- (void)removeRandomTransaction {
    if (self.transactions.count == 0) {
        return;
    }
    
    NSMutableArray *transactions = [NSMutableArray arrayWithArray:self.transactions];
    Transaction *transaction = transactions[arc4random_uniform((int)[transactions count])];
    [transactions removeObject:transaction];
    self.transactions = [NSArray arrayWithArray:transactions];
    [self updateBalanceLabel];
    
}

- (void)removeAllTransactions {
    self.transactions = @[];
    [self updateBalanceLabel];
}

@end
