#YSEmptyDataDemo

###效果
![](http://oo6ubxy3u.bkt.clouddn.com/YSEmptyDataView.png)

###Description
项目中用到的无数据、无网络情况展示页面， 自己写了一个， 以后备用。



###可定制属性(Property)
```
/// 图片
@property (nonatomic, strong) UIImage *emptyViewImage;
```
```
/// 标题
@property (nonatomic, strong) NSString *emptyViewTitle;
```
```
/// 描述
@property (nonatomic, strong) NSString *emptyViewDes;
```
```
/// 标题Font
@property (nonatomic, strong) UIFont *emptyTitleFont;
```
```
/// 描述Font
@property (nonatomic, strong) UIFont *emptyDesFont;
```
```
/// 背景色
@property (nonatomic, strong) UIColor *emptyViewBackgroundColor;
```
```
/// 标题颜色
@property (nonatomic, strong) UIColor *emptyTitleColor;
```
```
/// 描述颜色
@property (nonatomic, strong) UIColor *emptyDesColor;
```
```
/// Scroller是否可以滚动 默认不能
@property (nonatomic, assign) BOOL isCanScroll;
```


### 使用方法(Usage)
```
#import "UIView+YSEmptyData.h"
```

```
    self.tableView.emptyTitleFont = [UIFont systemFontOfSize:18];
    self.tableView.emptyDesFont = [UIFont systemFontOfSize:12];
    self.tableView.emptyDesColor = [UIColor redColor];
    self.tableView.emptyViewDes = @"我是空列表 没有值";
    [self.tableView showEmptyView];
```

#### 点击事项可以使用一下两种方式

* 点击事项(TapBlock)
	```
	self.tableView.emptyViewTap = ^{
	        [self.tableView hideEmptyView];
	    };
	```

* 委托(Delegate)
	```
	self.tableView.emptyDelegate = self;
	```

	```
	- (void)ys_emptyDataTapView:(UIView *)view{
  	  [self.tableView hideEmptyView];
	}
	```




