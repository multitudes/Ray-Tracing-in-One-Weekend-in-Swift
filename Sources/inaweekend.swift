/*
 *  inaweekend.swift
 *  RayTracer
 *
 *  Created by laurent brusa on 2024/06/25.
 */

import Foundation

@main
struct raytracinginaweekend {
  static func main() {
	// let aspect_ratio: Double = 16.0 / 9.0;
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
			print("Scanlines remaining: \(image_height - j - 1)")
			for i in 0..<image_width {
				let pixel_color: Color = Color(Double(i) / Double(image_width-1), Double(j) / Double(image_height-1), 0);
            	write_color(output: fileHandle, color: pixel_color);
			}
		}
		fileHandle.closeFile()
	    print("Done.")
	}
  }
}