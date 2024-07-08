local v0 = require(script.Parent.RoundingBehaviour);
local v1 = require(script.Parent.Logger);
game:DefineFastFlag("AllowNumberLocalizationSigFigParam", false);
local l_GetFFlagFixThaiNumberFormatting_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagFixThaiNumberFormatting;
local v3 = {
    ["en-us"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "K"
        }, 
        {
            1000000, 
            "M"
        }, 
        {
            1000000000, 
            "B"
        }
    }, 
    ["es-es"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " M"
        }
    }, 
    ["fr-fr"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " k"
        }, 
        {
            1000000, 
            " M"
        }, 
        {
            1000000000, 
            " Md"
        }
    }, 
    ["de-de"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " Tsd."
        }, 
        {
            1000000, 
            " Mio."
        }, 
        {
            1000000000, 
            " Mrd."
        }
    }, 
    ["pt-br"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " mi"
        }, 
        {
            1000000000, 
            " bi"
        }
    }, 
    ["zh-cn"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-cjv"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-tw"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\232\144\172"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["ko-kr"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\236\178\156"
        }, 
        {
            10000, 
            "\235\167\140"
        }, 
        {
            100000000, 
            "\236\150\181"
        }
    }, 
    ["ja-jp"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["it-it"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mila"
        }, 
        {
            1000000, 
            " Mln"
        }, 
        {
            1000000000, 
            " Mld"
        }
    }, 
    ["ru-ru"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \209\130\209\139\209\129"
        }, 
        {
            1000000, 
            " \208\188\208\187\208\189"
        }, 
        {
            1000000000, 
            " \208\188\208\187\209\128\208\180"
        }
    }, 
    ["id-id"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " rb"
        }, 
        {
            1000000, 
            " jt"
        }, 
        {
            1000000000, 
            " M"
        }
    }, 
    ["vi-vn"] = {
        decimalSeparator = ".", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " N"
        }, 
        {
            1000000, 
            " Tr"
        }, 
        {
            1000000000, 
            " T"
        }
    }
};
if not l_GetFFlagFixThaiNumberFormatting_0() then
    v3["th-th"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \224\184\158"
        }, 
        {
            10000, 
            " \224\184\161"
        }, 
        {
            100000, 
            " \224\184\170"
        }, 
        {
            1000000, 
            " \224\184\165"
        }
    };
end;
v3["tr-tr"] = {
    decimalSeparator = ",", 
    groupDelimiter = "."; 
    {
        1, 
        ""
    }, 
    {
        1000, 
        " B"
    }, 
    {
        1000000, 
        " Mn"
    }, 
    {
        1000000000, 
        " Mr"
    }
};
v3["en-gb"] = v3["en-us"];
v3["es-mx"] = v3["es-es"];
if l_GetFFlagFixThaiNumberFormatting_0() then
    v3["th-th"] = v3["en-us"];
end;
local function _(v4)
    return string.find(v4, "%.") or #v4 + 1;
end;
local function _(v6)
    if v6 == 0 then
        return 0;
    else
        return -(math.floor((math.log10((math.abs(v6))))) + 1);
    end;
end;
local _ = function(v8, v9, v10)
    local v11 = 10 ^ (v9 + (v8 == 0 and 0 or -(math.floor((math.log10((math.abs(v8))))) + 1)));
    local _ = nil;
    return if v10 == v0.Truncate then math.modf(v8 * v11) else math.floor(v8 * v11 + 0.5) / v11;
end;
local function v20(v14, v15)
    local l_v14_0 = v14;
    local v17 = string.format("%%1%s%%2", v15);
    while true do
        local v18, v19 = string.gsub(l_v14_0, "^(-?%d+)(%d%d%d)", v17);
        l_v14_0 = v18;
        if not (v19 ~= 0) then
            break;
        end;
    end;
    return l_v14_0;
end;
local function v29(v21, v22, v23)
    local v24 = v21[1];
    local v25 = math.abs(v22);
    for v26 = #v21, 2, -1 do
        local v27 = v21[v26];
        local _ = nil;
        if if v23 == v0.Truncate then v27[1] else v27[1] - v21[v26 - 1][1] / 2 <= v25 then
            return v27;
        end;
    end;
    return v24;
end;
return {
    localize = function(v30, v31)
        if v30 == 0 then
            return "0";
        else
            local v32 = v3[v31];
            if not v32 then
                v32 = v3["en-us"];
                v1:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(v31), "en-us"));
            end;
            if not v32.groupDelimiter then
                return v30;
            else
                return (v20(v30, v32.groupDelimiter));
            end;
        end;
    end, 
    abbreviate = function(v33, v34, v35, v36)
        if v33 == 0 then
            return "0";
        else
            if v35 == nil then
                v35 = v0.RoundToClosest;
            end;
            if not game:GetFastFlag("AllowNumberLocalizationSigFigParam") then
                v36 = 3;
            elseif v36 == nil then
                v36 = 3;
            end;
            local v37 = v3[v34];
            if not v37 then
                v37 = v3["en-us"];
                v1:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(v34), "en-us"));
            end;
            local v38 = v29(v37, v33, v35);
            local v39 = v38[1];
            local v40 = v38[2];
            local v41 = v33 / v39;
            local l_v36_0 = v36;
            local l_v35_0 = v35;
            local v44 = 10 ^ (l_v36_0 + (v41 == 0 and 0 or -(math.floor((math.log10((math.abs(v41))))) + 1)));
            local _ = nil;
            local v46 = if l_v35_0 == v0.Truncate then math.modf(v41 * v44) else math.floor(v41 * v44 + 0.5) / v44;
            v41 = nil;
            l_v36_0 = tostring(if v35 == v0.Truncate then math.modf(v46 * 10) / 10 else math.floor(v46 * 10 + 0.5) / 10);
            l_v35_0 = string.find(l_v36_0, "%.") or #l_v36_0 + 1;
            local v47 = string.sub(l_v36_0, 1, l_v35_0 - 1);
            v44 = string.sub(l_v36_0, l_v35_0 + 1, #l_v36_0);
            if v37.groupDelimiter then
                v47 = v20(v47, v37.groupDelimiter);
            end;
            if #v44 > 0 then
                return v47 .. v37.decimalSeparator .. v44 .. v40;
            else
                return v47 .. v40;
            end;
        end;
    end, 
    logger = v1
};
