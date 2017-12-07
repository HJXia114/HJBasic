// Copyright (c) 2016 rickytan <ricky.tan.xin@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <UIKit/UIKit.h>

@interface HJContainerController : UIViewController
//传入的vc
@property (nonatomic, readonly, strong) __kindof UIViewController *contentViewController;
@end


/**
 *  @class HJContainerNavigationController
 *  @brief This Controller will forward all @a Navigation actions to its containing navigation controller, i.e. @b HJRootNavigationController.
 *  If you are using UITabBarController in your project, it's recommand to wrap it in @b HJRootNavigationController as follows:
 *  @code
tabController.viewControllers = @[[[HJContainerNavigationController alloc] initWithRootViewController:vc1],
                                  [[HJContainerNavigationController alloc] initWithRootViewController:vc2],
                                  [[HJContainerNavigationController alloc] initWithRootViewController:vc3],
                                  [[HJContainerNavigationController alloc] initWithRootViewController:vc4]];
self.window.rootViewController = [[HJRootNavigationController alloc] initWithRootViewControllerNoWrapping:tabController];
 *  @endcode
 */
@interface HJContainerNavigationController : UINavigationController
@end



/*!
 *  @class HJRootNavigationController
 *  @superclass UINavigationController
 *  @coclass HJContainerController
 *  @coclass HJContainerNavigationController
 */
IB_DESIGNABLE
@interface HJRootNavigationController : UINavigationController

/*!
 使用系统原始返回样式或自定义返回样式需要实现以下方法  -(UIBarButtonItem*)customBackItemWithTarget:action: ,默认为NO
 *  @brief use system original back bar item or custom back bar item returned by
 *  @c -(UIBarButtonItem*)customBackItemWithTarget:action: , default is NO
 *  @warning Set this to @b YES will @b INCREASE memory usage!
 */
@property (nonatomic, assign) IBInspectable BOOL useSystemBackBarButtonItem;

/// Whether each individual navigation bar uses the visual style of root navigation bar. Default is @b NO
@property (nonatomic, assign) IBInspectable BOOL transferNavigationBarAttributes;

/*!
 *  @brief use this property instead of @c visibleViewController to get the current visiable content view controller
 使用这个属性获取当前可见的visibleViewController
 */
@property (nonatomic, readonly, strong) UIViewController *hj_visibleViewController;

/*!
 *  @brief use this property instead of @c topViewController to get the content view controller on the stack top
 使用这个属性获栈顶topViewController
 */
@property (nonatomic, readonly, strong) UIViewController *hj_topViewController;

/*!
 *  @brief use this property to get all the content view controllers;
 使用这个属性获取所有的controllers
 */
@property (nonatomic, readonly, strong) NSArray <__kindof UIViewController *> *hj_viewControllers;

/**
 初始化根控制器没有navigation controller
 *  Init with a root view controller without wrapping into a navigation controller
 *
 *  @param rootViewController The root view controller
 *
 *  @return new instance
 */
- (instancetype)initWithRootViewControllerNoWrapping:(UIViewController *)rootViewController;

/*!
 从栈中移除一个控制器
 *  @brief Remove a content view controller from the stack
 *
 *  @param controller the content view controller
 */
- (void)removeViewController:(UIViewController *)controller NS_REQUIRES_SUPER;
- (void)removeViewController:(UIViewController *)controller animated:(BOOL)flag NS_REQUIRES_SUPER;

/*!
 *  @brief Push a view controller and do sth. when animation is done
 *
 *  @param viewController new view controller
 *  @param animated       use animation or not
 *  @param block          animation complete callback block
 */
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                  complete:(void(^)(BOOL finished))block;

/*!
 *  @brief Pop current view controller on top with a complete handler
 *
 *  @param animated       use animation or not
 *  @param block          complete handler
 *
 *  @return The current UIViewControllers(content controller) poped from the stack
 */
- (UIViewController *)popViewControllerAnimated:(BOOL)animated complete:(void(^)(BOOL finished))block;

/*!
 *  @brief Pop to a specific view controller with a complete handler
 *
 *  @param viewController The view controller to pop  to
 *  @param animated       use animation or not
 *  @param block          complete handler
 *
 *  @return A array of UIViewControllers(content controller) poped from the stack
 */
- (NSArray <__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController
                                                      animated:(BOOL)animated
                                                      complete:(void(^)(BOOL finished))block;

/*!
 *  @brief Pop to root view controller with a complete handler
 *
 *  @param animated use animation or not
 *  @param block    complete handler
 *
 *  @return A array of UIViewControllers(content controller) poped from the stack
 */
- (NSArray <__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
                                                                  complete:(void(^)(BOOL finished))block;
@end