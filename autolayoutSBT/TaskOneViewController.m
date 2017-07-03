//
//  ViewController.m
//  autolayoutSBT
//
//  Created by 1 on 25.04.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "TaskOneViewController.h"
#import "Masonry/Masonry.h"
#import "MyRectangle.h"
#import "TaskTwoViewController.h"

#define rectDimension 30


@interface TaskOneViewController ()
@property(strong,nonatomic)NSMutableArray *rects;
@end

@implementation TaskOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    self.navigationItem.title=@"Task#1";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"to Task#2" style:UIBarButtonItemStylePlain target:self action:@selector(toSecondTask:)];
    
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
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.centerY.equalTo(self.view.mas_centerY);
            NSNumber * leadingValue=@((i+1)*(self.view.frame.size.width-4*30)/(4+1)+i*30);
            make.leading.equalTo(leadingValue);
            NSLog(@"new constraint for i=%lu is %@",(unsigned long)i,leadingValue);
        }];
    }
}

-(IBAction)toSecondTask:(id)sender{
    TaskTwoViewController *taskTwoViewController=[TaskTwoViewController new];
    [self.navigationController pushViewController:taskTwoViewController animated:YES];
}

@end
