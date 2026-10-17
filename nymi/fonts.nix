{ pkgs, ... }:
{
    fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      inter
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];

    fontconfig = {
      antialias = true;
      useEmbeddedBitmaps = false;
      hinting.enable = true;
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };

    fontconfig.defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "Noto Sans Mono"
        "Noto Sans Mono CJK JP"
        "Noto Sans Mono CJK KR"
        "Noto Sans Mono CJK HK"
        "Noto Sans Mono CJK SC"
        "Noto Sans Mono CJK TC"
      ];
      sansSerif = [
        # "Inter"
        "Noto Sans"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK HK"
        "Noto Sans CJK SC"
        "Noto Sans CJK TC"
      ];
      serif = [
        "Noto Serif"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK HK"
        "Noto Sans CJK SC"
        "Noto Sans CJK TC"
      ];
    };
  };
}