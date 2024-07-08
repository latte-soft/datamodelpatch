local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(script.Parent.patternMatcher);
local v4 = require(script.Parent.addMessage);
return function(v5, v6, v7)
    v2.isType(v5, "string", "separateLinksFromMessages.text");
    v2.isType(v6, "table", "separateLinksFromMessages.domains");
    v2.isType(v7, "string", "separateLinksFromMessages.gameLinkPattern");
    local v8 = {};
    local l_v5_0 = v5;
    for _, v11 in pairs(v6) do
        local v12 = "[^%s*]*" .. v11 .. v7 .. "[^%s*]*";
        for v13 in l_v5_0:lower():gmatch(v12) do
            local v14, v15 = v3(l_v5_0, v12);
            if not (not v14 or not v15) then
                v8 = v4(v4(v8, l_Text_0.Trim(v15.prefix)), v13, true);
                l_v5_0 = l_Text_0.Trim(v15.suffix);
            end;
        end;
    end;
    return v4(v8, l_v5_0);
end;
