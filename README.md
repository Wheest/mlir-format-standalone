<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Wheest/mlir-format-standalone">
    <img src="logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">mlir-format standalone</h3>

  <p align="center">
    The standalone development version of mlir-format
  </p>
</div>



This system is built from LLVM `42204c94ba9f`, based on the `standalone-mlir` system.

## Building

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

## Roadmap

You can find the discussion around this system [on the LLVM forums](https://discourse.llvm.org/t/clang-format-or-some-other-auto-format-for-mlir-files/75258/4).

The idea with this project is to use `mlir-opt` as the formatter.
However it has a few features that we will need to remove or tweak to get a PoC.
- keep the original variable names
- keep the comments
- not wrap the MLIR code in a module
Arguably these features are handy for other usecases too (as optional config flags)
