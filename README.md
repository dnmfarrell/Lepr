Lepr
====
"Leper" is a tiny Lisp-like written in Perl. It supports lambdas, macros, conditional execution and more features are on the way. Unlike regular lisps, Lepr auto-expands lists reducing the need for parens and lazily evaluates expressions. Part of this experiment is to find out if those features lead to a pleasant programming experience.

    ./lepr '(print "Hello, World!")'
    Hello, World!

Peter Norvig's article on [Lispy](https://norvig.com/lispy.html) inspired me, I hope it inspires you too.

Keywords
--------
    (call fun-name args*)
    (fun [name] (params) body+)
    (if cond then [else])
    (macro name (params) body+)
    (set ((key value)*) body+)

Functions
---------
    atom
    print
    dump
    split
    eq
    fold
    grep
    head
    join
    sort
    tail
    map
    nil
    ==
    >=
    <=
    >
    <
    +
    -
    /
    *
    ^
    %

Examples
--------
### Quicksort

    (fun qsort (@nums)
      (if nums
          (set (h  (head nums)
                t  (tail nums)
                lt (grep (fun (n) <  n h) t)
                ge (grep (fun (n) >= n h) t))
                (qsort lt) h qsort ge)))

    (print join " " qsort 2 1 7 1 8 3)

Copyright 2020 David Farrell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
