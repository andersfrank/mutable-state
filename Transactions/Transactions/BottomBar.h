//
//  BottomBar.h
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomBar : UIToolbar

- (instancetype)initWithFrame:(CGRect)frame target:(id)target removeAction:(SEL)removeAction removeAllAction:(SEL)removeAllAction addAction:(SEL)addAction;

@end
