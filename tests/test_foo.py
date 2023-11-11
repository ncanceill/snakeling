from snakeling.foo import Foo
from unittest import TestCase


class FooTest(TestCase):
    def test_foo(self) -> None:
        _ = Foo()
