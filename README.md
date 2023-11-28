# An out-of-tree MLIR dialect

This is an example of an out-of-tree [MLIR](https://mlir.llvm.org/) dialect along with a standalone `opt`-like tool to operate on that dialect.
This system is built from LLVM `42204c94ba9f`

## Building - Component Build

This setup assumes that you have built LLVM and MLIR in `$BUILD_DIR` and installed them to `$PREFIX`. To build and launch the tests, run
```sh
mkdir build && cd build
cmake -G Ninja .. -DMLIR_DIR=$PREFIX/lib/cmake/mlir -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit
cmake --build . --target check-standalone
```
To build the documentation from the TableGen description of the dialect operations, run
```sh
cmake --build . --target mlir-doc
```
**Note**: Make sure to pass `-DLLVM_INSTALL_UTILS=ON` when building LLVM with CMake in order to install `FileCheck` to the chosen installation prefix.

## Building - Monolithic Build

This setup assumes that you build the project as part of a monolithic LLVM build via the `LLVM_EXTERNAL_PROJECTS` mechanism.
To build LLVM, MLIR, the example and launch the tests run
```sh
mkdir build && cd build
cmake -G Ninja `$LLVM_SRC_DIR/llvm` \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD=host \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_EXTERNAL_PROJECTS=standalone-dialect -DLLVM_EXTERNAL_STANDALONE_DIALECT_SOURCE_DIR=../
cmake --build . --target check-standalone
```
Here, `$LLVM_SRC_DIR` needs to point to the root of the monorepo.

## Building - custom

This setup assumes that you have built LLVM and MLIR in `$LLVM_BUILD_DIR` and installed them to `$LLVM_INSTALL_PREFIX`. To build, run
```sh
mkdir build && cd build
cmake -G Ninja .. -DMLIR_DIR=$LLVM_INSTALL_PREFIX/lib/cmake/mlir -DLLVM_EXTERNAL_LIT=$LLVM_BUILD_DIR/bin/llvm-lit
cmake --build .
```

**Note**: Make sure to pass `-DLLVM_INSTALL_UTILS=ON` when building LLVM with CMake in order to install `FileCheck` to the chosen installation prefix.

## Usage

The purpose of this repo is to auto-format MLIR files without changing variable names or removing comments.
There is an example poorly formatted MLIR file `sample_gemm.mlir`.
When the repo is compiled, you can try running the tool against that file:

``` sh
MLIR_FILE=${PWD}/sample_gemm.mlir
./build/bin/standalone-opt $MLIR_FILE
```
