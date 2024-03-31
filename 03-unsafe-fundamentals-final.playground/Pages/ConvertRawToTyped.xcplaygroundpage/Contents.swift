// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

let count = 2
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let byteCount = stride * count

// Converting raw pointers to typed pointers

let rawPointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
defer {
  rawPointer.deallocate()
}

let typePointer = rawPointer.bindMemory(to: Int.self, capacity: count)
typePointer.initialize(repeating: 0, count: count)
defer {
	typePointer.deinitialize(count: count)
}

typePointer.pointee = 0b111111111111
typePointer.advanced(by: 1).pointee = 6

typePointer.pointee
typePointer.advanced(by: 1).pointee

//let typedPointer = rawPointer.bindMemory(to: Int.self, capacity: count)
//typedPointer.initialize(repeating: 0, count: count)
//defer {
//  typedPointer.deinitialize(count: count)
//}
//
//typedPointer.pointee = 0b111111111111
//typedPointer.advanced(by: 1).pointee = 6
//typedPointer.pointee
//typedPointer.advanced(by: 1).pointee
//
//let bufferPointer = UnsafeBufferPointer(start: typedPointer, count: count)
//for (offset, value) in bufferPointer.enumerated() {
//  print("value \(offset): \(value)")
//}
