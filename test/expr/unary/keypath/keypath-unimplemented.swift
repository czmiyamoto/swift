// RUN: %target-swift-frontend -typecheck -verify %s

struct A {
  subscript(x: Int) -> Int { return x }
  var c: C? = C()
}

class C {
  var i = 0
}

func unsupportedComponents() {
  _ = \A.c?.i // expected-error{{key path support for optional chaining components is not implemented}}
  _ = \A.c!.i // expected-error{{key path support for optional force-unwrapping components is not implemented}}
  _ = \A.[0] // expected-error{{key path support for subscript components is not implemented}}
}
