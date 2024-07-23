# MiniCompiler - Riley Peters

## Progress

### Milestone 1 - Static Analysis [Complete]

- Verifies the input .mini program is properly formatted.
- Ensures there is a valid main function, all operations have the 
correct input types, and that all non-void functions return.

### Milestone 2 - Stack Based LLVM [Complete]

- Generates LLVM IR representing the input .mini program.
- For each operation, all sources must be explicitly loaded
and the result must be explicitly stored.

### Milestone 3 - SSA Based LLVM [Complete]

- Improvement on stack-based IR, where every result is treated
as a new value.
- Values no longer require explicit loads and stores.

### Milestone 4 - Basic Transformations [Complete]

- Implemented a set of basic transformations that improve 
the code generated. (Only works with SSA IR)
- Constant Propagation and Folding
- Aggressive Dead Code Elimination
- Redundant Phi Elimination

### Milestone 5 - Advanced Transformation [Complete]

- Implemented an optional transformation that inserts predicate
instructions in cases where they can remove unnecessary branches.

### Milestone 6 - ARM/Register Allocation [Complete]

- Translates the generate LLVM IR into Pseudo-ARM Assembly with
an infinite register space
- Maps the infinite register space to valid ARM registers, reserving
x19 and x20 for spilled values


## Building

I included a .jar file of the completed program in the 'build' directory.
The project can also be built from the included source files.


## Running the Compiler

The compiler can be run using the command shown below

```
java -jar MiniCompiler.jar <infile> [-validate] [-notrans] [-stack/-ssa] [-dot dot_file] [-llvm ll_file] [-arm arm_file]
```
- [-validate]: Runs only the static analysis functions

- [-notrans]: Disables transformations

- [-stack/-ssa]: Select between SSA and STACK IR/ARM (SSA by default)

- [-dot dot_file]: Generates a .dot file of the CFG

- [-llvm ll_file]: Generates a .ll file containing the expected IR 

- [-arm arm_file]: Generates a .s file containing the expected ARM Assembly


## My Testing Script

I included a testing script `demo.py` that will run the compiler on all the provided benchmarks and diff the outputs.

To run the script you will need to update the paths at the top of the file to include the location of the jar file,
test directory, instance of java, etc.
