// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

MemoryLayout<Int>.size          // returns 8 (on 64-bit)
MemoryLayout<Int>.alignment     // returns 8 (on 64-bit)
MemoryLayout<Int>.stride        // returns 8 (on 64-bit)

MemoryLayout<Int16>.size        // returns 2
MemoryLayout<Int16>.alignment   // returns 2 can only fall on even(偶数) 地址
MemoryLayout<Int16>.stride      // returns 2

MemoryLayout<Bool>.size         // returns 1
MemoryLayout<Bool>.alignment    // returns 1
MemoryLayout<Bool>.stride       // returns 1

MemoryLayout<Float>.size        // returns 4
MemoryLayout<Float>.alignment   // returns 4
MemoryLayout<Float>.stride      // returns 4

MemoryLayout<Double>.size       // returns 8
MemoryLayout<Double>.alignment  // returns 8
MemoryLayout<Double>.stride     // returns 8

let zero = 0.0
MemoryLayout.size(ofValue: zero)

struct Empty {}
MemoryLayout<Empty>.size // 0
// This is because elements in an array must be addressable even if they have zero size
// So in this context, they actually must take up some space
// It make sense if that minimum is one.
// The alignment requirement is the most least it can be t one
MemoryLayout<Empty>.alignment // 1
MemoryLayout<Empty>.stride // 1

struct SampleStruct {
	var number: UInt32
	var flag: Bool {
		didSet {
			print("Wow")
		}
	}
}

MemoryLayout<SampleStruct>.size // 5
MemoryLayout<SampleStruct>.alignment // 4 字节对齐
MemoryLayout<SampleStruct>.stride // 8
// The Bool is four bytes in from the start of the structure
MemoryLayout.offset(of: \SampleStruct.flag) // 4 // 可能返回 nil 加了 didSet 但并不赋值的话



// class is a reference

class EmptyClass {}
MemoryLayout<EmptyClass>.size // 8
MemoryLayout<EmptyClass>.alignment // 8
MemoryLayout<EmptyClass>.stride // 8

class SampleClass {
	let number: Int64 = 0
	let flag: Bool = false
}

MemoryLayout<SampleClass>.size // 8
MemoryLayout<SampleClass>.alignment // 8
MemoryLayout<SampleClass>.stride // 8
// can not do this cause class are nontrivial types
MemoryLayout.offset(of: \SampleClass.flag)











//let zero = 0.0
//MemoryLayout.size(ofValue: zero)
//
//struct EmptyStruct {}
//
//MemoryLayout<EmptyStruct>.size      // returns 0
//MemoryLayout<EmptyStruct>.alignment // returns 1
//MemoryLayout<EmptyStruct>.stride    // returns 1
//
//
//struct SampleStruct {
//  var number: UInt32
//  var flag: Bool {
//    didSet {
//      print("wow")
//    }
//  }
//}
//
//MemoryLayout<SampleStruct>.size       // returns 5
//MemoryLayout<SampleStruct>.alignment  // returns 4
//MemoryLayout<SampleStruct>.stride     // returns 8
//MemoryLayout.offset(of: \SampleStruct.flag)
//
//
//class EmptyClass {}
//
//MemoryLayout<EmptyClass>.size      // returns 8 (on 64-bit)
//MemoryLayout<EmptyClass>.stride    // returns 8 (on 64-bit)
//MemoryLayout<EmptyClass>.alignment // returns 8 (on 64-bit)
//
//class SampleClass {
//  let number: Int64 = 0
//  let flag: Bool = false
//}
//
//MemoryLayout<SampleClass>.size      // returns 8 (on 64-bit)
//MemoryLayout<SampleClass>.stride    // returns 8 (on 64-bit)
//MemoryLayout<SampleClass>.alignment // returns 8 (on 64-bit)
//MemoryLayout.offset(of: \SampleClass.flag)


