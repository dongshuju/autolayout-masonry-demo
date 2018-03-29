
### Masonry

Masonry是一个轻量级的布局框架 拥有自己的描述语法 采用更优雅的链式语法封装自动布局 简洁明了 并具有高可读性 而且同时支持 iOS 和 Max OS X。使用Masonry能够使用简单的语法进行Autolayout布局

<br>Masonry常用属性与NSLayoutAttrubute的对照表如下
|   Masonry    |    NSAutoLayout                        |   说明            |
|   ----------    |    -------------------------             |     -------       |
|   view.mas_left             |    NSLayoutAttributeLeft            |   左侧            |
|   view.mas_top             |    NSLayoutAttributeTop            |   上侧            |
|   view.mas_right               |    NSLayoutAttributeRight          |   右侧            |
|   view.mas_bottom          |     NSLayoutAttributeBottom      |   下侧            |
|   view.mas_leading          |     NSLayoutAttributeLeading     |   首部            |
|   view.mas_trailing           |     NSLayoutAttributeTrailing       |   尾部            |
|   view.mas_width             |     NSLayoutAttributeWidth         |   宽               |
|   view.mas_height            |     NSLayoutAttributeHeight        |   高               |
|   view.mas_centerX          |     NSLayoutAttributeCenterX     |   横向中点    |
|   view.mas_centerY          |     NSLayoutAttributeCenterY     |   纵向中点    |
|   view.mas_baseline         |     NSLayoutAttributeBaseline     |  文本基线     |

#### Masonry三种Autolayout Compare类型
*   `.equalTo` 相当于`NSLayoutRelationEqual`,为相等
*  `.lessThanOr`EqualTo相当于 `NSLayoutRelationLessThanOrEqual`,为小于或者等于
*  `.greaterThanOrEqualTo` 相当于 `NSLayoutRelationGreaterThanOrEqual`,为大于或等于


### 使用Masonry进行Autolayout布局


### ⚠️Masonry 布局注意事项


