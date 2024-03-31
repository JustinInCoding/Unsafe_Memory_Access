// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

let count = 2

let pointer = UnsafeMutablePointer<Int>.allocate(capacity: count)
pointer.initialize(repeating: 0, count: count)

defer {
	pointer.deinitialize(count: count)
	pointer.deallocate()
}

pointer.pointee = 0b111111111111
pointer.advanced(by: 1).pointee = 6
(pointer+1).pointee = 6

pointer.pointee
pointer.advanced(by: 1).pointee
(pointer+1).pointee

let bufferPointer = UnsafeBufferPointer(start: pointer, count: count)
for (offset, value) in bufferPointer.enumerated() {
	print("value \(offset): \(value) ")
}

//let pointer = UnsafeMutablePointer<Int>.allocate(capacity: count)
//pointer.initialize(repeating: 0, count: count)
//defer {
//  pointer.deinitialize(count: count)
//  pointer.deallocate()
//}
//
//pointer.pointee = 0b111111111111
//pointer.advanced(by: 1).pointee = 6
//(pointer+1).pointee = 6
//
//pointer.pointee
//pointer.advanced(by: 1).pointee
//(pointer+1).pointee
//
//let bufferPointer = UnsafeBufferPointer(start: pointer, count: count)
//for (offset, value) in bufferPointer.enumerated() {
//  print("value \(offset): \(value)")
//}
