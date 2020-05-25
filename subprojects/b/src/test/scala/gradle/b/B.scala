package gradle.b

import gradle.a.A

import org.junit.Assert._
import org.junit.Test

class B {
  @Test def verifyA() {
    assertEquals("A", (new A).getLetter())
  }
}
