#  基于面向协议MVP模式下的软件开发－iOS篇

> * 传统模式下的开发
> * 基于面向协议MVP的介绍
> * MVP实战开发

## 传统开发模式
  ### MVC 
  
第一次听到MVC这个名词是在C#中，相信做对于MVC大家都已经很熟悉了，作为一种软件设计模式，MVC这个概念已经诞生好多年了，

模型-视图-控制器（Model-View-Controller，MVC）是Xerox PARC在20世纪80年代为编程语言Smalltalk－80发明的一种软件设计模式，至今已广泛应用于用户交互应用程序中。在iOS开发中MVC的机制被使用的淋漓尽致，充分理解iOS的MVC模式，有助于我们程序的组织合理性。

Model-View-Controller

模型对象

模型对象封装了应用程序的数据，并定义操控和处理该数据的逻辑和运算。例如，模型对象可能是表示游戏中的角色或地址簿中的联系人。用户在视图层中所进行的创建或修改数据的操作，通过控制器对象传达出去，最终会创建或更新模型对象。模型对象更改时（例如通过网络连接接收到新数据），它通知控制器对象，控制器对象更新相应的视图对象。

视图对象

视图对象是应用程序中用户可以看见的对象。视图对象知道如何将自己绘制出来，并可能对用户的操作作出响应。视图对象的主要目的，就是显示来自应用程序模型对象的数据，并使该数据可被编辑。尽管如此，在 MVC 应用程序中，视图对象通常与模型对象分离。

在iOS应用程序开发中，所有的控件、窗口等都继承自 UIView，对应MVC中的V。UIView及其子类主要负责UI的实现，而UIView所产生的事件都可以采用委托的方式，交给UIViewController实现。

控制器对象

在应用程序的一个或多个视图对象和一个或多个模型对象之间，控制器对象充当媒介。控制器对象因此是同步管道程序，通过它，视图对象了解模型对象的更改，反之亦然，控制器主要负责数据的传递解耦等工作。控制器对象还可以为应用程序执行设置和协调任务，并管理其他对象的生命周期。

控制器对象解释在视图对象中进行的用户操作，并将新的或更改过的数据传达给模型对象。模型对象更改时，一个控制器对象会将新的模型数据传达给视图对象，以便视图对象可以显示它。

Model和View永远不能相互通信，只能通过Controller传递。
Controller可以直接与Model对话（读写调用Model），Model通过Notification和KVO机制与Controller间接通信。
Controller可以直接与View对话，通过outlet,直接操作View,outlet直接对应到View中的控件,View通过action向Controller报告事件的发生(如用户Touch我了)。Controller是View的直接数据源（数据很可能是Controller从Model中取得并经过加工了）。Controller是View的代理（delegate),以同步View与Controller。

### MVVM

在经历了一大堆吐槽之后，诞生了MVVM(一个高大尚牛逼哄哄的名次，从此软件界又再次多了一种人，你懂MVVM ？如果你的回答是否，瞬间被鄙视一把)

//MVVM介绍

如果你已经开发一段时间的iOS应用，你一定听说过Model-View-Controller，即MVC。MVC是构建iOS App的标准模式。然而，最近我已经越来越厌倦MVC的一些缺点。在本文，我将重温一下MVC是什么，详述它的缺点，并且告诉你一个新的方式来架构你的App：Model-View-ViewModel。因为我们即将进行一次范式转变。
 
Model-View-Controller
Model-View-Controller是一个用来组织代码的权威范式。Apple甚至是这么说的。在MVC下，所有的对象被归类为一个model，一个view，或一个controller。Model持有数据，View显示与用户交互的界面，而View Controller调解Model和View之间的交互。

在上图中，view将用户交互通知给controller。view controller通过更新model来反应状态的改变。model（通常使用Key-Value-Observation）通知controller来更新他们负责的view。大多数iOS应用程序的代码使用这种方式来组织。
 
模型model的对象通常非常非常的简单。很多时候，他们就是Core Data managed objects，或者避免使用Core Data，就是其他流行的数据模型层。根据Apple的文档，model包括数据和操作数据的业务逻辑。在实践中，model层往往非常薄，不管怎样，model层的业务逻辑被拖入了controller。
 
视图view通常是UIKit控件（component，这里根据习惯译为控件）或者编码定义的UIKit控件的集合。进入.xib或者Storyboard会发现一个app、Button、Label都是由这些可视化的和可交互的控件组成。你懂的。View不应该直接引用model，并且仅仅通过IBAction事件引用controller。业务逻辑很明显不归入view，视图本身没有任何业务。
 
