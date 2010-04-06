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

package flashx.funk._ {
  import flashx.funk.util.eq
  import flashx.funk.util.ne

  public class $op {
    public static const add: Function = function(a: *, b: *): * { return a + b }
    public static const subtract: Function = function(a: *, b: *): * { return a - b }
    public static const multiply: Function = function(a: *, b: *): * { return a * b }
    public static const divide: Function = function(a: *, b: *): * { return a / b }
    public static const modulo: Function = function(a: *, b: *): * { return a % b }
    public static const lessThan: Function = function(a: *, b: *): * { return a < b }
    public static const greaterThan: Function = function(a: *, b: *): * { return a > b }
    public static const greaterEqual: Function = function(a: *, b: *): * { return a >= b }
    public static const lessEqual: Function = function(a: *, b: *): * { return a <= b }
    public static const equal: Function = function(a: *, b: *): * { return eq(a, b) }
    public static const notEqual: Function = function(a: *, b: *): * { return ne(a, b)}
    public static const strictlyEqual: Function = function(a: *, b: *): * { return a == b }
    public static const strictlyNotEqual: Function = function(a: *, b: *): * { return a != b }
    public static const binaryAnd: Function = function(a: *, b: *): * { return a & b }
    public static const binaryOr: Function = function(a: *, b: *): * { return a | b }
    public static const binaryXor: Function = function(a: *, b: *): * { return a ^ b }
  }
}