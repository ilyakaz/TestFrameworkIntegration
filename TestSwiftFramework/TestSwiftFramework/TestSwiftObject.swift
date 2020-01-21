//
//  TestSwiftObject.swift
//  TestSwiftFramework
//
//

import Foundation
import TestObjCModule

public struct TestSwiftObject {
	public init() {}
	
	public func printPrivateMessage() {
		TestObjCClass().printTestMessage()
	}

	public func printMessage() {
		print("This is a public test message from Swift code")
	}
}
