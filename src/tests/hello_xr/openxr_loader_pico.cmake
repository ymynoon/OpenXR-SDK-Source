include(FetchContent)

FetchContent_Declare(
    oxr_repo
    ## source url https://maven.byted.org/repository/android_public/com/bytedance/openxr/loader/1.0.4.ForUnitySDK/
    URL https://tosv.byted.org/obj/pico-streaming-service/thirdparty/OpenXR_loader/OpenXR_loader_202407261056.zip
)

FetchContent_GetProperties(oxr_repo)
if (NOT oxr_repo_POPULATED)
    message(STATUS "sync openxr_loader repo start")
    FetchContent_Populate(oxr_repo)
    message(STATUS "sync openxr_loader repo complete")

    add_library(openxr_loader_pico SHARED IMPORTED GLOBAL)
    set_target_properties(
            openxr_loader_pico
        PROPERTIES
        IMPORTED_LOCATION ${oxr_repo_SOURCE_DIR}/libs/${ANDROID_ABI}/libpico_openxr_loader.so
    )

    target_include_directories(
            openxr_loader_pico
        INTERFACE ${oxr_repo_SOURCE_DIR}/include/loader
    )

endif ()
