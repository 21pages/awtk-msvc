#设置demo目录
set(APP_ROOT ${TK_ROOT}/../awtk-terminal)
set(MASTER_ROOT ${TK_ROOT}/../../698Master)
# 输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${APP_ROOT}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${APP_ROOT}/bin)
#添加app源文件
set(APP_SOURCE_FILES "")
file(GLOB APP_SOURCE_FILES
    ${APP_ROOT}/src/widget/*.c
    ${APP_ROOT}/src/io/*.c
    ${APP_ROOT}/src/protocol/*.c
	${APP_ROOT}/src/tool/*.c
)
#添加app头文件
set(APP_CPPPATH 
    ${APP_ROOT}/src/widget
    ${APP_ROOT}/src/io
    ${APP_ROOT}/src/protocol
	${APP_ROOT}/src/tool
	${APP_ROOT}/3rd/mosquitto
	${APP_ROOT}/3rd/pthread/common
)

if (CMAKE_SYSTEM_NAME MATCHES "Windows")
    set(APP_CPPPATH 
    ${APP_CPPPATH}
	${APP_ROOT}/3rd/pthread
	)
	set(COMMON_CCFLAGS " ${COMMON_CCFLAGS} -DHAVE_STRUCT_TIMESPEC ")
endif()



set(PRJ awtk-terminal)
add_executable(${PRJ} "")
target_sources(${PRJ} PRIVATE ${APP_SOURCE_FILES})
set_target_properties(${PRJ} PROPERTIES FOLDER "app")
set_target_properties(${PRJ} PROPERTIES  LINK_FLAGS ${OS_SUBSYSTEM_WINDOWS})

# 引用目录
target_include_directories(${PRJ} PRIVATE ${CPPPATH} ${APP_CPPPATH})

#库路径
target_link_directories(${PRJ} PRIVATE ${TK_ROOT}/lib 
									   ${APP_ROOT}/lib 
									   ${MASTER_ROOT}/libs
									   ${MASTER_ROOT}/protocol/Debug
									   ${MASTER_ROOT}/apps/DF62XX/Debug
									   )


# 引用库
target_link_libraries(${PRJ} PRIVATE awtk mosquitto VCLib Flats protocol DF62XX nafxcwd)
