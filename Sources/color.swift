/*
 *  vec3.swift
 *  RayTracer
 *
 *  Created by laurent brusa on 2024/06/25.
 */

import Foundation

func write_color(output fileHandle: FileHandle, color: Color) {
    let r: Double = color.x();
    let g: Double = color.y();
    let b: Double = color.z();

    // Translate the [0,1] component values to the byte range [0,255].
    let rbyte: Int = Int(255.999 * r);
    let gbyte: Int = Int(255.999 * g);
    let bbyte: Int = Int(255.999 * b);

    // Write out the pixel color components.
	let pixel: String = "\(rbyte) \(gbyte) \(bbyte)\n"
	if let pixel: Data = pixel.data(using: .utf8) {
		fileHandle.write(pixel)
	}
}
