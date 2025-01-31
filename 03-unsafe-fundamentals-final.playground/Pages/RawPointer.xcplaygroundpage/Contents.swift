// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

// Allocate space for 2 Int not using size, but using stride is always correct
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let count = 2

let byteCount = stride * count
let pointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)

defer {
	pointer.deallocate()
}

pointer.storeBytes(of: 0b111111111111, as: Int.self)
pointer.advanced(by: stride).storeBytes(of: 6, as: Int.self)
(pointer+stride).storeBytes(of: 6, as: Int.self)

pointer.load(as: Int.self)
pointer.advanced(by: stride).load(as: Int.self)
(pointer+stride).load(as: Int.self)

let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
for (offset, byte) in bufferPointer.enumerated() {
	print("byte \(offset): \(byte)")
}



//let byteCount = stride * count
//let pointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
//defer {
//  pointer.deallocate()
//}
//
//pointer.storeBytes(of: 0b111111111111, as: Int.self)
//pointer.advanced(by: stride).storeBytes(of: 6, as: Int.self)
//(pointer+stride).storeBytes(of: 6, as: Int.self)
//
//pointer.load(as: Int.self)
//pointer.advanced(by: stride).load(as: Int.self)
//(pointer+stride).load(as: Int.self)
//
//let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
//for (offset, byte) in bufferPointer.enumerated() {
//  print("byte \(offset): \(byte)")
//}

