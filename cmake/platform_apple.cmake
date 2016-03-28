if (APPLE)
    set(MACOSX_TRANSLATION_LIST English zh_TW)

    set(MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_NAME})
    set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
    set(MACOSX_BUNDLE_LONG_VERSION_STRING ${PROJECT_VERSION})
    set(MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
    set(MACOSX_BUNDLE_COPYRIGHT ${COPYRIGHT})
    set(MACOSX_BUNDLE_GUI_IDENTIFIER ${IDENTIFIER})
    set(MACOSX_BUNDLE_ICON_FILE "chewing-editor")

    foreach(MACOSX_TRANSLATION ${MACOSX_TRANSLATION_LIST})
        file(GLOB translation_files
            ${PROJECT_SOURCE_DIR}/rc/macosx/${MACOSX_TRANSLATION}.lproj/*
        )
        set_source_files_properties(${translation_files} PROPERTIES MACOSX_PACKAGE_LOCATION Resources/${MACOSX_TRANSLATION}.lproj)
        list(APPEND MACOSX_TRANSLATION_FILES ${translation_files})
    endforeach()

    set_source_files_properties(${PROJECT_SOURCE_DIR}/rc/chewing-editor.icns PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
    set(MACOSX_APP MACOSX_BUNDLE "${PROJECT_SOURCE_DIR}/rc/chewing-editor.icns" ${MACOSX_TRANSLATION_FILES})
endif()
