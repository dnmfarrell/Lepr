Lepr
====
"Leper" is a tiny Lisp-like written in Perl. It supports lambdas, conditional execution and quoting.

Function parameters can use sigils to denote the type they hold, which is type-checked at run time. Lepr uses functional scoping rules.

Lepr is mostly "pure"; `set` and `print` are the only forms which don't return a value. Looping is done via recursion, symbols once defined cannot be re-defined.

Peter Norvig's article on [Lispy](https://norvig.com/lispy.html) inspired me, I hope it inspires you too.

Running Lepr
------------
    echo '(print "Hello, World!")' | ./lepr
    Hello, World!

    ./lepr t/hello.lr
    Hello, World!

Comments
--------
Single line comments begin with `;`.

Types
-----
  * functions
  * lists
  * nums
  * strings
  * nil

Logic
-----
The only false value is `nil` all other values are true. `nil` is equal to an empty list, so it is both an atom and a list.

Macros
------
Currently only supports the quote operator `'` which is expanded into the `quote` keyword. E.g.

    '(1 2 3) --> (quote (1 2 3))

Keywords
--------
    (fun (params) form+)
    (if cond then [else])
    (set {key value}+))
    (quote form+))

Built-in Functions
------------------
    print
    atom (x)
    cons (*x @l)
    car  (@l)
    cdr  (@l)
    eq   (x y)
    ++   (@l @m)

N.b. these satisfy the Lisp 1.5 elementary functions from the [LISP 1.5 Programmer's Manual](https://mitpress.mit.edu/books/lisp-15-programmers-manual).

Binary numerical functions:

    ==   (#x #y)
    >=   (#x #y)
    <=   (#x #y)
    >    (#x #y)
    <    (#x #y)
    +    (#x #y)
    -    (#x #y)
    /    (#x #y)
    *    (#x #y)
    ^    (#x #y)
    %    (#x #y)

Sigils
------
Function parameters may be prefaced with a sigil to denote its type:

    @ list
    * atom
    & function
    # num

The absence of a sigil means any type is permitted. Within the function body the sigil is not used when referring to the bound argument. E.g. here is a function which only accepts a number and returns it:

    (fun (#x) x)

Examples
--------
These come from Lepr's std library:

    (set id    (fun (x) x)
         &&    (fun (x y) (if x y nil))
         ||    (fun (x y) (if x x y))
         map   (fun (&f @l)
                    (set h (car l) t (cdr l))
                    (cons (f h) (if t (map f t) '())))
         grep  (fun (&f @l)
                     (set h (car l) t (cdr l))
                     (++ (if (f h) (cons h '()) nil)
                         (if t (grep f t) nil)))
         sort  (fun (@nums)
                    (set h (car nums)
                         t (cdr nums)
                         lt (if t (grep (fun (#n) (<  n h)) t) nil)
                         ge (if t (grep (fun (#n) (>= n h)) t) nil))
                    (if nums (++ (sort lt) (cons h (sort ge))) nil))
         foldl (fun (&f i @l)
                    (set h (car l) t (cdr l))
                    (if l (foldl f (f i h) t) i))
         and   (fun (@l) (foldl && 1 l))
         or    (fun (@l) (foldl || nil l)))

Tests
-----
Run the test suite:

    $ t/run-tests.t

Dependencies
------------
Perl 5.16 or higher.

Install
-------
Save the `lepr` file somewhere in your PATH.

License
-------
Copyright 2020 David Farrell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
