local v0 = game:DefineFastFlag("InternationalNamesJapaneseLocaleSupported", true);
local v1 = game:DefineFastFlag("InternationalNamesKoreanLocaleSupported", false);
local v2 = game:DefineFastFlag("InternationalNamesChineseLocaleSupported", false);
local v3 = {
    ["ja-jp"] = v0, 
    ["ko-kr"] = v1, 
    ["zh-cjv"] = v2, 
    ["zh-cn"] = v2, 
    ["zh-tw"] = v2
};
return {
    isSupportedLocale = function(v4)
        return v3[v4] == true;
    end
};
