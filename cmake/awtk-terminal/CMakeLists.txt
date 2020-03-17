#设置demo目录
set(DEMOPATH ${TK_ROOT}/../awtk-terminal)
# 输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${DEMOPATH}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${DEMOPATH}/bin)

function(include_sub_directories_recursively root_dir)
    if (IS_DIRECTORY ${root_dir})               # 当前路径是一个目录吗，是的话就加入到包含目录
        message("include dir: " ${root_dir})
        include_directories(${root_dir})
    endif()

    file(GLOB ALL_SUB RELATIVE ${root_dir} ${root_dir}/*) # 获得当前目录下的所有文件，让如ALL_SUB列表中
    foreach(sub ${ALL_SUB})
        if (IS_DIRECTORY ${root_dir}/${sub})
            include_sub_directories_recursively(${root_dir}/${sub}) # 对子目录递归调用，包含
        endif()
    endforeach()
endfunction()
#添加头文件
include_sub_directories_recursively(${DEMOPATH}/3rd) # 对子目录递归调用，包含
include_sub_directories_recursively(${DEMOPATH}/src)

#添加源文件
FILE(GLOB_RECURSE SOURCE_FILES ${DEMOPATH}/src/*.c  ${DEMOPATH}/src/*.cpp)
#message(${SOURCE_FILES})


set(PRJ awtk-terminal)
add_executable(${PRJ} "")
target_sources(${PRJ} PRIVATE ${SOURCE_FILES})
set_target_properties(${PRJ} PROPERTIES FOLDER "app")
set_target_properties(${PRJ} PROPERTIES  LINK_FLAGS ${OS_SUBSYSTEM_WINDOWS})

# 引用目录
target_include_directories(${PRJ} PRIVATE ${CPPPATH} ) #${DEMOPATH}/3rd/mosquitto ${DEMOPATH}/3rd/pthread ${DEMOPATH}/3rd/pthread/common

#动态库路径
target_link_directories(${PRJ} PRIVATE ${DEMOPATH}/lib) #添加动态连接库的路径

# 引用库
target_link_libraries(${PRJ} PRIVATE awtk mosquitto)
