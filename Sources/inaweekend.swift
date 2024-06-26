// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct raytracinginaweekend {
  static func main() {
    let image_width: Int = 256;
    let image_height: Int = 256;
	let fileName: String = "test.ppm"
	let filePath: String = FileManager.default.currentDirectoryPath + "/" + fileName
	
	FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
	
	if let fileHandle: FileHandle = FileHandle(forWritingAtPath: filePath) {
		let header: String = "P3\n\(image_width) \(image_height)\n255\n"
		if let headerData: Data = header.data(using: .utf8) {
			fileHandle.write(headerData)
		}
		for j in 0..<image_height {
			for i in 0..<image_width {
				let r: Double = Double(i) / Double(image_width-1)
				let g: Double = Double(j) / Double(image_height-1)
				let b: Double = 0.0

				let ir: Int = Int(255.999 * r)
				let ig: Int = Int(255.999 * g)
				let ib: Int = Int(255.999 * b)

				let pixel: String = "\(ir) \(ig) \(ib)\n"
				if let pixel: Data = pixel.data(using: .utf8) {
					fileHandle.write(pixel)
				}
			}
		}
	}
  }
}