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
  import flashx.funk.IFunkObject
  import flashx.funk.error.NoSuchElementError
  import flashx.funk.option.IOption
  import flashx.funk.option.none

  internal final class NilIterator implements IIterator {
    public static const INSTANCE: NilIterator = new NilIterator()
    
    public function get hasNext(): Boolean {
      return false
    }

    public function next(): * {
      throw new NoSuchElementError()
    }

    public function get nextOption(): IOption {
      return none
    }

    public function get toArray(): Array {
      return []
    }

    public function get toVector(): Vector.<*> {
      return new Vector.<*>()
    }

    public function get toList(): IList {
      return nil
    }

    public function equals(that: IFunkObject): Boolean {
      return IteratorUtil.eq(this, that)
    }
  }
}