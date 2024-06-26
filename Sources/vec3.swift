
/*
 *  vec3.swift
 *  RayTracer
 *
 *  Created by laurent brusa on 2024/06/25.
 */

/*
 *  since they all have three components, 
 *  we can treat them all as the same type for this exercise
 */ 

import Foundation
typealias Point = Vec3
typealias Color = Vec3

struct Vec3 {

    var e: [Double]

	init(x: Double, y: Double, z: Double) {
		e = [x, y, z]
	}

	init() {
		e = [0.0, 0.0, 0.0]
	}

	func x() -> Double {
		return e[0]
	}

	func y() -> Double {
		return e[1]
	}

	func z() -> Double {
		return e[2]
	}

	static prefix func - (_ v: Vec3) -> Vec3 {
		return Vec3(x: -v.e[0], y: -v.e[1], z: -v.e[2])
	}
	
	static func + (left: Vec3, right: Vec3) -> Vec3 {
       return Vec3(x: left.x() + right.x(), y: left.y() + right.y(), z: left.z() + right.z())
    }

	static func += (left: inout Vec3, right: Vec3) {
        left = left + right
    }

	static func * (left: Vec3, _ t: Double) -> Vec3 {
	   return Vec3(x: left.x() * t, y: left.y() * t, z: left.z() * t)
	}

	static func *= (left: inout Vec3, _ t: Double) {
		left = left * t
	}

	static func / (left: Vec3, _ t: Double) -> Vec3 {
	   return Vec3(x: left.x() / t, y: left.y() / t, z: left.z() / t)
	}

	static func /= (left: inout Vec3, _ t: Double) {
		left = left / t
	}

	func length() -> Double {
		return sqrt(length_squared())
	}

	func length_squared() -> Double {
		return e[0]*e[0] + e[1]*e[1] + e[2]*e[2]
	}

	func dot(_ v: Vec3) -> Double {
		return e[0]*v.e[0] + e[1]*v.e[1] + e[2]*v.e[2]
	}

	func cross(_ v: Vec3) -> Vec3 {
		return Vec3(x: e[1]*v.e[2] - e[2]*v.e[1],
					y: e[2]*v.e[0] - e[0]*v.e[2],
					z: e[0]*v.e[1] - e[1]*v.e[0])
	}

	func unit_vector() -> Vec3 {
		return self / length()
	}
}
