Lepr
====
"Leper" is a tiny Lisp-like written in Perl. It supports lambdas, macros, conditional execution and more features are on the way. Unlike regular lisps, Lepr auto-expands lists reducing the need for parens and lazily evaluates expressions. Part of this experiment is to find out if those features lead to a pleasant programming experience.

   ./lepr '(print "Hello, World!")'
   Hello, World!

Keywords
--------

    call
    fun
    if
    macro
    nil
    set

Functions
---------

    !
    *
    +
    -
    /
    <
    <=
    ==
    >
    >=
    ^
    dump
    eq
    grep
    head
    join
    map
    print
    sort
    split
    tail

Copyright 2020 David Farrell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
