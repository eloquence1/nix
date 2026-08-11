# FHS environment for running ComfyUI from a normal Python venv.
#
# ComfyUI and its custom nodes pip-install prebuilt binary wheels (torch,
# opencv, onnxruntime, insightface, ...) that are linked against FHS paths.
# Those cannot run unmodified on NixOS. nix-ld covers simple cases, but the
# custom-node ecosystem pulls in enough native libraries that chasing them
# one at a time does not scale — so give them a real FHS tree instead.
#
# Usage:  run `comfy-env` to get a shell, then work inside it normally.
{ config, pkgs, lib, ... }:
let
  # Must line up with what torch was built against — torch's cpp_extension
  # hard-fails the build on a mismatch. Confirmed against the installed wheel:
  #   python -c "import torch; print(torch.version.cuda)"  ->  13.0
  # Re-check this after any torch upgrade.
  cudaPkgs = pkgs.cudaPackages_13_0;

  comfy-env = pkgs.buildFHSEnv {
    name = "comfy-env";

    targetPkgs =
      pkgs: with pkgs; [
        python313
        uv
        git
        git-lfs

        # C/C++ runtime the wheels link against
        stdenv.cc
        stdenv.cc.cc.lib
        zlib
        zstd
        openssl
        curl

        # CUDA toolchain — needed to *compile* extensions such as SageAttention.
        # The torch wheel bundles a CUDA runtime, but ships no nvcc.
        cudaPkgs.cudatoolkit
        ninja
        cmake

        # torch / opencv / onnxruntime native deps
        libGL
        libGLU
        glib
        ffmpeg
        libjpeg
        libpng
        freetype

        # GL/EGL — nodes_glsl and anything doing offscreen rendering
        libglvnd
        mesa
        libxkbcommon
        fontconfig
        dbus
        alsa-lib

        # X and XCB. opencv drags these in even headless, and the GLSL nodes
        # need libxcb.so.1. Kept deliberately broad: one missing .so here costs
        # a rebuild to discover, and they are small.
        # Top-level names — the `xorg.*` package set is deprecated in nixpkgs.
        libx11
        libxext
        libxrender
        libsm
        libice
        libxcb
        libxi
        libxrandr
        libxcursor
        libxinerama
        libxcomposite
        libxdamage
        libxfixes
        libxtst
        libxcb-util
        libxcb-image
        libxcb-keysyms
        libxcb-render-util
        libxcb-wm
        xcb-util-cursor
      ];

    profile = ''
      # libcuda.so.1 ships with the NVIDIA driver, not with the torch wheel.
      # On NixOS the driver libraries live here, outside the Nix store.
      export LD_LIBRARY_PATH=/run/opengl-driver/lib:''${LD_LIBRARY_PATH:-}

      # buildFHSEnv symlinks targetPkgs into /usr, so the toolkit's
      # bin/include/lib land where a normal CUDA build expects them.
      export CUDA_HOME=/usr
      export CUDA_PATH=/usr
    '';

    runScript = "bash";
  };
in
{
  environment.systemPackages = [ comfy-env ];
}
