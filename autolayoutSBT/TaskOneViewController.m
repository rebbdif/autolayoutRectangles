//
//  ViewController.m
//  autolayoutSBT
//
//  Created by 1 on 25.04.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVTaskOneViewController.h"
#import "Masonry/Masonry.h"
#import "SLVRectangle.h"
#import "SLVTaskTwoViewController.h"

@interface SLVTaskOneViewController ()

@property (strong, nonatomic) NSMutableArray *rects;

@end

@implementation SLVTaskOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    self.navigationItem.title = @"Task#1";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"to Task#2" style:UIBarButtonItemStylePlain target:self action:@selector(toSecondTask:)];
    
    self.rects = [NSMutableArray new];
    for (NSUInteger i = 0; i < 4; ++i) {
        SLVRectangle *rect = [SLVRectangle new];
        rect.backgroundColor = [UIColor redColor];
        [self.view addSubview:rect];
        [self.rects addObject:rect];
    }
}

-(void)viewWillLayoutSubviews{
    for (NSUInteger i = 0; i < 4; ++i) {
        [self.rects[i] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.centerY.equalTo(self.view.mas_centerY);
            NSNumber *leadingValue = @((i + 1) * (self.view.frame.size.width - 4 * 30) / (4 + 1) + i * 30);
            make.leading.equalTo(leadingValue);
        }];
    }
    [super viewWillLayoutSubviews];
}

-(IBAction)toSecondTask:(id)sender{
    SLVTaskTwoViewController *taskTwoViewController=[SLVTaskTwoViewController new];
    [self.navigationController pushViewController:taskTwoViewController animated:YES];
}

@end
