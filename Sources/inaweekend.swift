/*
 *  inaweekend.swift
 *  RayTracer
 *
 *  Created by laurent brusa on 2024/06/25.
 */

import Foundation

func ray_color(_ ray: Ray) -> Color {
	return Color(0, 0, 0)
}


@main
struct raytracinginaweekend {
  static func main() {
	// image
	let aspect_ratio: Double = 16.0 / 9.0;
    let image_width: Int = 400;
	print("image ratio \(aspect_ratio)")
	// image height has to be at least one
    var image_height: Int = Int(Double(image_width) / aspect_ratio);
	image_height = image_height < 1 ? 1 : image_height;
	print("image height \(image_height)")
	// camera
	let focal_length: Double = 1.0;
	let viewport_height: Double = 2.0;
	let viewport_width: Double = viewport_height * Double(image_width/image_height);	
	let camera_center: Point = Point(0, 0, 0);

	// calc vectors
	let viewport_u: Vec3 = Vec3(viewport_width, 0, 0);
	let viewport_v: Vec3 = Vec3(0, viewport_height, 0);

	// calc the horizontal and vertical delta vectors from pixel to pixel
	let pixel_delta_u: Vec3 = viewport_u / Double(image_width);
	let pixel_delta_v: Vec3 = viewport_v / Double(image_height);

	// calculate loc of upper pixel
	let viewport_upper_left: Vec3 = camera_center - viewport_u / 2 + viewport_v / 2 - Vec3(0, 0, focal_length);
	let pixel_loc00 = viewport_upper_left + 0.5 * pixel_delta_u - 0.5 * pixel_delta_v;

	// render

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