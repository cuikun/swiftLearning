//
//  main.swift
//  conditionalCompilationBlock
//
//  Created by CKK on 2018/7/9.
//  Copyright © 2018年 CKK. All rights reserved.
//

import Foundation



#if swift(>=3.0)
print("hahaah")
#endif

#if os(iOS) || os(macOS)
print("Hello, World!")
#endif

#if arch(i386) || arch(x86_64)
print("x86_64")
#endif

#if canImport(Foundation)
print("can import Foundation")
#endif

#if targetEnvironment(simulator)
print("simulator")
#endif
