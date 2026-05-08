import sys


def my_print(a: int, b: float, *arg, **kwargs) -> int:
    """
    this is a function with very long text this is a function with very long text 
    this is a function with very long text 
    this is a function with very long text 
    this is a function with very long text 
    this is a function with very long text 
    this is a function with very long text 
    """
    return 0


def other_func() -> int:
    def inner1() -> None:
        # comment
        def inner2() -> None:
            # comment
            pass

    # comment 1
    a = 1 + 1

    # comment 2
    b = a + 1

    return b


if __name__ == "__main__":
    my_print(0, 0)

