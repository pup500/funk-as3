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
  import flash.utils.Proxy
  import flash.utils.flash_proxy

  import flashx.funk.util.eq
  import flashx.funk.util.ne

  internal final dynamic class Wildcard extends Proxy {
    flash_proxy override function callProperty(name: *, ... args): * {
      return function(x: *): * {
        return x[name].apply(x, args)
      }
    }

    flash_proxy override function getProperty(name: *): * {
      return function(x: *): * {
        return x[name]
      }
    }
    
    public const binaryNot: Function = function(x: *): * {
      return ~x
    }

    public function decrementBy(value: Number): Function {
      return function(x: Number): Number {
        return x - value
      }
    }

    public function divideBy(value: Number): Function {
      return function(x: Number): Number {
        return x / value
      }
    }

    public function equals(value: *): Function {
      return function(x: *): Boolean{
        return eq(x, value)
      }
    }

    public function get(property: String): Function {
      return function(x: *): * {
        return x[property]
      }
    }

    public function greaterEqual(value: *): Function {
      return function(x: *): Boolean {
        return x >= value
      }
    }

    public function greaterThan(value: *): Function {
      return function(x: *): Boolean {
        return x > value
      }
    }

    public function incrementBy(value: Number): Function {
      return function(x: Number): Number {
        return x + value
      }
    }

    public function inRange(minValue: Number, maxValue: Number): Function {
      return function(x: *): Boolean {
        return minValue <= x && x <= maxValue
      }
    }

    public const isEven: Function = function(x: Number): Boolean {
      const asInt: int = int(x)

      if(0 != (x - asInt)) {
        return false
      }

      return (asInt & 1) == 0
    }

    public const isOdd: Function = function(x: Number): Boolean {
      const asInt: int = int(x)

      if(0 != (x - asInt)) {
        return false
      }

      return (asInt & 1) != 0
    }

    public function lessEqual(value: *): Function {
      return function(x: *): Boolean {
        return x <= value
      }
    }

    public function lessThan(value: *): Function {
      return function(x: *): Boolean {
        return x < value
      }
    }

    public function moduloBy(value: Number): Function {
      return function(x: Number): Number {
        return x % value
      }
    }

    public function multiplyBy(value: Number): Function {
      return function(x: Number): Number {
        return x * value
      }
    }

    public const not: Function = function(x: *): Boolean {
      return !x
    }

    public function notEquals(value: *): Function {
      return function(x: *): Boolean{
        return ne(x, value)
      }
    }

    public const toBoolean: Function = function(x: *): Boolean {
      return x ? true : false
    }

    public const toLowerCase: Function = function(x: *): String {
      return x is String ? String(x).toLowerCase() : ("" + x).toLowerCase()
    }

    public const toString: Function = function(x: *): String {
      return "" + x
    }

    public const toUpperCase: Function = function(x: *): String {
      return x is String ? String(x).toUpperCase() : ("" + x).toUpperCase()
    }

    // Operators
    public const plus_: Function = function(a: *, b: *): * { return a + b }
    public const minus_: Function = function(a: *, b: *): * { return a - b }
    public const multiply_: Function = function(a: *, b: *): * { return a * b }
    public const divide_: Function = function(a: *, b: *): * { return a / b }
    public const modulo_: Function = function(a: *, b: *): * { return a % b }
    public const lessThan_: Function = function(a: *, b: *): * { return a < b }
    public const greaterThan_: Function = function(a: *, b: *): * { return a > b }
    public const greaterEqual_: Function = function(a: *, b: *): * { return a >= b }
    public const lessEqual_: Function = function(a: *, b: *): * { return a <= b }
    public const equal_: Function = function(a: *, b: *): * { return eq(a, b) }
    public const notEqual_: Function = function(a: *, b: *): * { return ne(a, b)}
    public const strictlyEqual_: Function = function(a: *, b: *): * { return a == b }
    public const strictlyNotEqual_: Function = function(a: *, b: *): * { return a != b }
    public const binaryAnd_: Function = function(a: *, b: *): * { return a & b }
    public const binaryOr_: Function = function(a: *, b: *): * { return a | b }
    public const binaryXor_: Function = function(a: *, b: *): * { return a ^ b }
  }
}