inputs:

{ buildVimPlugin
, lib
, prefixName ? "vimPlugins_"
}:

let
  builder = src: buildVimPlugin rec {
    inherit src;
    pname = src.name;
    version = src.lastModifiedDate;
  };

  hasPrefix = k: builtins.substring 0 11 k == prefixName;

  removePrefix = k: lib.removePrefix prefixName k;

  removePrefixAttr = lib.attrsets.mapAttrs' (k: v: lib.attrsets.nameValuePair (removePrefix k) v);

  filterWithPrefix = lib.attrsets.filterAttrs (k: _: hasPrefix k);

  addNameWithPrefix = lib.attrsets.mapAttrs (k: v: v // { name = removePrefix k; });

  builders = lib.attrsets.mapAttrs (_: v: (builder v));

  compose = [ filterWithPrefix addNameWithPrefix builders removePrefixAttr ];

  apply = x: f: f x;

in

builtins.foldl' apply inputs compose 
