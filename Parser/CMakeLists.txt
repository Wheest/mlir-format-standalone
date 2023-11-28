add_mlir_library(MLIRFormatParser
  Parser.cpp

  ADDITIONAL_HEADER_DIRS
  #${MLIR_MAIN_INCLUDE_DIR}/mlir/Parser

  LINK_LIBS PUBLIC
  MLIRAsmParser
  MLIRBytecodeReader
  MLIRIR
  )
