//
//  TaskTwoViewController.m
//  autolayoutSBT
//
//  Created by 1 on 26.04.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "TaskTwoViewController.h"
#import "MyRectangle.h"
#import "Masonry/Masonry.h"

@interface TaskTwoViewController ()
@property(strong,nonatomic)NSMutableArray *rects;
@end

@implementation TaskTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    self.navigationItem.title=@"Task#2";
    
    self.rects=[NSMutableArray new];
    for (NSUInteger i=0; i<4; ++i) {
        MyRectangle *rect=[MyRectangle new];
        rect.backgroundColor=[UIColor redColor];
        [self.view addSubview:rect];
        [self.rects addObject:rect];
    }
}

-(void)viewWillLayoutSubviews{
    [super viewDidLayoutSubviews];
    
        for (NSUInteger i=0; i<4; ++i) {
            [self.rects[i] mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.view.mas_centerY);
                make.size.equalTo(@(30));
                make.size.lessThanOrEqualTo(@200).with.priorityHigh();
                make.leading.mas_equalTo(30);
                make.trailing.mas_equalTo(30);
            }];        }
    }
     
     
     
     @end
