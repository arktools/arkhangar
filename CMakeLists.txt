project (arkhangar)

# Requried cmake version
cmake_minimum_required (VERSION 2.8.2)
set(APPLICATION_VERSION_MAJOR "0")
set(APPLICATION_VERSION_MINO "1")
set(APPLICATION_VERSION_PATCH "0")
set(LIBRARY_SOVERSION "0.0.0")
set(PROJECT_CONTACT_EMAIL james.goppert@gmail.com)
set(PROJECT_CONTACT_VENDOR arkTools)

# modules
set(CMAKE_MODULE_PATH
	${CMAKE_SOURCE_DIR}/cmake
	${CMAKE_SOURCE_DIR}/cmake/arkcmake
)

# use common setup
include(CommonSetup)
set(LIBRARY_VERSION ${APPLICATION_VERSION})

# cpack
if(WIN32)
    add_definitions(-D_WIN32_WINNT=0x0501) # target xp
	set(CPACK_GENERATOR "NSIS")
	set(CPACK_SOURCE_GENERATOR "ZIP")
    set(CMAKE_INSTALL_PREFIX "/usr/local")
    # There is a bug in NSI that does not handle full unix paths properly. Make
    # sure there is at least one set of four (4) backlasshes.
    #set(CPACK_PACKAGE_ICON "${CMake_SOURCE_DIR}/Utilities/Release\\\\InstallIcon.bmp")
    #set(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\arkhangar.exe")
    set(CPACK_NSIS_DISPLAY_NAME "${PROJECT_NAME}-${APPLICATION_VERSION}")
    set(CPACK_NSIS_HELP_LINK "http:\\\\\\\\github.com/arktools/arkhangar")
    set(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\github.com/arktools/arkhangar")
    set(CPACK_NSIS_CONTACT ${PROJECT_CONTACT_EMAIL})
    set(CPACK_NSIS_MODIFY_PATH ON)
else()
    #set(CPACK_STRIP_FILES "bin/ins")
    #set(CPACK_SOURCE_STRIP_FILES "")
    if(APPLE)
        set(CPACK_GENERATOR "PackageMaker")
        set(CPACK_SOURCE_GENERATOR "TGZ")
            elseif(UNIX)
        set(CPACK_GENERATOR "DEB")
        set(CPACK_SOURCE_GENERATOR "ZIP")
    else()
        message(FATAL_ERROR "unknown operating system")
    endif()
endif()
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "arkTools aircraft hangar")
set(CPACK_PACKAGE_VENDOR ${PROJECT_VENDOR})
set(CPACK_PACKAGE_CONTACT ${PROJECT_CONTACT_EMAIL})
set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING")
set(CPACK_PACKAGE_VERSION_MAJOR "${APPLICATION_VERSION_MAJOR}") 
set(CPACK_PACKAGE_VERSION_MINOR "${APPLICATION_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${APPLICATION_VERSION_PATCH}")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME}-${APPLICATION_VERSION}")
set(CPACK_SET_DESTDIR TRUE)
set(CPACK_SOURCE_IGNORE_FILES ${CPACK_SOURCE_IGNORE_FILES}
	/.git/;/build/;~$;.*\\\\.bin$;.*\\\\.swp$)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/COPYING")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README")
set(CPACK_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")
#set(CPACK_PACKAGE_EXECUTABLES "MyExecutable" "My Executable")
include(CPack)

# install files
install(DIRECTORY aircraft/ DESTINATION share/${PROJECT_NAME}/aircraft)
install(DIRECTORY analysis/ DESTINATION share/${PROJECT_NAME}/analysis)
install(DIRECTORY scripts/ DESTINATION share/${PROJECT_NAME}/scripts)

# pkgconfig
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc)
install(FILES
    ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.pc
    DESTINATION lib/pkgconfig
    )

# vim:sw=4:ts=4:expandtab
