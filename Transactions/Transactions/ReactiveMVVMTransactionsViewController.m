//
//  TransactionsViewController.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ReactiveMVVMTransactionsViewController.h"
#import "Transaction.h"
#import "BottomBar.h"
#import "TransactionView.h"

@interface ReactiveMVVMTransactionsViewController ()

@property (nonatomic) ReactiveMVVMTransactionsViewModel *viewModel;
@property (nonatomic) TransactionView *view;

@end

@implementation ReactiveMVVMTransactionsViewController

- (instancetype)initWithViewModel:(ReactiveMVVMTransactionsViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        self.title = @"Reactive MVVM";
    }
    return self;
}

- (void)loadView {
    self.view = [[TransactionView alloc] initWithTarget:self.viewModel
                                           removeAction:@selector(removeRandomTransaction)
                                        removeAllAction:@selector(removeAllTransactions)
                                              addAction:@selector(addRandomTransaction)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    RAC(self.view.balanceLabel,text) = RACObserve(self.viewModel, balanceLabelText);
}

@end
