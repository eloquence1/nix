# Declarative Plasma 6 configuration, shared by every host that imports
# modules/desktop.nix. Generated with `nix run github:nix-community/plasma-manager`
# (rc2nix), then curated by hand.
#
# Deliberately NOT captured here, and not to be re-added by a raw rc2nix dump:
#   * filesystem paths and recent-file lists (wallpaper history, Kate session,
#     pinned documents, trash paths)
#   * per-machine UUIDs (activities, virtual-desktop Ids, kwin tiling layouts —
#     these are keyed by this machine's display, so they cannot transfer anyway)
#   * hardware identifiers (touchpad device IDs, audio device serials)
#   * transient state (baloo db version, "first use" and "seen" flags, timestamps)
#
# Re-running rc2nix will reintroduce all of the above. Diff before pasting.
{
  programs.plasma = {
    enable = true;

    # One bottom panel, transcribed from plasma-org.kde.plasma.desktop-appletsrc
    # (Containments/2). Widget order follows its AppletOrder=3;5;4;6;7;19;20.
    # height 44 is Plasma's default, which is what the source config was using.
    panels = [
      {
        location = "bottom";
        height = 44;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config.General = {
              icon = "bluefish";
              systemFavorites = "suspend,hibernate,reboot,shutdown";
            };
          }
          {
            name = "org.kde.plasma.icontasks";
            config.General.launchers =
              "preferred://filemanager,applications:firefox.desktop,"
              + "applications:kitty.desktop,applications:org.keepassxc.KeePassXC.desktop,"
              + "applications:spotify.desktop,applications:vlc.desktop,"
              + "applications:gimp.desktop,applications:org.kde.krita.desktop,"
              + "applications:codium.desktop,applications:org.kde.kate.desktop,"
              + "applications:org.kde.kinfocenter.desktop,applications:systemsettings.desktop,"
              + "applications:org.godotengine.Godot4.7.desktop";
          }
          "org.kde.plasma.pager"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemtray";
            config.General.extraItems =
              "org.kde.plasma.cameraindicator,org.kde.plasma.mediacontroller,"
              + "org.kde.plasma.devicenotifier,org.kde.plasma.manage-inputmethod,"
              + "org.kde.plasma.notifications,org.kde.plasma.clipboard,"
              + "org.kde.plasma.volume,org.kde.plasma.keyboardindicator,"
              + "org.kde.plasma.networkmanagement,org.kde.kscreen,"
              + "org.kde.plasma.keyboardlayout,org.kde.plasma.weather,"
              + "org.kde.plasma.battery,org.kde.plasma.bluetooth,"
              + "org.kde.plasma.brightness,org.kde.plasma.vault";
          }
          {
            name = "org.kde.plasma.digitalclock";
            config.Appearance = {
              autoFontAndSize = false;
              fontFamily = "JetBrains Mono";
              fontSize = 7;
              fontStyleName = "Regular";
              fontWeight = 400;
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    # Declaring panels makes plasma-manager delete plasma-org.kde.plasma.desktop-appletsrc
    # at every login and rebuild it from this file. That file also holds the *desktop*
    # containment, so this clock has to be declared here or it would simply disappear.
    # Geometry is from the source config's ItemGeometries at 1920x1080.
    desktop.widgets = [
      {
        name = "org.kde.plasma.digitalclock";
        position = {
          horizontal = 1648;
          vertical = 32;
        };
        size = {
          width = 240;
          height = 160;
        };
        config.Appearance = {
          autoFontAndSize = false;
          fontFamily = "JetBrainsMono Nerd Font Mono";
          fontSize = 18;
          fontStyleName = "Regular";
          fontWeight = 400;
        };
      }
    ];

    shortcuts = {
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      kmix.decrease_microphone_volume = "Microphone Volume Down";
      kmix.decrease_volume = "Volume Down";
      kmix.decrease_volume_small = "Shift+Volume Down";
      kmix.increase_microphone_volume = "Microphone Volume Up";
      kmix.increase_volume = "Volume Up";
      kmix.increase_volume_small = "Shift+Volume Up";
      kmix.mic_mute = ["Microphone Mute" "Meta+Volume Mute"];
      kmix.mute = "Volume Mute";
      kmix.push_to_talk = [ ];
      ksmserver."Halt Without Confirmation" = [ ];
      ksmserver."Lock Session" = ["Screensaver" "Meta+L"];
      ksmserver."Log Out" = "Ctrl+Alt+Del";
      ksmserver."Log Out Without Confirmation" = [ ];
      ksmserver.LogOut = [ ];
      ksmserver.Reboot = [ ];
      ksmserver."Reboot Without Confirmation" = [ ];
      ksmserver."Shut Down" = [ ];
      kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      kwin.Cube = "Meta+C";
      kwin."Cycle Overview" = [ ];
      kwin."Cycle Overview Opposite" = [ ];
      kwin."Decrease Opacity" = [ ];
      kwin."Edit Tiles" = "Meta+T";
      kwin.Expose = ["Ctrl+F9" "Meta+F9"];
      kwin.ExposeAll = ["Launch (C)" "Ctrl+F10" "Meta+F10"];
      kwin.ExposeClass = ["Ctrl+F7" "Meta+F7"];
      kwin.ExposeClassCurrentDesktop = [ ];
      kwin."Grid View" = "Meta+G";
      kwin."Increase Opacity" = [ ];
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin."Move Tablet to Next LogicalOutput" = [ ];
      kwin.MoveMouseToCenter = "Meta+F6";
      kwin.MoveMouseToFocus = "Meta+F5";
      kwin.MoveZoomDown = [ ];
      kwin.MoveZoomLeft = [ ];
      kwin.MoveZoomRight = [ ];
      kwin.MoveZoomUp = [ ];
      kwin.Overview = "Meta+W";
      kwin."Setup Window Shortcut" = [ ];
      kwin."Show Desktop" = "Meta+D";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch to Desktop 1" = ["Ctrl+F1" "Alt+1" "Meta+F1"];
      kwin."Switch to Desktop 10" = [ ];
      kwin."Switch to Desktop 11" = [ ];
      kwin."Switch to Desktop 12" = [ ];
      kwin."Switch to Desktop 13" = [ ];
      kwin."Switch to Desktop 14" = [ ];
      kwin."Switch to Desktop 15" = [ ];
      kwin."Switch to Desktop 16" = [ ];
      kwin."Switch to Desktop 17" = [ ];
      kwin."Switch to Desktop 18" = [ ];
      kwin."Switch to Desktop 19" = [ ];
      kwin."Switch to Desktop 2" = ["Ctrl+F2" "Alt+2" "Meta+F2"];
      kwin."Switch to Desktop 20" = [ ];
      kwin."Switch to Desktop 21" = [ ];
      kwin."Switch to Desktop 22" = [ ];
      kwin."Switch to Desktop 23" = [ ];
      kwin."Switch to Desktop 24" = [ ];
      kwin."Switch to Desktop 25" = [ ];
      kwin."Switch to Desktop 3" = ["Ctrl+F3" "Alt+3" "Meta+F3"];
      kwin."Switch to Desktop 4" = ["Ctrl+F4" "Alt+4" "Meta+F4"];
      kwin."Switch to Desktop 5" = [ ];
      kwin."Switch to Desktop 6" = [ ];
      kwin."Switch to Desktop 7" = [ ];
      kwin."Switch to Desktop 8" = [ ];
      kwin."Switch to Desktop 9" = [ ];
      kwin."Switch to Next Desktop" = [ ];
      kwin."Switch to Next Screen" = [ ];
      kwin."Switch to Previous Desktop" = [ ];
      kwin."Switch to Previous Screen" = [ ];
      kwin."Switch to Screen 0" = [ ];
      kwin."Switch to Screen 1" = [ ];
      kwin."Switch to Screen 2" = [ ];
      kwin."Switch to Screen 3" = [ ];
      kwin."Switch to Screen 4" = [ ];
      kwin."Switch to Screen 5" = [ ];
      kwin."Switch to Screen 6" = [ ];
      kwin."Switch to Screen 7" = [ ];
      kwin."Switch to Screen Above" = [ ];
      kwin."Switch to Screen Below" = [ ];
      kwin."Switch to Screen to the Left" = [ ];
      kwin."Switch to Screen to the Right" = [ ];
      kwin."Toggle Night Color" = [ ];
      kwin."Toggle Window Raise/Lower" = [ ];
      kwin."Walk Through Windows" = ["Alt+Tab" "Meta+Tab"];
      kwin."Walk Through Windows (Reverse)" = ["Alt+Shift+Tab" "Meta+Shift+Tab"];
      kwin."Walk Through Windows Alternative" = [ ];
      kwin."Walk Through Windows Alternative (Reverse)" = [ ];
      kwin."Walk Through Windows of Current Application" = ["Alt+`" "Meta+`"];
      kwin."Walk Through Windows of Current Application (Reverse)" = ["Alt+~" "Meta+~"];
      kwin."Walk Through Windows of Current Application Alternative" = [ ];
      kwin."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
      kwin."Window Above Other Windows" = [ ];
      kwin."Window Below Other Windows" = [ ];
      kwin."Window Close" = ["Alt+Q" "Alt+F4"];
      kwin."Window Custom Quick Tile Bottom" = [ ];
      kwin."Window Custom Quick Tile Left" = [ ];
      kwin."Window Custom Quick Tile Right" = [ ];
      kwin."Window Custom Quick Tile Top" = [ ];
      kwin."Window Fullscreen" = [ ];
      kwin."Window Grow Horizontal" = [ ];
      kwin."Window Grow Vertical" = [ ];
      kwin."Window Lower" = [ ];
      kwin."Window Maximize" = "Meta+PgUp";
      kwin."Window Maximize Horizontal" = [ ];
      kwin."Window Maximize Vertical" = [ ];
      kwin."Window Minimize" = "Meta+PgDown";
      kwin."Window Move" = [ ];
      kwin."Window Move Center" = [ ];
      kwin."Window No Border" = [ ];
      kwin."Window On All Desktops" = [ ];
      kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      kwin."Window One Screen Down" = [ ];
      kwin."Window One Screen Up" = [ ];
      kwin."Window One Screen to the Left" = [ ];
      kwin."Window One Screen to the Right" = [ ];
      kwin."Window Operations Menu" = "Alt+F3";
      kwin."Window Pack Down" = [ ];
      kwin."Window Pack Left" = [ ];
      kwin."Window Pack Right" = [ ];
      kwin."Window Pack Up" = [ ];
      kwin."Window Quick Tile Bottom" = "Meta+Down";
      kwin."Window Quick Tile Bottom Left" = [ ];
      kwin."Window Quick Tile Bottom Right" = [ ];
      kwin."Window Quick Tile Left" = "Meta+Left";
      kwin."Window Quick Tile Right" = "Meta+Right";
      kwin."Window Quick Tile Top" = "Meta+Up";
      kwin."Window Quick Tile Top Left" = [ ];
      kwin."Window Quick Tile Top Right" = [ ];
      kwin."Window Raise" = [ ];
      kwin."Window Resize" = [ ];
      kwin."Window Restore" = "Meta+Backspace";
      kwin."Window Shrink Horizontal" = [ ];
      kwin."Window Shrink Vertical" = [ ];
      kwin."Window to Desktop 1" = [ ];
      kwin."Window to Desktop 10" = [ ];
      kwin."Window to Desktop 11" = [ ];
      kwin."Window to Desktop 12" = [ ];
      kwin."Window to Desktop 13" = [ ];
      kwin."Window to Desktop 14" = [ ];
      kwin."Window to Desktop 15" = [ ];
      kwin."Window to Desktop 16" = [ ];
      kwin."Window to Desktop 17" = [ ];
      kwin."Window to Desktop 18" = [ ];
      kwin."Window to Desktop 19" = [ ];
      kwin."Window to Desktop 2" = [ ];
      kwin."Window to Desktop 20" = [ ];
      kwin."Window to Desktop 21" = [ ];
      kwin."Window to Desktop 22" = [ ];
      kwin."Window to Desktop 23" = [ ];
      kwin."Window to Desktop 24" = [ ];
      kwin."Window to Desktop 25" = [ ];
      kwin."Window to Desktop 3" = [ ];
      kwin."Window to Desktop 4" = [ ];
      kwin."Window to Desktop 5" = [ ];
      kwin."Window to Desktop 6" = [ ];
      kwin."Window to Desktop 7" = [ ];
      kwin."Window to Desktop 8" = [ ];
      kwin."Window to Desktop 9" = [ ];
      kwin."Window to Next Desktop" = [ ];
      kwin."Window to Next Screen" = "Meta+Shift+Right";
      kwin."Window to Previous Desktop" = [ ];
      kwin."Window to Previous Screen" = "Meta+Shift+Left";
      kwin."Window to Screen 0" = [ ];
      kwin."Window to Screen 1" = [ ];
      kwin."Window to Screen 2" = [ ];
      kwin."Window to Screen 3" = [ ];
      kwin."Window to Screen 4" = [ ];
      kwin."Window to Screen 5" = [ ];
      kwin."Window to Screen 6" = [ ];
      kwin."Window to Screen 7" = [ ];
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.view_actual_size = "Meta+0";
      kwin.view_zoom_in = ["Meta++" "Meta+="];
      kwin.view_zoom_out = "Meta+-";
      mediacontrol.mediavolumedown = [ ];
      mediacontrol.mediavolumeup = [ ];
      mediacontrol.nextmedia = "Media Next";
      mediacontrol.pausemedia = "Media Pause";
      mediacontrol.playmedia = [ ];
      mediacontrol.playpausemedia = "Media Play";
      mediacontrol.previousmedia = "Media Previous";
      mediacontrol.seekbackwardmedia = "Media Rewind";
      mediacontrol.seekbackwardmedialong = [ ];
      mediacontrol.seekforwardmedia = "Media Fast Forward";
      mediacontrol.seekforwardmedialong = [ ];
      mediacontrol.stopmedia = "Media Stop";
      org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      org_kde_powerdevil.Hibernate = "Hibernate";
      org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      org_kde_powerdevil.PowerDown = "Power Down";
      org_kde_powerdevil.PowerOff = "Power Off";
      org_kde_powerdevil.Sleep = "Sleep";
      org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      org_kde_powerdevil."Turn Off Screen" = [ ];
      org_kde_powerdevil.powerProfile = ["Battery" "Meta+B"];
      plasmashell."Slideshow Wallpaper Next Image" = [ ];
      plasmashell."activate application launcher" = ["Meta" "Alt+F1"];
      plasmashell."activate task manager entry 1" = "Meta+1";
      plasmashell."activate task manager entry 10" = [ ];
      plasmashell."activate task manager entry 2" = "Meta+2";
      plasmashell."activate task manager entry 3" = "Meta+3";
      plasmashell."activate task manager entry 4" = "Meta+4";
      plasmashell."activate task manager entry 5" = "Meta+5";
      plasmashell."activate task manager entry 6" = "Meta+6";
      plasmashell."activate task manager entry 7" = "Meta+7";
      plasmashell."activate task manager entry 8" = "Meta+8";
      plasmashell."activate task manager entry 9" = "Meta+9";
      plasmashell."clear history" = [ ];
      plasmashell.clear-history = [ ];
      plasmashell.clipboard_action = "Meta+Ctrl+X";
      plasmashell.cycle-panels = "Meta+Alt+P";
      plasmashell.cycleNextAction = [ ];
      plasmashell.cyclePrevAction = [ ];
      plasmashell.edit_clipboard = [ ];
      plasmashell."manage activities" = "Meta+Q";
      plasmashell."next activity" = "Meta+A";
      plasmashell."previous activity" = "Meta+Shift+A";
      plasmashell.repeat_action = [ ];
      plasmashell."show dashboard" = "Ctrl+F12";
      plasmashell.show-barcode = [ ];
      plasmashell.show-on-mouse-pos = "Meta+V";
      plasmashell."switch to next activity" = [ ];
      plasmashell."switch to previous activity" = [ ];
      plasmashell."toggle do not disturb" = [ ];
      "services/kitty.desktop"._launch = "Alt+Return";
      "services/org.kde.spectacle.desktop".CurrentMonitorScreenShot = [ ];
      "services/org.kde.spectacle.desktop".OpenWithoutScreenshot = [ ];
    };
    configFile = {
      dolphinrc.General.RememberOpenedTabs = false;
      dolphinrc.General.ShowFullPathInTitlebar = true;
      dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
      dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 22;
      dolphinrc."Notification Messages".warnAboutRisksBeforeActingAsAdmin = false;
      dolphinrc.PreviewSettings.Plugins = "appimagethumbnail,audiothumbnail,blenderthumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
      katerc.General."Days Meta Infos" = 30;
      katerc.General."Save Meta Infos" = true;
      katerc.General."Show Full Path in Title" = false;
      katerc.General."Show Menu Bar" = true;
      katerc.General."Show Status Bar" = true;
      katerc.General."Show Tab Bar" = true;
      katerc.General."Show Url Nav Bar" = true;
      katerc.filetree.editShade = "110,80,65";
      katerc.filetree.listMode = false;
      katerc.filetree.middleClickToClose = false;
      katerc.filetree.shadingEnabled = true;
      katerc.filetree.showCloseButton = false;
      katerc.filetree.showFullPathOnRoots = false;
      katerc.filetree.showToolbar = true;
      katerc.filetree.sortRole = 0;
      katerc.filetree.viewShade = "98,68,134";
      kcminputrc.Mouse.cursorTheme = "catppuccin-mocha-dark-cursors";
      kdeglobals.General.XftAntialias = true;
      kdeglobals.General.XftHintStyle = "hintslight";
      kdeglobals.General.XftSubPixel = "none";
      kdeglobals.General.font = "Inter,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.menuFont = "Inter,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.smallestReadableFont = "Inter,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.toolBarFont = "Inter,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.KDE.AnimationDurationFactor = 0.5;
      kdeglobals.KDE.contrast = 4;
      kdeglobals.KDE.frameContrast = 0.2;
      kdeglobals."KFileDialog Settings"."Allow Expansion" = false;
      kdeglobals."KFileDialog Settings"."Automatically select filename extension" = true;
      kdeglobals."KFileDialog Settings"."Breadcrumb Navigation" = true;
      kdeglobals."KFileDialog Settings"."Decoration position" = 2;
      kdeglobals."KFileDialog Settings"."Show Full Path" = false;
      kdeglobals."KFileDialog Settings"."Show Inline Previews" = true;
      kdeglobals."KFileDialog Settings"."Show Preview" = false;
      kdeglobals."KFileDialog Settings"."Show Speedbar" = true;
      kdeglobals."KFileDialog Settings"."Show hidden files" = false;
      kdeglobals."KFileDialog Settings"."Sort by" = "Date";
      kdeglobals."KFileDialog Settings"."Sort directories first" = true;
      kdeglobals."KFileDialog Settings"."Sort hidden files last" = false;
      kdeglobals."KFileDialog Settings"."Sort reversed" = false;
      kdeglobals."KFileDialog Settings"."Speedbar Width" = 140;
      kdeglobals."KFileDialog Settings"."View Style" = "DetailTree";
      kdeglobals.PreviewSettings.EnableRemoteFolderThumbnail = true;
      kdeglobals.PreviewSettings.MaximumRemoteSize = 104857600;
      kdeglobals.Sounds.Enable = false;
      kdeglobals.WM.activeBackground = "30,30,46";
      kdeglobals.WM.activeBlend = "205,214,244";
      kdeglobals.WM.activeFont = "Inter,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.WM.activeForeground = "205,214,244";
      kdeglobals.WM.inactiveBackground = "17,17,27";
      kdeglobals.WM.inactiveBlend = "166,173,200";
      kdeglobals.WM.inactiveForeground = "166,173,200";
      kiorc.Confirmations.ConfirmDelete = false;
      kiorc.Confirmations.ConfirmEmptyTrash = false;
      kiorc.Confirmations.ConfirmTrash = false;
      kiorc."Executable scripts".behaviourOnLaunch = "alwaysAsk";
      klaunchrc.BusyCursorSettings.Bouncing = false;
      klaunchrc.FeedbackStyle.BusyCursor = false;
      krunnerrc.General.FreeFloating = true;
      kscreenlockerrc.Daemon.Autolock = false;
      kscreenlockerrc.Daemon.Timeout = 0;
      kwinrc.Desktops.Name_4 = "New Desktop";
      kwinrc.Desktops.Number = 4;
      kwinrc.Desktops.Rows = 1;
      kwinrc.Effect-blur.BlurStrength = 3;
      kwinrc.Effect-blur.NoiseStrength = 0;
      kwinrc.Effect-blur.Saturation = 100;
      kwinrc.Effect-overview.BorderActivate = 9;
      kwinrc.Effect-windowview.BorderActivateAll = 1;
      kwinrc.ElectricBorders.TopLeft = "ShowDesktop";
      kwinrc.NightColor.Active = true;
      kwinrc.NightColor.NightTemperature = 3200;
      kwinrc.Plugins.cubeEnabled = true;
      kwinrc.Plugins.diminactiveEnabled = true;
      kwinrc.Plugins.kwin4_effect_geometry_changeEnabled = true;
      kwinrc.Plugins.translucencyEnabled = true;
      kwinrc.Plugins.wobblywindowsEnabled = true;
      kwinrc.Windows.ElectricBorderCooldown = 200;
      kwinrc.Windows.ElectricBorderDelay = 25;
      kwinrc.Xwayland.Scale = 1;
      kwinrc."org.kde.kdecoration2".BorderSizeAuto = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "";
      kwinrc."org.kde.kdecoration2".theme = "Breeze";
      kwinrulesrc.General.rules = "";
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
      plasmaparc.General.GlobalMuteSources = true;
      spectaclerc.ImageSave.translatedScreenshotsFolder = "Screenshots";
      spectaclerc.VideoSave.translatedScreencastsFolder = "Screencasts";
    };
  };
}
