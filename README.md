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
