
### Masonry

[Masonry](https://github.com/SnapKit/Masonry)是一个轻量级的布局框架 拥有自己的描述语法 采用更优雅的链式语法封装NSAutoLayout, 简洁明了并具有高可读性 而且同时支持 iOS 和 Max OS X。使用Masonry能够使用简单的语法进行Autolayout布局


<br>Masonry常用属性与NSLayoutAttrubute的对照表如下<br>

|   Masonry                       |    NSAutoLayout                         |   说明            |
|  : ----------:                     |    :---------------------:                 |    : -------:      |
|   view.mas_left                |    NSLayoutAttributeLeft            |   左侧            |
|   view.mas_top                |    NSLayoutAttributeTop            |   上侧            |
|   view.mas_right              |    NSLayoutAttributeRight          |   右侧            |
|   view.mas_bottom          |     NSLayoutAttributeBottom      |   下侧            |
|   view.mas_leading          |     NSLayoutAttributeLeading     |   首部            |
|   view.mas_trailing           |     NSLayoutAttributeTrailing       |   尾部            |
|   view.mas_width             |     NSLayoutAttributeWidth         |   宽               |
|   view.mas_height            |     NSLayoutAttributeHeight        |   高               |
|   view.mas_centerX          |     NSLayoutAttributeCenterX     |   横向中点    |
|   view.mas_centerY          |     NSLayoutAttributeCenterY     |   纵向中点    |
|   view.mas_baseline         |     NSLayoutAttributeBaseline     |  文本基线     |

### 使用Masonry进行Autolayout布局

#### Masonry三种Autolayout Compare类型
*   `.equalTo` 相当于`NSLayoutRelationEqual`,为相等
*  `.lessThanOr`EqualTo相当于 `NSLayoutRelationLessThanOrEqual`,为小于或者等于
*  `.greaterThanOrEqualTo` 相当于 `NSLayoutRelationGreaterThanOrEqual`,为大于或等于

`
    // 使用UIView/NSView进行比较
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            //these two constraints are exactly the same
            make.left.greaterThanOrEqualTo(label.mas_left);
            make.left.right.equalTo(lable);
        }];
        ..
    //2. 直接使用NSNumber进行比较
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            //width >= 200 && width <= 400
            make.width.greaterThanOrEqualTo(@200);
            make.width.lessThanOrEqualTo(@400)
    }];
    ..
    //3. 使用CGFloat
    [subGreenView mas_makeConstraints:^(MASConstraintMaker *make) {
            //width >= 200 && width <= 400
            make.width.mas_lessThanOrEqualTo(200);
            make.width.mas_greaterThanOrEqualTo(400);
    }];
`

<br> **还可以与数组NSArray进行比较:**
`
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@[view1, view2]);
            make.left.equalTo(@[view1, @100, view3.right]);
    }];
`

<br>__两个同级的view进行约束__
`
    [subGreenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(subGreenView.mas_left).offset(10);
            make.right.equalTo(subGreenView.mas_right).offset(10);
    }];
`

**数组有多个不合理的值时,总是获取最小值来使用.相当于来取最小值.**


#### left, right, top, bottom, centerX, centerY, leading, trailing, width, height

<br> 可以通过`mas_makeConstraints`关联View的`left, right, top, bottom, centerX, centerY, leading, trailing, width, height`
进行布局。

1. 使用UIView/NSView进行布局

`
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(sv).with.offset(5); //with 不是必要的，只是方便理解
            make.left.equalTo(sv).with.offset(10);
            make.bottom.equalTo(sv).offset(15);
            make.right.equalTo(sv).offset(20);
    }];
`
或者

`
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(subRedView);
            make.left.equalTo(subRedView);
            make.width.equalTo(subRedView);
            make.height.equalTo(subRedView);
    }];
`


2. 直接使用NSNumber进行布局

`
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@18);
            make.left.equalTo(@16);
            make.width.equalTo(@16);
            make.height.equalTo(@16);
    }];
`

3. 直接使用CGFloat进行布局

`
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(18);
            make.centerY.mas_equalTo(16);
            make.width.mas_equalTo(16);
            make.height.mas_equalTo(16);
    }];
`



#### edges, size, center
*  make.edges   相当于同时设置  MASAttributeTop ，MASAttributeLeft  ， MASAttributeRight  ，  MASAttributeBottom
*  make.size   相当于同时设置 MASAttributeWidth ， MASAttributeHeight
*  make.center  相当于同时设置  MASAttributeCenterX，     MASAttributeCenterY

`
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 10, 15, 20));
            make.size.equalTo(superview).sizeOffset(CGSizeMake(100, 50));
            make.center.equalTo(superview).centerOffset(CGPointMake(-5, 10));
    }];
`

相当于
`
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            //.insets
            make.top.equalTo(sv).with.offset(5);
            make.left.equalTo(sv).with.offset(10);
            make.bottom.equalTo(sv).with.offset(-15);//使用offset,统一方向,所以这里是-15
            make.right.equalTo(sv).with.offset(-20);// 统一方向.
            //.size
            make.width.equalTo(sv).offset(100);
            make.height.equalTo(sv).offset(50);
            //.centerOfoffset
            make.centerX.equalTo(sv).offset(-5);
            make.centerY.equalTo(sv).offset(10);
    }];
`

####  Masonryz 设置优先级: 优先级有四种方式:
* .priority 来设定一个明确地优先级的值,是有参数的
* .priorityHigh 没有参数,使用默认的MASLayoutPriorityDefaultHigh值
* .priorityMedium,使用默认的MASLayoutPriorityDefaultMedium值
* .priorityLow,使用默认的MASLayoutPriorityDefaultLow值.

<br>_与NSAutolayout类似，Masonry会优先实现优先级高的设定,发生冲突时,放弃优先级低的设定._


#### 持有并在其他时间进行自动布局的更新

<br>如果要定义需要进行自动布局更新的约束。比如通过这约束存在来进行动画效果状态更新，或者更新删除约束.

<br>Masonry中有三种方法来更新约束constraints.

1. `mas_updateConstraints`
<br>使用`mas_updateConstraints`可以用来更新视图的约束,而`mas_makeConstraints`只能用来创建约束.
<br>一般是先创建约束,然后在合适的地方使用`mas_updateConstraints`来更新视图约束.

`
    [self.likeNumberView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.locationView.mas_bottom)
        .offset(kTopOffsetOfLikeNumberView);
        make.height.mas_equalTo(kHeightOfLikeNumberView);
    }];
`

2. `mas_remakeConstraints`
<br> `mas_updateConstraints`只能用来更新约束,但是只能更新已有约束的值,不能删除已有约束.
<br> 而使用`mas_remakeConstraints`的使用方法与`mas_updateConstraints`相同,但是它在更新视图之前,会删除之前所有约束,然后再创建新的约束来更新视图.

`
    [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.buttonSize);
            if (topLeft) {
                make.top.and.left.offset(10);
            } else {
                make.bottom.and.right.offset(-10);
            }
    }];
`

3. `References`
<br>也可以通过持有一个  `MASConstraint`类型的约束保持在本地,然后通过`install `和`uninstall`方法来使用和删除该约束
<br>用起来比前两个复杂，但是灵活性很强，可以同时删除和更新约束。
`
@property (nonatomic, strong) MASConstraint *topConstraint;
..
[subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
_topConstraint = make.top.equalTo(superView.mas_top).with.offset(10);
//这里是保存了已经设定好的约束
make.left.equalTo(superView.mas_left).with.offset(10);
}];
..
//之后需要取消的时候
[_topConstraint uninstall];
..
//也可以安装
[_topConstraint install];
`

### ⚠️Masonry 布局注意事项
* `UILabel ` 不用设置高度和宽度,设置了高度，字符很容易被截断
* 只要设置必要的约束，如果设置了多余的约束，控制台会输出错误log，如

`
2018-03-28 17:50:55.761481+0800 OMI[7256:2846471] [LayoutConstraints] Unable to simultaneously satisfy constraints.
Probably at least one of the constraints in the following list is one you don't want.
Try this:
(1) look at each constraint and try to figure out which you don't expect;
(2) find the code that added the unwanted constraint or constraints and fix it.
(
"<MASLayoutConstraint:0x1c80bc0e0 OMISettingsGenderSelectView:0x11be22d30.width == UITableViewCellContentView:0x11be229d0.width>",
"<MASLayoutConstraint:0x1c00adec0 OMISelectionIndicator:0x11bd160d0.left == OMISingleSelectionView:0x11bd15ed0.left + 20>",
"<MASLayoutConstraint:0x1c00ae220 UILabel:0x11bd16a70.left == OMISelectionIndicator:0x11bd160d0.right + 14>",
"<MASLayoutConstraint:0x1c00ae280 UILabel:0x11bd16a70.right == OMISingleSelectionView:0x11bd15ed0.right + 10>",
"<MASLayoutConstraint:0x1c00af540 OMISingleSelectionView:0x11bd15ed0.width == OMISettingsGenderSelectView:0x11be22d30.width>",
"<NSLayoutConstraint:0x1c8284d80 UITableViewCellContentView:0x11be229d0.width == 0>"
)
`



> 资料
> [Auto Layout Guide](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/)
> [Masonry](https://github.com/SnapKit/Masonry)