还有控制器controller。Controller是app的“胶水代码”：协调模型和视图之间的所有交互。控制器负责管理他们所拥有的视图的视图层次结构，还要响应视图的loading、appearing、disappearing等等，同时往往也会充满我们不愿暴露的model的模型逻辑以及不愿暴露给视图的业务逻辑。这引出了第一个关于MVC的问题...
 
厚重的View Controller
由于大量的代码被放进view controller，导致他们变的相当臃肿。在iOS中有的view controller里绵延成千上万行代码的事并不是前所未见的。这些超重app的突出情况包括：厚重的View Controller很难维护（由于其庞大的规模）；包含几十个属性，使他们的状态难以管理；遵循许多协议（protocol），导致协议的响应代码和controller的逻辑代码混淆在一起。
 
厚重的view controller很难测试，不管是手动测试或是使用单元测试，因为有太多可能的状态。将代码分解成更小的多个模块通常是件好事。
 
遗失的网络逻辑
苹果使用的MVC的定义是这么说的：所有的对象都可以被归类为一个model，一个view，或是一个controller。就这些。那么把网络代码放哪里？和一个API通信的代码应该放在哪儿？
 
你可能试着把它放在model对象里，但是也会很棘手，因为网络调用应该使用异步，这样如果一个网络请求比持有它的model生命周期更长，事情将变的复杂。显然也不应该把网络代码放在view里，因此只剩下controller了。这同样是个坏主意，因为这加剧了厚重View Controller的问题。
 
那么应该放在那里呢？显然MVC的3大组件根本没有适合放这些代码的地方。
 
较差的可测试性
MVC的另一个大问题是,它不鼓励开发人员编写单元测试。由于view controller混合了视图处理逻辑和业务逻辑，分离这些成分的单元测试成了一个艰巨的任务。大多数人选择忽略这个任务，那就是不做任何测试。
 
定义模糊的“Manage”
之前我提到了view controller可以管理试图的层次结构；view controller有一个“view”属性，并且可以通过IBOutlet访问视图的任何子视图。当有很多outlet时这样做不易于扩展，在某种意义上，最好不要使用子视图控制器（child view controller）来帮助管理子视图（subview）。
 
要点在哪？验证用户输入的业务逻辑应归入controller还是model呢？
 
在这里有多个模糊的标准，似乎没有人能完全达成一致。貌似无论如何，view和对应的controller都紧紧的耦合在一起，总之，还是会把它们当成一个组件来对待。
 
Hey！现在有个点子...
 
Model-View-ViewModel
在理想的世界里，MVC也许工作的很好。然而，我们生活在真实的世界。既然我们已经详细说明了MVC在典型场景中的问题，那让我们看一看一个可供替换的选择：Model-View-ViewModel。
 
MVVM来自微软，不过不要坚持反对它。MVVM和MVC很像。它正式规范了视图和控制器紧耦合的性质，并引入新的组件。

在MVVM里，view和view controller正式联系在一起，我们把它们视为一个组件。视图view仍然不能直接引用模型model，当然controller也不能。相反，他们引用视图模型view model。
 
view model是一个放置用户输入验证逻辑，视图显示逻辑，发起网络请求和其他各种各样的代码的极好的地方。有一件事情不应归入view model，那就是任何视图本身的引用。view model的概念同时适用于于iOS和OS X。（换句话说，不要在view model中使用 #import UIKit.h）
 
由于展示逻辑（presentation logic）放在了view model中（比如model的值映射到一个格式化的字符串），视图控制器本身就会不再臃肿。当你开始使用MVVM的最好方式是，可以先将一小部分逻辑放入视图模型，然后当你逐渐习惯于使用这个范式的时候再迁移更多的逻辑到视图模型中。
 
使用MVVM的iOS app是高度可测试的；因为view model包含了所有的展示逻辑并且不会引用view，所以它可以通过编程方式充分测试。虽然有众多的hack技术参与到测试Core Data模型，但使用MVVM写的app可以进行充分的单元测试。
 
以我的经验，使用MVVM会轻微的增加代码量，但总体上减少了代码的复杂性。这是一个划算的交易。
 
