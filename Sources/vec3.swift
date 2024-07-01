/*
 *  vec3.swift
 *  RayTracer
 *
 *  Created by laurent brusa on 2024/06/25.
 */
 
import Foundation

/*
 *  since they all have three components, 
 *  we can treat them all as the same type for this exercise
 */ 
typealias Point = Vec3
typealias Color = Vec3

struct Vec3 {

    var e: [Double]

	init(_ x: Double, _ y: Double, _ z: Double) {
		e = [x, y, z]
	}

	init() {
		e = [0.0, 0.0, 0.0]
	}
}

extension Vec3 {

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
		return Vec3(-v.e[0], -v.e[1], -v.e[2])
	}
	
	static func + (left: Vec3, right: Vec3) -> Vec3 {
       return Vec3(left.x() + right.x(), 
	   			   left.y() + right.y(), 
				   left.z() + right.z())
    }

	static func += (left: inout Vec3, right: Vec3) {
        left = left + right
    }

	static func * (left: Vec3, _ t: Double) -> Vec3 {
	   return Vec3(left.x() * t, left.y() * t, left.z() * t)
	}

	static func *= (left: inout Vec3, _ t: Double) {
		left = left * t
	}

	static func / (left: Vec3, _ t: Double) -> Vec3 {
	   return Vec3(left.x() / t, left.y() / t, left.z() / t)
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
		return Vec3(e[1]*v.e[2] - e[2]*v.e[1],
					e[2]*v.e[0] - e[0]*v.e[2],
					e[0]*v.e[1] - e[1]*v.e[0])
	}

	func unit_vector() -> Vec3 {
		return self / length()
	}
}
