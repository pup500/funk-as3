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

package flashx.funk.collections {
  public interface ICollection extends IIterable {
    /**
     * The length of the collection.
     */
    [Deprecated(replacement="size", since="0.1")]
    function get length(): int

    /**
     * The total number of elements in the collection.
     */
    function get size(): int

    /**
     * Whether or not the size of the collection is known.
     */
    function get hasDefinedSize(): Boolean

    /**
     * The elements of the collection stored in an array.
     */
    function get toArray(): Array

    /**
     * The elements of the collection stored in a vector.
     */
    function get toVector(): Vector.<*>

    /**
     * The elements of the collection stored in a fixed vector.
     */
    function get toFixedVector(): Vector.<*>
  }
}