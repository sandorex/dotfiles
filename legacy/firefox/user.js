/**
   Settings for firefox
**/

/* theming */
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("devtools.theme", "dark");
user_pref("browser.tabs.extraDragSpace", false);

// NOTE that this can can make some website crash like facebook chat when pasting stuff
// context menu is unreadable in GTK unless this is set
// user_pref("widget.content.gtk-theme-override", "Adwaita:light");

/* other */
// enable use of stylesheets
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// disable middle mouse click scroll circle thingy
user_pref("general.autoScroll", false);

// execute after mouse button is released (otherwise its possible to press something by quickly tapping the right click)
user_pref("ui.context_menus.after_mouseup", true);

// disable cut / copy events
user_pref("dom.event.clipboardevents.enabled", false)

/* scrolling */
// enable physics
user_pref("general.smoothScroll.msdPhysics.enabled", true)

// mousewheel
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 150);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 100);
user_pref("mousewheel.acceleration.factor", 4);
user_pref("mousewheel.acceleration.start", 5);
user_pref("mousewheel.min_line_scroll_amount", 20);

// arrows
user_pref("general.smoothScroll.lines.durationMaxMS", 100);
user_pref("general.smoothScroll.lines.durationMinMS", 100);

// pgUp / pgDown
user_pref("general.smoothScroll.pages.durationMaxMS", 70);
user_pref("general.smoothScroll.pages.durationMinMS", 40);

/* rendering */
user_pref("media.hardware-video-decoding.force-enabled", true);
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.enabled", true);
user_pref("layers.omtp.enabled", true);
