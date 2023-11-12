from snakeling.foo import Bar
from unittest import TestCase


class BarTest(TestCase):
    def test_bar(self) -> None:
        _ = Bar()
        self.assertTrue(False)  # deliberately fail
