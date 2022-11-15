function BuildForWindows($platform, $build_type) {
    $build_dir = "build"
    mkdir $build_dir -Force -ErrorAction Stop | Out-Null
    cd $build_dir
    ls

    if ($platform -eq "x64") {
        $msbuild_platform = "x64"
    }
    else {
        $msbuild_platform = "x86"
    }


    cmake -G "MinGW Makefiles" `
    -A $msbuild_platform `
    -D CMAKE_BUILD_TYPE=${build_type} `
    -D CMAKE_INSTALL_PREFIX=install ../libuv

    mingw32-make -j 4
    mingw32-make install
    ls
    cd ..
}
