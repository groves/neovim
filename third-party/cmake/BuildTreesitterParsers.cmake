ExternalProject_Add(treesitter-c
PREFIX ${DEPS_BUILD_DIR}
URL ${TREESITTER_C_URL}
DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}/treesitter-c
DOWNLOAD_COMMAND ${CMAKE_COMMAND}
  -DPREFIX=${DEPS_BUILD_DIR}
  -DDOWNLOAD_DIR=${DEPS_DOWNLOAD_DIR}/treesitter-c
  -DURL=${TREESITTER_C_URL}
  -DEXPECTED_SHA256=${TREESITTER_C_SHA256}
  -DTARGET=treesitter-c
  -DUSE_EXISTING_SRC_DIR=${USE_EXISTING_SRC_DIR}
  -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/DownloadAndExtractFile.cmake
PATCH_COMMAND ${CMAKE_COMMAND} -E copy
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/TreesitterParserCMakeLists.txt
        ${DEPS_BUILD_DIR}/src/treesitter-c/CMakeLists.txt
CMAKE_ARGS
  -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
  -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
  -DCMAKE_GENERATOR=${CMAKE_GENERATOR}
  -DCMAKE_GENERATOR_PLATFORM=${CMAKE_GENERATOR_PLATFORM}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_DIR}
  # Pass toolchain
  -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
  -DPARSERLANG=c

BUILD_COMMAND ${CMAKE_COMMAND} --build . --config ${CMAKE_BUILD_TYPE}
INSTALL_COMMAND ${CMAKE_COMMAND} --build . --target install --config ${CMAKE_BUILD_TYPE})
