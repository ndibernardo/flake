{ lib }:
let
  lockCommand = "swaylock -f --screenshots --effect-blur 7x5 --effect-vignette 0.5:0.5 --clock --indicator --indicator-radius 120 --indicator-thickness 10 --ring-color 4f5459 --ring-ver-color 3584e4 --ring-wrong-color bf616a --key-hl-color 3584e4 --text-color ffffff --inside-color 00000088";
  screenshotCommand = "sh -c 'grim -g \"$(slurp)\" -t png'";

  sections =
    entries:
    let
      sorted = lib.sort (
        a: b:
        if a.section != b.section then
          a.section < b.section
        else if a.order != b.order then
          a.order < b.order
        else
          a.label < b.label
      ) entries;
      ids = lib.unique (map (entry: entry.section) sorted);
    in
    map (id: builtins.filter (entry: entry.section == id) sorted) ids;

  menuItem =
    {
      label,
      icon,
      command,
      ...
    }:
    let
      iconAttribute = lib.optionalString (icon != "") " icon=\"${lib.escapeXML icon}\"";
    in
    ''
      <item label="${lib.escapeXML label}"${iconAttribute}>
        <action name="Execute"><command>${lib.escapeXML command}</command></action>
      </item>'';

  tail = ''
    <item label="Screenshot Area">
      <action name="Execute"><command>${lib.escapeXML screenshotCommand}</command></action>
    </item>
    <separator/>
    <item label="Lock Screen">
      <action name="Execute"><command>${lib.escapeXML lockCommand}</command></action>
    </item>
    <separator/>
    <item label="Reload Configuration">
      <action name="Reconfigure"/>
    </item>
    <item label="Logout">
      <action name="Exit"/>
    </item>
    <separator/>
    <item label="Reboot">
      <action name="Execute"><command>systemctl reboot</command></action>
    </item>
    <item label="Shutdown">
      <action name="Execute"><command>systemctl poweroff</command></action>
    </item>'';
in
entries:
let
  groups = map (group: builtins.concatStringsSep "\n" (map menuItem group)) (sections entries);
  body = builtins.concatStringsSep "\n<separator/>\n" (groups ++ [ tail ]);
in
''
  <?xml version="1.0" encoding="UTF-8"?>
  <openbox_menu>
    <menu id="root-menu" label="Root menu">
  ${lib.concatMapStringsSep "\n" (line: lib.optionalString (line != "") "    ${line}") (
    lib.splitString "\n" body
  )}
    </menu>
  </openbox_menu>
''
