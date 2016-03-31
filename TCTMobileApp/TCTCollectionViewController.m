//
//  TCTCollectionViewController.m
//  TCTMobileApp
//
//  Created by TCT on 16/3/30.
//  Copyright © 2016年 TCT. All rights reserved.
//

#import "TCTCollectionViewController.h"
#import "TCTCollectionViewCell.h"
#import "TCTCollectionViewHeaderView.h"
#import "UIDevice+Extension.h"

@interface TCTCollectionViewController () <UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) CGFloat cellSize;
@property (nonatomic, strong) NSArray *appInfo;
@end

@implementation TCTCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [self p_setCellSize];
    [super viewDidLoad];
    
    // 注册cell的时候要注意类型TCTCollectionViewCell
    [self.collectionView registerClass:[TCTCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TCTCollectionViewHeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TCTCollectionViewHeaderView"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.appInfo.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.appInfo[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TCTCollectionViewCell *cell = (TCTCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.layer.cornerRadius = 4;
    cell.layer.masksToBounds = YES;
    NSArray *app = self.appInfo[indexPath.section];
    [cell collectionViewCellImage:app[indexPath.row][@"appIcon"] title:app[indexPath.row][@"appName"]];

    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%lu-%lu", indexPath.section, indexPath.row);
    NSArray *app = self.appInfo[indexPath.section];
    NSString *schemes = app[indexPath.row][@"schemes"];
    
    // 检测是否安装App
    NSURL *url = [NSURL URLWithString:schemes];
    if ([[UIApplication sharedApplication] canOpenURL:url]) { // 已安装
        [[UIApplication sharedApplication] openURL:url];
    } else { // 从网络安装
        
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - UICollectionViewDelegateFlowLayout
/**
 *  设置每个UICollectionView的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(_cellSize, _cellSize);
}

/**
 *  HeaderView的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
   
    return CGSizeMake(self.view.frame.size.width, 40);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 设置每个cell上下左右相距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 20, 20, 20);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    TCTCollectionViewHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TCTCollectionViewHeaderView" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        headerView.headerTitle.text = @"iPhone";
    } else if (indexPath.section == 1) {
        headerView.headerTitle.text = @"iPad";
    }
    
    return headerView;
}

- (void)p_setCellSize {
    if ([UIDevice isIPhone4s] || [UIDevice isIPhone5] || [UIDevice isIPhone5s]) {
        _cellSize = 80;
    } else {
        _cellSize = 100;
    }
}

- (NSArray *)appInfo {
    if (_appInfo == nil) {
        _appInfo = @[@[@{@"appName":@"QRCode", @"appIcon":@"QRCode.png", @"schemes":@"QRCode://"}], @[@{@"appName":@"移动测试平台", @"appIcon":@"jkkj.png", @"schemes":@"JKKJ://com.tct.jkkj"}]];
    }
    
    return _appInfo;
}
@end
