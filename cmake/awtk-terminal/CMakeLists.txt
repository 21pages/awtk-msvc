#设置demo目录
set(DEMOPATH ${TK_ROOT}/../awtk-terminal)
# 输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${DEMOPATH}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${DEMOPATH}/bin)

set(PRJ awtk-terminal)
add_executable(${PRJ} "")
target_sources(${PRJ} PRIVATE ${DEMOPATH}/src/widget/main.c ${DEMOPATH}/src/widget/awtk_main.c)
set_target_properties(${PRJ} PROPERTIES FOLDER "app")
set_target_properties(${PRJ} PROPERTIES  LINK_FLAGS ${OS_SUBSYSTEM_WINDOWS})

# 引用目录
target_include_directories(${PRJ} PRIVATE ${CPPPATH} ${DEMOPATH}/3rd/mosquitto ${DEMOPATH}/3rd/pthread ${DEMOPATH}/3rd/pthread/common)



# 引用库
target_link_libraries(${PRJ} PRIVATE awtk)
