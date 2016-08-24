
# XKTabBar

自定义的TabBar可实现更多自己想实现的功能而不受系统自带TabBar的约束。
主流效果就两种，一种是普通TabBar一种是带特殊发布按钮的TabBar “微博”“微信”APP就是两种不同但是很流行的TabBar
  
  typedef enum 
  {
  
    SpecialTabBarButton = 100, // 带中间发布按钮
    NormalTabBarButton,        // 普通tabBar
    
  } TabBarButtonType; // tabBar类型
  
  1.类似微信的TabBar
    
    self.customTabBar.tabBarButtonType = NormalTabBarButton;
    
  2.类似微博带发布按钮的TabBar
    
    self.customTabBar.tabBarButtonType = SpecialTabBarButton;

  具体简单实用的方法demo里都有


![putong](http://a2.qpic.cn/psb?/V13xP0Fc3bLGEW/QmJC09AGdN4y8v9dLKZ0*mMjli261us3n2WQh7r4gd0!/b/dG8BAAAAAAAA&bo=eQGnAAAAAAADB*0!&rf=viewer_4)


![teshu](http://a1.qpic.cn/psb?/V13xP0Fc3bLGEW/nV7r8VQzMYhhdALOL4nhtDkJKcm6E*qN24vKBA3kSlA!/b/dAsBAAAAAAAA&bo=dgGpAAAAAAADAPs!&rf=viewer_4)


![lingyige](http://a2.qpic.cn/psb?/V13xP0Fc3bLGEW/NiS91S1MC3qvhyDtJg2VpMkrpyr74FUpLxuW8N.nApA!/b/dI0BAAAAAAAA&bo=uQCMAAAAAAADABA!&rf=viewer_4)
