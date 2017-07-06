//
//  TaskTwoViewController.m
//  autolayoutSBT
//
//  Created by 1 on 26.04.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVTaskTwoViewController.h"
#import "SLVRectangle.h"
#import "Masonry/Masonry.h"

@interface SLVTaskTwoViewController ()

@property (strong, nonatomic) NSMutableArray<SLVRectangle *> *rects;

@end

@implementation SLVTaskTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"Task#2";
    
    self.rects = [NSMutableArray new];
    for (NSUInteger i = 0; i < 4; ++i) {
        SLVRectangle *rect = [SLVRectangle new];
        rect.backgroundColor = [UIColor redColor];
        [self.view addSubview:rect];
        [self.rects addObject:rect];
    }
}

-(void)viewWillLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.rects[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.equalTo(@(30)).with.priorityMedium();
        make.left.equalTo(self.view.mas_left).with.offset(30);
    }];
    [self.rects[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.equalTo(@(30)).with.priorityMedium();
        make.width.equalTo(self.rects[0].mas_width);
        make.left.equalTo(self.rects[0].mas_right).with.offset(30);
    }];
    [self.rects[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.equalTo(@(30)).with.priorityMedium();
        make.width.equalTo(self.rects[1].mas_width);
        make.left.equalTo(self.rects[1].mas_right).with.offset(30);
    }];
    [self.rects[3] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.equalTo(@(30)).with.priorityMedium();
        make.width.equalTo(self.rects[2].mas_width);
        make.left.equalTo(self.rects[2].mas_right).with.offset(30);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
    }];
    [super viewWillLayoutSubviews];
}



@end
