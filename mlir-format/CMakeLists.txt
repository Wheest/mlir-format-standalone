add_mlir_library(MLIRFormatLib
  MlirOptMain.cpp

  ADDITIONAL_HEADER_DIRS
  #${MLIR_MAIN_INCLUDE_DIR}/mlir/Tools/mlir-opt

  LINK_LIBS PUBLIC
  MLIRBytecodeWriter
  MLIRDebug
  MLIRObservers
  MLIRPass
  # MLIRParser
  MLIRFormatParser
  MLIRPluginsLib
  MLIRSupport
  MLIRIRDL
  )
