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
      ids = lib.unique (map (e: e.section) sorted);
    in
    map (id: builtins.filter (e: e.section == id) sorted) ids;

  join = builtins.concatStringsSep;

  labwcItem =
    {
      label,
      icon,
      command,
      ...
    }:
    let
      iconAttr = lib.optionalString (icon != "") " icon=\"${lib.escapeXML icon}\"";
    in
    ''
      <item label="${lib.escapeXML label}"${iconAttr}>
        <action name="Execute"><command>${lib.escapeXML command}</command></action>
      </item>'';

  labwcMenu =
    entries:
    let
      groups = map (group: join "\n" (map labwcItem group)) (sections entries);
      body = join "\n<separator/>\n" (groups ++ [ labwcTail ]);
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
    '';

  labwcTail = ''
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

  quote = s: "\"${lib.escape [ "\\" "\"" ] s}\"";

  sfwbarItem =
    {
      label,
      icon,
      command,
      ...
    }:
    ''
      item {
        value = ${quote label};
      ${lib.optionalString (icon != "") "  icon = ${quote icon};\n"}  action = Exec(${quote command});
      }'';

  sfwbarMenu =
    entries:
    let
      groups = map (group: join "\n" (map sfwbarItem group)) (sections entries);
      body = join "\nseparator;\n" (groups ++ [ sfwbarTail ]);
    in
    ''
      #Api2

      menu("root") {
      ${lib.concatMapStringsSep "\n" (line: lib.optionalString (line != "") "  ${line}") (
        lib.splitString "\n" body
      )}
      }
    '';

  sfwbarTail = ''
    item {
      value = "Screenshot Area";
      action = Exec(${quote screenshotCommand});
    }
    separator;
    item {
      value = "Lock Screen";
      action = Exec(${quote lockCommand});
    }
    separator;
    item {
      value = "Reload Configuration";
      action = Exec("labwc --reconfigure");
    }
    item {
      value = "Logout";
      action = Exec("labwc --exit");
    }
    separator;
    item {
      value = "Reboot";
      action = Exec("systemctl reboot");
    }
    item {
      value = "Shutdown";
      action = Exec("systemctl poweroff");
    }'';
in
{
  inherit labwcMenu sfwbarMenu;
}
