## Changes Between Julia0.6 and Julia 1.0

#### Julia 0.6 vs Julia 1.0

### Output 
readline(STDIN) v.0.6
readline(stdin) v.1


#### Range
range(1,10) v.0.6
range(1,stop=10) v.1.0


### Package
Pkg.add("")
Pkg.update("")
PkgDev
Pkg.status

#### v.1
] 
add Packagename
update Packagename
up Pkgname
status 
generate
#### using Pkg 
- If you want to still use the old method for Pkgs


### Pair Operator
The pair operator `=>` is now broadcastable as `.=>` which was previously a parsing error


### Functions
The syntax for parametric methods, `function f{T}(x::T)`, has been
changed to `function f(x::T) where {T}`

function f{T}(x::T) v.06
function f(x::T) where {T}


### Parsing of <|
The parsing of `<|` is now right associative. `|>` remains left associative


### Type Definitions
Parsed and lowered forms of type definitions have been synchronized with the
 	ir
 	    new keywords ([#23157]). Expression heads are renamed as follows:
 	
 	    + `type`           => `struct`
 	
 	    + `bitstype`       => `primitive` (order of arguments is also reversed, to m
 	atch syntax)
 	
 	    + `composite_type` => `struct_type`
 	
 	    + `bits_type`      => `primitive_type`


### for loops
 In `for i = ...`, if a local variable `i` already existed it would be overwritten during the loop. This behavior is deprecated, and in the future `for` loop variables
  will always be new variables local to the loop ([#22314]).
 The old behavior of overwriting an existing variable is available via `for outer i = ...`.
		* In `for i in x`, `x` used to be evaluated in a new scope enclosing the `for` loop.
		Now it is evaluated in the scope outside the `for` loop.
 	
 	  * In `for i in x, j in y`, all variables now have fresh bindings on each iteration of the
 	    innermost loop. For example, an assignment to `i` will not be visible on the
 	 next `j`
 	    loop iteration ([#330]).
 	
 	  * Variable bindings local to `while` loop bodies are now freshly allocated on 
 	each loop iteration,
 	    matching the behavior of `for` loops.



### Importall
importall v.0.6
using  v.1

The keyword `importall` is deprecated. Use `using` and/or individual `import ` statements

### reprmime
`reprmime(mime, x)` has been renamed to `repr(mime, x)`, and along with `repr(x)`

### tuple construction
 The syntax `(x...)` for constructing a tuple is deprecated; use `(x...,)` in
 	stead 

### try block

 * `try` blocks without `catch` or `finally` are no longer allowed. An explicit empty `catch` block should be written instead 

### File and Director
- `@__FILE__` and `@__DIR__` returns the full path instead of nothing.


### promote
`f(x, y) = f(promote(x, y)...)` must be of the same type



### Indmax
`indmin` and `indmax` have been renamed to `argmin` and `argmax` 

### Command Line Arguments
- All command line arguments passed via `-e`, `-E`, and `-L` will be executed in the order given on the command line


### findall
`findn(x::AbstractArray)` has been deprecated in favor of `findall(!iszero,x)`, which now returns cartesian indices for multidimensional arrays (see below, [#25532])



### find
`find` has been renamed to `findall`. `findall`, `findfirst`, `findlast`, `findnext`


### find* 
The `find*` functions, i.e. `findnext`, `findprev`, `findfirst`, and `findlast`, as well as `indexin`, now return `nothing` when no match is 
found rather than `0` or `0:-1`


### Fieldnames 
The `fieldnames` and `propertynames` functions now return a tuple rather than an array

### filesystem
* `mv`,`cp`, `touch`, `mkdir`, `mkpath`, `chmod` and `chown` now return the path that was created/modified rather than `nothing`


###  Module
`pathof(module)` returns the path a module was imported from.


### chop
`chop` now accepts two arguments `head` and `tail` number of characters to remove from the head and tail of the string


### eig
`eig(A[, args...])` has been deprecated in favor of `eigen(A[, args...])`


### indices
 `indices(a)` and `indices(a,d)` have been deprecated in favor of `axes(a)` a
 	nd
 	    `axes(a, d)

###whos
 `whos` has been renamed `varinfo`, and now returns a markdown table instead 
 	of printing
 	    output ([#12131]).

## RowVector
 	  * Uninitialized `RowVector` constructors of the form `RowVector{T}(shape...)` 
 	have been
 	    deprecated in favor of equivalents accepting `undef` (an alias for
 	    `UndefInitializer()`) as their first argument, as in
 	    `RowVector{T}(undef, shape...)`. For example, `RowVector{Int}(3)` is now
 	    `RowVector{Int}(undef, 3)`, and `RowVector{Float32}((1, 4))` is now
 	    `RowVector{Float32}(undef, (1, 4))` ([#24786]).

### Read FileIO
* `writecsv(io, a; opts...)` has been deprecated in favor of
 	    `writedlm(io, a, ','; opts...)` ([#23529]).
 	
 	  * The method `srand(rng, filename, n=4)` has been deprecated ([#21359]).
 	
 	  * `readcsv(io[, T::Type]; opts...)` has been deprecated in favor of
 	    `readdlm(io, ','[, T]; opts...)`

### Ternary operators
 Ternaries must now include some amount of whitespace, e.g. `x ? a : b` rather than `x?a:b`

### OS
The operating system identification functions: `is_linux`, `is_bsd`, `is_app
 	le`, `is_unix`,
 	    and `is_windows`, have been deprecated in favor of `Sys.islinux`, `Sys.isbsd
 	`, `Sys.isapple`,
 	    `Sys.isunix`, and `Sys.iswindows`, respectively ([#22182]).
 	
 	  * The forms of `read`, `readstring`, and `eachline` that accepted both a `Cmd`
 	 object and an
 	    input stream are deprecated. Use e.g. `read(pipeline(stdin, cmd))` instead (
 	[#22762]).

### Base.MathConstants
* The mathematical constants `π`, `pi`, `ℯ`, `e`, `γ`, `eulergamma`, `catalan`, `φ` have been moved from `Base` to a new module; `Base.MathConstants`.
 Only `π`, `pi` and `ℯ` are now exported by default from `Base` ([#23427]).


### time
* The timing functions `tic`, `toc`, and `toq` are deprecated in favor of @time and @elapsed


### contains
* `contains` has been deprecated in favor of a more general `occursin` functio
 	n, which
 	    takes its arguments in reverse order from `contains` ([#26283]).
 	
 	  * `Regex` objects are no longer callable. Use `occursin` instead ([#26283]).
 	
 	  * The methods of `range` based on positional arguments have been deprecated in
 	 favor of
 	    keyword arguments ([#25896]).
 	
 	  * `linspace` has been deprecated in favor of `range` with `stop` and `length` 
 	keyword
 	    arguments ([#25896]).
 	
 	  * `LinSpace` has been renamed to `LinRange` ([#25896]).
 	
 	  * `logspace` has been deprecated to its definition ([#25896]).
 	
 	  * `endof(a)` has been renamed to `lastindex(a)`, and the `end` keyword in inde
 	xing expressions now
 	    lowers to either `lastindex(a)` (in the case with only one index) or `lastin
 	dex(a, d)` (in cases
 	    where there is more than one index and `end` appears at dimension `d`) ([#23
 	554], [#25763]).



### isupper
  * `isupper`, `islower`, `ucfirst` and `lcfirst` have been deprecated in favor 
 	of `isuppercase`,
 	    `islowercase`, `uppercasefirst` and `lowercasefirst`, respectively ([#26442]
 	).


### squeeze
 * `squeeze` is deprecated in favor of `dropdims`.
 	
 	  * `srand` is deprecated in favor of the unexported `Random.seed!` ([#27726]).
 	
 	  * `realmin`/`realmax` are deprecated in favor of `floatmin`/`floatmax` ([#2830
 	2]).
 	
 	  * `sortrows`/`sortcols` have been deprecated in favor of the more general `sor
 	tslices`.
 	
 	  * `nextpow2`/`prevpow2` have been deprecated in favor of the more general `nex
 	tpow`/`prevpow` functions.




##### Credits
 - Fossies.com
 - Julia Issues
 - @JCharisTech