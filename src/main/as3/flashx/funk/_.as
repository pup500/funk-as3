/*
 * This file is part of funk-as3.
 *
 * funk-as3 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * funk-as3 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Apparat. If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright (C) 2010 Joa Ebert
 * http://www.joa-ebert.com/
 */

package flashx.funk {
  import flashx.funk.util.eq
  import flashx.funk.util.isAbstract
  import flashx.funk.util.ne

  public final class _ {
    public const binaryNot: Function = function(x: *): * {
      return ~x
    }

    public function decrementBy(value: Number): Function {
      return function(x: Number): Number {
        return x - value
      }
    }

    public static function divideBy(value: Number): Function {
      return function(x: Number): Number {
        return x / value
      }
    }

    public static function equals(value: *): Function {
      return function(x: *): Boolean{
        return eq(x, value)
      }
    }

    public static function get(property: String): Function {
      return function(x: *): * {
        return x[property]
      }
    }

    public static function greaterEqual(value: *): Function {
      return function(x: *): Boolean {
        return x >= value
      }
    }

    public static function greaterThan(value: *): Function {
      return function(x: *): Boolean {
        return x > value
      }
    }

    public static function incrementBy(value: Number): Function {
      return function(x: Number): Number {
        return x + value
      }
    }

    public static function inRange(minValue: Number, maxValue: Number): Function {
      return function(x: *): Boolean {
        return minValue <= x && x <= maxValue
      }
    }

    public static const isEven: Function = function(x: Number): Boolean {
      const asInt: int = int(x)

      if(0 != (x - asInt)) {
        return false
      }

      return (asInt & 1) == 0
    }

    public static const isOdd: Function = function(x: Number): Boolean {
      const asInt: int = int(x)

      if(0 != (x - asInt)) {
        return false
      }

      return (asInt & 1) != 0
    }

    public static function lessEqual(value: *): Function {
      return function(x: *): Boolean {
        return x <= value
      }
    }

    public static function lessThan(value: *): Function {
      return function(x: *): Boolean {
        return x < value
      }
    }

    public static function moduloBy(value: Number): Function {
      return function(x: Number): Number {
        return x % value
      }
    }

    public static function multiplyBy(value: Number): Function {
      return function(x: Number): Number {
        return x * value
      }
    }

    public static const not: Function = function(x: *): Boolean {
      return !x
    }

    public static function notEquals(value: *): Function {
      return function(x: *): Boolean{
        return ne(x, value)
      }
    }

    public static const toBoolean: Function = function(x: *): Boolean {
      return x ? true : false
    }

    public static const toLowerCase: Function = function(x: *): String {
      return x is String ? String(x).toLowerCase() : ("" + x).toLowerCase()
    }

    public static const toString: Function = function(x: *): String {
      return "" + x
    }

    public static const toUpperCase: Function = function(x: *): String {
      return x is String ? String(x).toUpperCase() : ("" + x).toUpperCase()
    }

    // Operators
    public static const plus_: Function = function(a: *, b: *): * { return a + b }
    public static const minus_: Function = function(a: *, b: *): * { return a - b }
    public static const multiply_: Function = function(a: *, b: *): * { return a * b }
    public static const divide_: Function = function(a: *, b: *): * { return a / b }
    public static const modulo_: Function = function(a: *, b: *): * { return a % b }
    public static const lessThan_: Function = function(a: *, b: *): * { return a < b }
    public static const greaterThan_: Function = function(a: *, b: *): * { return a > b }
    public static const greaterEqual_: Function = function(a: *, b: *): * { return a >= b }
    public static const lessEqual_: Function = function(a: *, b: *): * { return a <= b }
    public static const equal_: Function = function(a: *, b: *): * { return eq(a, b) }
    public static const notEqual_: Function = function(a: *, b: *): * { return ne(a, b)}
    public static const strictlyEqual_: Function = function(a: *, b: *): * { return a == b }
    public static const strictlyNotEqual_: Function = function(a: *, b: *): * { return a != b }
    public static const binaryAnd_: Function = function(a: *, b: *): * { return a & b }
    public static const binaryOr_: Function = function(a: *, b: *): * { return a | b }
    public static const binaryXor_: Function = function(a: *, b: *): * { return a ^ b }
    
    public function _() { isAbstract() }
  }
}