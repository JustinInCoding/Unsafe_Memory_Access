// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

struct SampleStruct {
  let number: UInt32
  let flag: Bool
}

// Getting the bytes of an instance

var sampleStruct = SampleStruct(number: 25, flag: true)

withUnsafeBytes(of: &sampleStruct) { bytes in
	for byte in bytes {
		print(byte)
	}
}

let checksum = withUnsafeBytes(of: &sampleStruct) { (bytes) -> UInt32 in
	return ~bytes.reduce(0) { $0 + numericCast($1) }
}
print("checksum", checksum)


//withUnsafeBytes(of: &sampleStruct) { bytes in
//  for byte in bytes {
//    print(byte)
//  }
//}
//
//// Checksum the bytes of a struct
//
//let checksum = withUnsafeBytes(of: &sampleStruct) { (bytes) -> UInt32 in
//  return ~bytes.reduce(UInt32(0)) { $0 + numericCast($1) }
//}
//
//print("checksum", checksum) // prints checksum 4294967269
