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

package flashx.funk.collections.immutable {
  import flashx.funk._.$divideBy
  import flashx.funk._.$equals
  import flashx.funk._.$greaterThan
  import flashx.funk._.$isEven
  import flashx.funk._.$lessThan
  import flashx.funk._.$op
  import flashx.funk._.$toLowerCase
  import flashx.funk._.$toUpperCase
  import flashx.funk.closure
  import flashx.funk.collections.IList
  import flashx.funk.collections.Range
  import flashx.funk.collections.list
  import flashx.funk.collections.nil
  import flashx.funk.collections.toList
  import flashx.funk.error.IndexOutOfBoundsError
  import flashx.funk.error.NoSuchElementError
  import flashx.funk.test.identity
  import flashx.funk.option.none
  import flashx.funk.option.some
  import flashx.funk.test.assertThrows
  import flashx.funk.tuple.ITuple2
  import flashx.funk.test.mapFalse
  import flashx.funk.test.mapTrue

  import flashx.funk.tuple.tuple2

  import flexunit.framework.TestCase

  public class TestList extends TestCase {
    public function testContains(): void {
      assertTrue(list(undefined).contains(undefined))
      assertTrue(Range.to(1, 10).map(closure(some)).contains(some(2)))
      assertFalse(Range.to(1, 10).map(closure(some)).contains(some(0)))
      assertFalse(Range.to(1, 10).map(closure(some)).contains(none))
    }

    public function testCount(): void {
      assertEquals(5, list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10).count($isEven))
      assertEquals(5, Range.to(1, 10).count($isEven))
      assertEquals(0, Range.to(1, 10).count($greaterThan(10)))
      assertEquals(1, Range.to(1, 10).count($equals(10)))
    }

    public function testNotEmpty(): void {
      assertTrue(list(1).notEmpty)
      assertTrue(list(1, 2).notEmpty)
      assertFalse(list().notEmpty)
    }

    public function testDrop(): void {
      assertThrows(closure(list(1, 2).drop, -1), ArgumentError)
      assertEquals(2, list(1, 1, 2).drop(2).head)
      assertStrictlyEquals(nil, list(1, 2).drop(2))
      assertTrue(list(3, 4).equals(list(1, 2, 3, 4).drop(2)))
      const l: IList = list(1, 2, 3)
      assertStrictlyEquals(l, l.drop(0))
    }

    public function testDropRight(): void {
      assertThrows(closure(list(1, 2).dropRight, -1), ArgumentError)
      assertEquals(1, list(1, 2, 2).dropRight(2).head)
      assertStrictlyEquals(nil, list(1, 2).dropRight(2))
      assertTrue(list(1, 2).equals(list(1, 2, 3, 4).dropRight(2)))
      const l: IList = list(1, 2, 3)
      assertStrictlyEquals(l, l.dropRight(0))
    }

    public function testDropWhile(): void {
      assertStrictlyEquals(nil, list(1, 2, 3, 4).dropWhile(mapTrue))
      const l: IList = list(1, 2, 3)
      assertStrictlyEquals(l, l.dropWhile(mapFalse))
    }

    public function testExists(): void {
      assertTrue(list(1).exists(mapTrue))
      assertTrue(Range.to(1, 10).exists($equals(5)))
      assertFalse(Range.to(1, 10).exists($equals(0)))
    }

    public function testFilter(): void {
      const l: IList = list(1, 2, 3)
      assertStrictlyEquals(l, l.filter(mapTrue))
      assertTrue(list(2, 4, 6, 8, 10).equals(Range.to(1, 10).filter($isEven)))
    }

    public function testFilterNot(): void {
      const l: IList = list(1, some(2), 1, some(2))
      const l0: int = l.size
      assertEquals(l.size - 2, l.filterNot($equals(some(2))).size)
      assertEquals(l.size, l.filterNot(mapFalse).size)
      assertStrictlyEquals(nil, l.filterNot(mapTrue))
    }

    public function testFind(): void {
      assertTrue(some(some(2)).equals(Range.to(1, 10).map(closure(some)).find($equals(some(2)))))
      assertStrictlyEquals(none, Range.to(1, 10).map(closure(some)).find($equals(some(11))))
      assertStrictlyEquals(none, Range.to(1, 10).map(closure(some)).find($equals(none)))
    }

    public function testFindIndexOf(): void {
      assertEquals(2, list(0, 1, 2).findIndexOf($equals(2)))
      assertEquals(-1, list(0, 1, 2).findIndexOf($equals(3)))
    }

    public function testFlatMap(): void {
      assertTrue(list("a","b","c","d").equals(list("a","b","c","d").flatMap(toList)))
      assertTrue(list(1, 3).equals(list(1, 2, 3).flatMap(
          function(x: int): IList {
            return x == 2 ? nil : list(x)
          }
        )
      ))

      assertThrows(
        function(): void {
          list(1, 2, 3).flatMap(function(): Object { return {} })
        }, TypeError
      )
    }

    public function testFlatten(): void {
      assertTrue(list(1, 2, 3), list(list(1), nil, list(2), nil, nil, list(3)).flatten)
    }

    public function testFoldLeft(): void {
      const n: int = 100
      assertEquals(n*(n+1)/2, Range.to(1, n).foldLeft(0, $op.add))
      assertEquals((n+1)*((n+1)+1)/2, Range.to(1, n+1).foldLeft(0, $op.add))
      assertEquals("#"+"TEST".toLowerCase(), toList("TEST").map($toLowerCase).foldLeft("#", $op.add))
    }

    public function testFoldRight(): void {
      const n: int = 100
      assertEquals(n*(n+1)/2, Range.to(1, n).foldRight(0, $op.add))
      assertEquals((n+1)*((n+1)+1)/2, Range.to(1, n+1).foldRight(0, $op.add))
      assertEquals("#"+"test".toUpperCase(), toList("tset").map($toUpperCase).foldRight("#", $op.add))
    }

    public function testForall(): void {
      assertTrue(Range.to(1, 10).forall(mapTrue))
      assertFalse(Range.to(1, 10).forall(mapFalse))
      assertTrue(Range.to(1, 10).forall($lessThan(11)))
      assertFalse(Range.to(1, 10).forall($lessThan(10)))
    }

    public function testForeach(): void {
      const n: int = 10
      var i: int = 0

      Range.until(0, n).foreach(
          function(x: int): void {
            assertEquals(i++, x)
          }
      )

      assertEquals(i, n)
    }

    public function testGet(): void {
      assertTrue(Range.until(0, 10).equals(Range.until(0, 10)))

      Range.until(0, 10).zipWithIndex.foreach(
        function(x: ITuple2): void {
          assertEquals(x._1, Range.until(0, 10).get(x._2))
        }
      )

      assertThrows(closure(Range.until(0, 10).get, -1), IndexOutOfBoundsError)
      assertThrows(closure(Range.until(0, 10).get, 10), IndexOutOfBoundsError)
    }

    public function testHead(): void {
      const value: Object = {}
      assertStrictlyEquals(value, list(value, 2, 3).head)
      assertEquals(1, list(1,2,3).head)
      assertUndefined(list(undefined, 2, 3).head)
    }

    public function testHeadOption(): void {
      const value: Object = {}
      assertStrictlyEquals(value, list(value, 2, 3).headOption.get)
      assertEquals(1, list(1,2,3).headOption.get)
      assertUndefined(list(undefined, 2, 3).headOption.get)
    }

    public function testIndexOf(): void {
      assertEquals(0, Range.to(0, 10).indexOf(0))
      assertEquals(9, Range.to(0, 10).indexOf(9))
      assertEquals(4, Range.to(0, 10).indexOf(4))
      assertEquals(-1, Range.to(0, 10).indexOf(11))
    }

    public function testIndices(): void {
      const value: String = "test"
      assertTrue(Range.until(0, value.length).equals(toList(value).indices))
    }

    public function testInit(): void {
      const l: IList = list(1,2,3)
      assertEquals(l.size - 1, l.init.size)
      assertEquals("tes", toList("test").init.reduceLeft($op.add))
    }

    public function testIsEmpty(): void {
      assertTrue(list().isEmpty)
      assertFalse(list(undefined).isEmpty)
    }

    public function testLast(): void {
      assertEquals("$", toList("test$").last)
    }

    public function testMap(): void {
      const l: IList = list(2, 4, 6, 8)
      assertEquals(l.reduceLeft($op.add) / 2, l.map($divideBy(2)).reduceLeft($op.add))
    }

    public function testPartition(): void {
      const l: IList = Range.to(1, 10)
      const p: ITuple2 = l.partition($isEven)
      assertTrue(p._1 is IList)
      assertTrue(p._2 is IList)
      assertEquals(5, p._1.size)
      assertEquals(5, p._2.size)
      assertTrue(l.filter($isEven).equals(p._1))
      assertTrue(l.filterNot($isEven).equals(p._2))
    }

    public function testPrepend(): void {
      const value: Object = {}
      assertEquals(1, nil.prepend(value).size)
      assertStrictlyEquals(value, nil.prepend(value).get(0))
    }

    public function testPrependAll(): void {
      const l: IList = list({}, {}, {})
      assertEquals(l.size, nil.prependAll(l).size)
      for(var i: int = 0, n: int = l.size; i < n; ++i) {
        assertStrictlyEquals(l.get(i), nil.prependAll(l).get(i))
      }
      assertEquals(0, nil.prependAll(nil).size)
      assertStrictlyEquals(nil, nil.prependAll(nil))
    }

    public function testReduceLeft(): void {
      const n: int = 100
      assertEquals(n*(n+1)/2, Range.to(1, n).reduceLeft($op.add))
      assertEquals((n+1)*((n+1)+1)/2, Range.to(1, n+1).reduceLeft($op.add))
      assertEquals("TEST".toLowerCase(), toList("TEST").map($toLowerCase).reduceLeft($op.add))
    }

    public function testReduceRight(): void {
      const n: int = 100
      assertEquals(n*(n+1)/2, Range.to(1, n).reduceRight($op.add))
      assertEquals((n+1)*((n+1)+1)/2, Range.to(1, n+1).reduceRight($op.add))
      assertEquals("test".toUpperCase(), toList("tset").map($toUpperCase).reduceRight($op.add))
    }

    public function testReverse(): void {
      assertTrue(toList("ogeniederherrehredeinego").equals(toList("ogeniederherrehredeinego").reverse))
      assertTrue(list(5,4,3,2,1).equals(list(1,2,3,4,5).reverse))
    }

    public function testTail(): void {
      assertTrue(list(1).tail.isEmpty)
      assertFalse(list(1,2).tail.isEmpty)
      assertTrue(list(2).equals(list(1,2).tail))
    }

    public function testTailOption(): void {
      assertTrue(some(nil), list(1).tailOption)
      assertTrue(some(list(2)).equals(list(1, 2).tailOption))
    }

    public function testTake(): void {
      assertThrows(closure(list(1).take, -1), ArgumentError)
			assertTrue(list(true).take(1).head)
			assertTrue(list(true,false).equals(list(true,false,false,false).take(2)))
    }

    public function takeRight(): void {
      assertThrows(closure(list(1).takeRight, -1), ArgumentError)
			assertTrue(list(true).takeRight(1).head)
			assertTrue(list(true,false).equals(list(false,false,true,false).takeRight(2)))
    }

    public function testTakeWhile(): void {
      assertTrue(list(true, true, true).equals(list(true, true, true).takeWhile(mapTrue)))
      assertTrue(nil.equals(list(true, true, true).takeWhile(mapFalse)))
    }

    public function testZip(): void {
      assertTrue(
        list(
          tuple2(1,1), tuple2(2,2), tuple2(3,3)
        ).equals(
          Range.to(1,3).zip(Range.to(1,3))
        )
      )

      assertTrue(
        list(
          tuple2(1,1), tuple2(2,2), tuple2(3,3)
        ).equals(
          Range.to(1,4).zip(Range.to(1,3))
        )
      )

      assertTrue(
        list(
          tuple2(1,1), tuple2(2,2), tuple2(3,3)
        ).equals(
          Range.to(1,3).zip(Range.to(1,4))    
        )
      )
    }

    public function testZipWithIndex(): void {
      assertTrue(
        list(
          tuple2(1,0), tuple2(2,1), tuple2(3,2)
        ).equals(
          Range.to(1,3).zipWithIndex
        )
      )
    }

    public function testProductArity(): void {
      const n: int = 10
      assertEquals(Range.to(1,n).size, Range.to(1,n).productArity)
      assertEquals(Range.to(1,n+1).size, Range.to(1,n+1).productArity)
    }

    public function testProductElement(): void {
      const value: Object = {}
      assertThrows(closure(list(0).productElement, 1), IndexOutOfBoundsError)
      assertThrows(closure(list(0).productElement, -1), IndexOutOfBoundsError)
      assertStrictlyEquals(value, list(value).productElement(0))
    }

    public function testProductPrefix(): void {
      assertEquals("List", list(0).productPrefix)
    }

    public function testMkString(): void {
      assertEquals("1, 2, 3", list(1,2,3).mkString(", "))
    }

    public function testEquals(): void {
      assertTrue(list(undefined).equals(list(undefined)))
      assertTrue(list(null).equals(list(null)))
      assertFalse(list({}).equals(list({})))
      assertTrue(list().equals(list()))
      assertTrue(list().equals(list(1).tail))
    }

    public function testSize(): void {
      const n: int = 10
      assertEquals(0, list().size)
      assertEquals(n, Range.to(1,n).size)
      assertEquals(n+1, Range.to(1,n+1).size)
    }

    public function testHasDefinedSize(): void {
      assertTrue(list().hasDefinedSize)
      assertTrue(list(1).hasDefinedSize)
    }

    public function testToArray(): void {
      const n: int = 10
      assertEquals(0, list().toArray.length)
      assertEquals(n, Range.to(1,n).toArray.length)
      assertEquals(n+1, Range.to(1,n+1).toArray.length)
      assertEquals(1, list(1,2,3).toArray[0])
      assertEquals(2, list(1,2,3).toArray[1])
      assertEquals(3, list(1,2,3).toArray[2])
    }

    public function testToVector(): void {
      const n: int = 10
      assertEquals(0, list().toVector.length)
      assertEquals(n, Range.to(1,n).toVector.length)
      assertEquals(n+1, Range.to(1,n+1).toVector.length)
      assertEquals(1, list(1,2,3).toVector[0])
      assertEquals(2, list(1,2,3).toVector[1])
      assertEquals(3, list(1,2,3).toVector[2])
    }

    public function testToFixedVector(): void {
      const n: int = 10
      assertEquals(0, list().toFixedVector.length)
      assertEquals(n, Range.to(1,n).toFixedVector.length)
      assertEquals(n+1, Range.to(1,n+1).toFixedVector.length)
      assertEquals(1, list(1,2,3).toFixedVector[0])
      assertEquals(2, list(1,2,3).toFixedVector[1])
      assertEquals(3, list(1,2,3).toFixedVector[2])
      assertTrue(list(1,2,3).toFixedVector.fixed)
    }
  }
}