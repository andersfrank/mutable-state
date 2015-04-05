//
//  TransactionsViewController.h
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveMVVMTransactionsViewModel.h"
@interface ReactiveMVVMTransactionsViewController : UIViewController

- (instancetype)initWithViewModel:(ReactiveMVVMTransactionsViewModel *)viewModel;

@end
