{
  symlinkJoin,
  makeWrapper,
  todoist-electron,
}:

symlinkJoin {
  name = "todoist-${todoist-electron.version}";

  paths = [ todoist-electron ];

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    wrapProgram $out/bin/todoist-electron \
      --set __EGL_VENDOR_LIBRARY_FILENAMES /run/opengl-driver/share/glvnd/egl_vendor.d/10_nvidia.json \
      --set __GLX_VENDOR_LIBRARY_NAME nvidia \
      --set ELECTRON_EXTRA_LAUNCH_ARGS --password-store=gnome-libsecret
  '';
}
