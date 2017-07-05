//
//  ViewController.m
//  EmptyDataDemo
//
//  Created by angrybirds on 2017/7/4.
//  Copyright © 2017年 YuanMedia. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YSEmptyData.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, YSEmptyViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.tableView.emptyTitleFont = [UIFont systemFontOfSize:18];
    self.tableView.emptyDesFont = [UIFont systemFontOfSize:12];
    self.tableView.emptyViewDes = @"您访问的页面暂时没有内容~";
    
    self.tableView.emptyDelegate = self;
    
    self.tableView.emptyViewTap = ^{
        [self.tableView hideEmptyView];
    };
    
    
}

- (void)ys_emptyDataTapView:(UIView *)view{
    [self.tableView hideEmptyView];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView showEmptyView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
