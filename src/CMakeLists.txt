add_library(wavfile STATIC
        wavfile.c
)

set_target_properties(wavfile PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}
)

install(FILES wavfile.h
        DESTINATION include
)

add_executable(example
        example.c
)

target_link_libraries(example
        wavfile
)

install(TARGETS wavfile example
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        PUBLIC_HEADER DESTINATION include
)

