# TestFrameworkIntegration
Showcases limitations of embedding ObjC code in Swift frameworks

TestFrameworkIntegration workspace contains three projects:

## TestObjCLibrary
Builds a sample static ObjC library and copies resulting .a file as well as .h file to TestSwiftFramework source directory.

## TestSwiftFramework
Builds a sample Swift framework that attempts to privately import TestObjCLibrary.a. As part of the build process,
the resulting framework is copied to TestSwiftFrameworkHarness source directory.

## TestSwiftFrameworkHarness
Builds a sample app that imports TestSwiftFramework.framework. The app must not have visibility into TestObjCLibrary.

# The Problem
__See "master" for details__

Contrary to what would seem like an obvious outcome, TestSwiftFrameworkHarness app has full visibility into TestObjCLibrary. There is no
straightforward way to make TestObjCLibrary interfaces private. This problem has been observed and documented by a large number
of users. Here are a couple of posts that I used the most in my research:

<http://blog.girappe.com/?good-bad-ugly>

<https://medium.com/@yuliiasynytsia/link-static-c-library-to-swift-framework-as-a-private-module-97eae2fec75e>

Unfortunately, the former solution would work in theory, but would not be practical in reality. I tried to implement the latter,
but could not get it to work.

After banging my head against the wall for a few days, I filed a tech support issue with Apple and, somewhat unexpectedly, Apple
confirmed this to be a problem and suggested that I submit a bug report. I did and they came back to me with this workaround:

```

Apple
Feb 17, 2020 at 7:41 PM
You can use an @_implementationOnly import when importing your Objective-C framework from your Swift framework. However,
this feature is undocumented and not officially supported and is subject to change in future compiler releases.
```
I never got to try this workaround though, because in the interim I actually got this problem solved in a suprisingly easy way.

# The Solution
__See "master_PreprocessorMacroSolution" branch for details.__

I was able to resolve my predicament with a few simple steps. I added a preprocessor macro in both TestObjCLibrary and
TestSwiftFramework.framework, but not in TestSwiftFrameworkHarness. I also added conditional compillation directives
in TestObjCLibrary around definitions that I wanted to remain invisible to the test app. 

As both the ObjC library and the framework are built internally by me, I have full control over this type of configuration changes.
The test app on the other hand, simulates a third party application and, therefore, does not have any knowledge if and what macros I used.

This effectively makes interfaces I want to hide remain hidden. Even though my test app can import TestObjCModule, internals of that
module cannot be observed or used.
