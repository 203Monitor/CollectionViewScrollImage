//
//  ViewController.m
//  ScrollImage
//
//  Created by 武国斌 on 2017/5/19.
//  Copyright © 2017年 武国斌. All rights reserved.
//

//#import "ViewController.h"
//#import "ImageCell.h"
//
//#define kWidth ([UIScreen mainScreen].bounds.size.width)
//#define kHeight ([UIScreen mainScreen].bounds.size.height)
//
//@interface ViewController () <UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
//
//@property (nonatomic, strong) NSMutableArray *datas;
//@property (nonatomic, strong) UICollectionView *scrollImage;
//@property (nonatomic, strong) UIPageControl *pageControl;
//@property (nonatomic, assign) BOOL doScroll;
//@property (nonatomic, assign) BOOL autoDo;
//@property (nonatomic, assign) NSInteger scrollTo;
//
//@property (nonatomic, strong) NSTimer *timer;
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    NSArray *array = @[@"1.png",@"2.png",@"3.png",@"4.png",@"5.png"];
//    self.datas = [self datasFromArray:array];
//    
//    self.scrollTo = 0;
//    self.doScroll = NO;
//    [self.scrollImage reloadData];
//    [self pageControl];
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
//    [self.scrollImage scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//    
//    [self.timer invalidate];
//    self.timer = nil;
//    [self timer];
//}
//
//- (NSMutableArray *)datasFromArray:(NSArray *)origin {
//    NSMutableArray *datas = [NSMutableArray arrayWithArray:origin];
//    [datas insertObject:[origin lastObject] atIndex:0];
//    [datas addObject:[origin firstObject]];
//    return datas;
//}
//
//- (NSTimer *)timer {
//    if (!_timer) {
//        _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(startScrollAutomtically) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
//    }
//    return _timer;
//}
//
//- (void)startScrollAutomtically {
//    NSInteger scrollTo = self.scrollTo;
//    if (scrollTo == self.datas.count - 1) {
//        scrollTo = 1;
//    }
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:scrollTo + 1 inSection:0];
//    [self.scrollImage scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//}
//
//- (UIPageControl *)pageControl {
//    if (!_pageControl) {
//        _pageControl = [[UIPageControl alloc] init];
//        _pageControl.frame = CGRectMake(0, 0, kWidth * 0.8, 20);//指定位置大小
//        _pageControl.center = CGPointMake(self.scrollImage.center.x, kHeight * 0.6);
//        _pageControl.numberOfPages = self.datas.count - 2;//指定页面个数
//        _pageControl.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
//        //添加委托方法，当点击小白点就执行此方法
//        
//        _pageControl.pageIndicatorTintColor = [UIColor groupTableViewBackgroundColor];// 设置非选中页的圆点颜色
//        _pageControl.currentPageIndicatorTintColor = [UIColor cyanColor]; // 设置选中页的圆点颜色
//        [self.view addSubview:_pageControl];
//    }
//    return _pageControl;
//}
//
//- (UICollectionView *)scrollImage {
//    if (!_scrollImage) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        [layout setItemSize:CGSizeMake(kWidth * 0.8, kHeight * 0.6)];
//        [layout setMinimumLineSpacing:0];
//        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//        
//        _scrollImage = [[UICollectionView alloc] initWithFrame:CGRectMake(kWidth * 0.1, 20, kWidth * 0.8, kHeight * 0.6) collectionViewLayout:layout];
//        [_scrollImage setDelegate:self];
//        [_scrollImage setDataSource:self];
//        
//        [_scrollImage setPagingEnabled:YES];
//        [_scrollImage setBounces:NO];
//        [_scrollImage setShowsHorizontalScrollIndicator:NO];
//        
//        [_scrollImage registerClass:[ImageCell class] forCellWithReuseIdentifier:[ImageCell description]];
//        
//        [self.view addSubview:_scrollImage];
//    }
//    return _scrollImage;
//}
//
//#pragma mark - Delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    if (self.autoDo) {
//        self.autoDo = NO;
//        return;
//    }
//    
//    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
////    page范围 0~5                    0         1   2   3   4   5  ...  count - 1
////    实际pageControl范围 0~3        count - 3   0   1   2   3   4  ...     0
//    
//    NSInteger beforeGetLast = page;
//    self.scrollTo = beforeGetLast;
//    
//    if (page == 0) {
//        page = self.datas.count - 3;
//    }else if (page == self.datas.count - 1){
//        page = 0;
//    }else {
//        page -= 1;
//    }
//    self.pageControl.currentPage = page;
//    
//    if (page == self.datas.count - 3 && beforeGetLast == 0) {
//        self.doScroll = YES;
//    }else if (page == 0 && beforeGetLast == self.datas.count - 1) {
//        self.doScroll = YES;
//    }else {
//        self.doScroll = NO;
//    }
//}
//
//#pragma mark - 自动滚动最后调用代理方法
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    if (self.doScroll) {
//        self.autoDo = YES;
//        NSIndexPath *indexPath = nil;
//        if (self.pageControl.currentPage == self.datas.count - 3) {
//            indexPath = [NSIndexPath indexPathForItem:self.datas.count - 2 inSection:0];
//        }else if (self.pageControl.currentPage == 0) {
//            indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
//        }
//        [self.scrollImage scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//    }
//    self.doScroll = NO;
//}
//
//#pragma mark - 手动滚动最后调用代理方法
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  {
//    if (self.doScroll) {
//        self.autoDo = YES;
//        NSIndexPath *indexPath = nil;
//        if (self.pageControl.currentPage == self.datas.count - 3) {
//            indexPath = [NSIndexPath indexPathForItem:self.datas.count - 2 inSection:0];
//        }else if (self.pageControl.currentPage == 0) {
//            indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
//        }
//        [self.scrollImage scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//    }
//    self.doScroll = NO;
//}
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.datas.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ImageCell description] forIndexPath:indexPath];
//    
//    NSInteger index = indexPath.item;
//    if (index == 0) {
//        index = self.datas.count - 2;
//    }else if (index == self.datas.count - 1) {
//        index = 1;
//    }
//    NSString *imageName = [NSString stringWithFormat:@"%ld.png",index];
//    [cell.imageView setImage:[UIImage imageNamed:imageName]];
//    
//    return cell;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//@end


#import "ViewController.h"
#import "YuriScrollImage.h"
#import "Util.h"

#define kWidth ([UIScreen mainScreen].bounds.size.width)
#define kHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    UIColor * mycolor = CorlorWithString(@"#54e1b7");
    
    
    YuriScrollImage *scroll = [[YuriScrollImage alloc] initWithFrame:CGRectMake(0, 20, kWidth, kHeight * 0.4)];
    [scroll setImages:@[@"pp1.png",@"pp2.png",@"pp3.png",@"pp4.png",@"pp5.png"]];
//    [scroll setImages:@[@"num.jpeg",@"num.jpeg"]];
    [scroll setTimeInterval:2];
    [self.view addSubview:scroll];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
