
# Table of Contents

- [AAFragmentManager](#section-id-5)
- [Description](#section-id-12)
- [Demonstration](#section-id-17)
- [Requirements](#section-id-27)
- [Installation](#section-id-33)
- [CocoaPods](#section-id-39)
- [Carthage](#section-id-65)
- [Manual Installation](#section-id-83)
- [Getting Started](#section-id-87)
- [Create your fragment manager](#section-id-90)
- [Setup your child views](#section-id-101)
- [Get any child views controller](#section-id-112)
- [Switching between child views](#section-id-123)
- [Contributions & License](#section-id-142)


<div id='section-id-5'/>

#AAFragmentManager

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AAFragmentManager.svg)](http://cocoadocs.org/docsets/AAFragmentManager) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AAFragmentManager.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AAFragmentManager) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AAFragmentManager.svg)]()



<div id='section-id-12'/>

##Description


AAFragmentManager is a child view manager responsible to add child subviews in UIView, designed for easy switching between child view controllers with animations.

<div id='section-id-17'/>

##Demonstration



![](https://github.com/EngrAhsanAli/AAFragmentManager/blob/master/Screenshots/demo.gif)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-27'/>

##Requirements

- iOS 8.0+
- Xcode 8.0+


<div id='section-id-33'/>

# Installation

`AAFragmentManager` can be installed using CocoaPods, Carthage, or manually.



<div id='section-id-39'/>

##CocoaPods

`AAFragmentManager` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AAFragmentManager'
end

```

Finally, run the following command to install it:
```
$ pod install
```



<div id='section-id-65'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AAFragmentManager" 
```

Then import the library in all files where you use it:
```ruby
import AAFragmentManager
```

<div id='section-id-83'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AAFragmentManager` into your project manually by adding the files contained in the Classes folder to your project.

<div id='section-id-87'/>

#Getting Started
----------

<div id='section-id-90'/>

##Create your fragment manager

Create a `UIView` and set the class as `AAFragmentManager`. Make an `IBOutlet` of that view. 

```ruby
@IBOutlet weak var childView: AAFragmentManager!
```

> You need to set all child views identifiers and make a `UIViewController` array to pass `AAFragmentManager`


<div id='section-id-101'/>

##Setup your child views

Now create child views (fragments) using single line

```ruby
childView.allowSameFragment = true
childView.setupFragments(arrayVC, defaultIndex: 0)
```

> Note that `defaultIndex` is for first initial child view that will be automatically added by the `AAFragmentManager`. `defaultIndex` is optional parameter.


<div id='section-id-112'/>

##Get any child views controller

You can get any child view controller by accessing it through index

```ruby
let demoFragment = childView.getFragment(0)
demoFragment.delegate = self // sets for some callback
```

> Note that `getFragment` method can return `nil` if any invalid index passed.

<div id='section-id-123'/>

##Switching between child views

You can switch child view controllers using the single line

```ruby
// replace fragment by index
childView.replaceFragment(index: 1)
// replace with next fragment
childView.previousFragment()
// replace with previous fragment
childView.nextFragment()
```

> Note that replaceFragment has optional parameters `shouldAnimate` , `shouldFit`.

Here's the method signature

```ruby
open func replaceFragment(index: Int, shouldAnimate animate: Bool = true, shouldFit fit: Bool = true)
```

> By default, `shouldFit` is true such that it will make fragment of same height as its parent view and vice versa. 


<div id='section-id-142'/>

#Contributions & License

`AAFragmentManager` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AAFragmentManager` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)