回过头再来看MVVM的图示，你会注意到我使用了模糊的动词“notify”和“update”，而没有详细说明该怎么做。你可以使用KVO，就像MVC那样，但这很快就会变得难以管理。事实上，使用ReactiveCocoa会是更好的方式来组织各个部分。
 
关于怎么结合ReactiveCocoa来使用MVVM的信息，可以阅读Colin Wheeler的excellent write-up或者看看我写的开源app。你也可以阅读我的关于ReactiveCocoa和MVVM的书。
  
## 基于面向协议MVP的介绍

上文提到了MVC、MVVM，真实的业务场景中，如果场景的逻辑异常复杂，在反复的迭代中仍会出现各式各样的问题。真对MVVM我个人理解主要是将原来Controller中处理数据逻辑的代码统一归到一个新的class(viewModel)中去，更甚之网络请求等工作全部从Controller移到viewModel。刚一开始总觉的怪怪的。现阶段客户端开发越来越进入一个2.0的阶段，早期的app功能都相对比较简单，无论是从界面还是从业务逻辑上给人的感觉都是简洁实用，这中间包括UI的设计、功能的设计、产品的设计定位等。随着行业的深入，用户的过渡依赖移动端最终导致业各式各样的业务更加依赖客户端，这就导致客户端的开发不得不向PC端靠齐，在版本的反复迭代中业务场景变的愈发不尽人意，仿佛又回到了软件设计的早期。

<<<<<<< HEAD
在传统软件领域，从MVC的诞生主要是为了解决软件界面的行为的分离，在复杂的业务场景内会进一步区分业务逻辑场景的分离，这些手段的最终的目的都是尽最大限度的降低整个场景的藕合度，使其达到分离的目的，模块与模块最终得到独立，将整个场景化整为零，最终使每个模块在一个零上工作，这对于无论是软件的开发还是后续的维护、以及使用普遍遵循这个原则，现有的模式大概产生了相关的类似架构。
=======


客户端通过service拿到json 数据，然后通过MVC的结构展示到UI界面上
在iOS中一直流行MVC的开发模式，通过与传统开发模式对比可以发现，其实
service层与客户端无非是两个互逆的过程，service层根据具体的业务场
景提供对应的数据服务，service根据不同的业务场景通过DTO层拿到对应
的数据然后组织好数据提供给外界(service 层负责将原始物理数据转换成
对应的逻辑数据提供给外界)。

相反。客户端通过网络层拿到对应的网络数据绘制到对应的View上，但是实际的
开发过程中，网络数据与真实客户端使用场景也是有一定的差距，MVVM层将对应的
一部分逻辑处理移植到了ViewModel中，这并没有从根本上解决问题，无非是将代码做了一份对应的
copy转移，并没有从根本上达到逻辑分层的概念。相反MVP模式恰好解决了这一难题，MVP模式衍生于传统service架构，
针对不同的业务场景图供对应的匹配的抽象service服务，客户端拿到网络数据后未达到指定的目的，为满足相同抽象逻辑的
业务场景，在客户端网络层与model层之间加一协议层，model层实现整个协议层，之后在基于MVC的结构下将一概相同层次的
业务场景绘制解释到对应的View上。

M : 逻辑model
V : 视图
P : protocol协议层

Model层类似于MVVM的ViewModel，主要负责存储抽象逻辑数据，另外Model层主还有部分工作实现对应的协议层协议，提供
协议对应的各种属性以及服务。


## MVP实战开发
>>>>>>> origin/dev

传统web架构里面是这样解决的 : 

web段以及其他业务层负责从接口层获取数据，并执行自己的逻辑
service层为外部提供接口
DTO从负责从DB链接并进行数据读写操作
DB层(物理机器负责数据存储)

曾降有无数个人总喜欢问我你们的iOS采用什么样的架构，其实每次被问到这样的问题，不是瞬间被萌了，就是想自己问自己iOS也有架构？？

现有客户度一度采用下面的模式:







## MVP实战开发



MVVM (https://leanpub.com/iosfrp)



http://blog.csdn.net/sqc3375177/article/details/11771823
http://liuzhichao.com/p/1379.html

http://www.cocoachina.com/ios/20140716/9152.html
http://www.cocoachina.com/ios/20150122/10987.html
http://www.cnblogs.com/xueduanyang/p/3601471.html

[Model-View-Controller](http://developer.apple.com/library/ios/documentation/general/conceptual/CocoaEncyclopedia/Model-View-Controller/Model-View-Controller.html#//apple_ref/doc/uid/TP40010810-CH14-SW1)