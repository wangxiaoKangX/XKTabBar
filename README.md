
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

![image](http://b29.photo.store.qq.com/psu?/010d259a-214f-4fdd-9e3b-a51b0aac91fa/xSxxewtxa6bg5rM9F9lg4CTDB513WVsezVHInr91jzo!/b/YYUetBbMJgAAYlrlXBG4mAAA&a=38&b=29&bo=wAHPAQAAAAABBCw!&rf=viewer_4)
