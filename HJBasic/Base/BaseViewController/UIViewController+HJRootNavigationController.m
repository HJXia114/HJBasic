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

#import <objc/runtime.h>

#import "UIViewController+HJRootNavigationController.h"
#import "HJRootNavigationController.h"

@implementation UIViewController (HJRootNavigationController)
@dynamic hj_disableInteractivePop;

- (void)setHj_disableInteractivePop:(BOOL)hj_disableInteractivePop
{
    objc_setAssociatedObject(self, @selector(hj_disableInteractivePop), @(hj_disableInteractivePop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hj_disableInteractivePop
{
    return [objc_getAssociatedObject(self, @selector(hj_disableInteractivePop)) boolValue];
}

- (Class)hj_navigationBarClass
{
    return nil;
}

- (HJRootNavigationController *)hj_navigationController
{
    UIViewController *vc = self;
    while (vc && ![vc isKindOfClass:[HJRootNavigationController class]]) {
        vc = vc.navigationController;
    }
    return (HJRootNavigationController *)vc;
}

- (UIBarButtonItem *)hj_customBackItemWithTarget:(id)target
                                       action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:@""
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}
@end
