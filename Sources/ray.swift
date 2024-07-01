/*
 *  ray.swift
 *  RayTracer
 *
 *  Created by laurent brusa on 2024/06/25.
 */

import Foundation

struct Ray {
	var orig: Point
	var dir: Vec3

	init() {
		orig = Point()
		dir = Vec3()
	}

	init(_ origin: Point, _ direction: Vec3) {
		orig = origin
		dir = direction
	}

	func origin() -> Point {
		return orig
	}

	func direction() -> Vec3 {
		return dir
	}

	func at(_ t: Double) -> Point {
		return orig + dir * t
	}
}