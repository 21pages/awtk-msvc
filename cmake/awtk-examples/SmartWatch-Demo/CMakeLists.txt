#设置demo目录
set(DEMOPATH ${TK_EXAMPLE_DIR}/SmartWatch-Demo)
# 输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${DEMOPATH}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${DEMOPATH}/bin)

set(PRJ SmartWatch-Demo)
set(SRC ${DEMOPATH}/src)
file(GLOB SOURCE_FILES 
    ${SRC}/*.c
    ${SRC}/watch/*.c
    ${SRC}/custom_widgets/*.c
    ${SRC}/application/*.c
    ${SRC}/slide_appliction/*.c
    ${SRC}/common/*.c
)

add_executable(${PRJ} ${SOURCE_FILES})
set_target_properties(${PRJ} PROPERTIES FOLDER "examples")
set_target_properties(${PRJ} PROPERTIES  LINK_FLAGS ${OS_SUBSYSTEM_WINDOWS})

# 引用目录
target_include_directories(${PRJ} PRIVATE ${CPPPATH})

# 引用库
target_link_libraries(${PRJ} PRIVATE awtk)
