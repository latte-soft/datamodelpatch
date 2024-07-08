local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.RegExp);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v3 = require(script.Parent.addMessage);
local v4 = require(script.Parent.matchAllRegex);
local v5 = {
    "roblox\\.com", 
    "sitetest\\d\\.robloxlabs\\.com", 
    "gametest\\d\\.robloxlabs\\.com", 
    "roblox\\.cn", 
    "roblox\\.qq\\.com", 
    "roblox-cn\\.com"
};
local v6 = "(?:";
for _, v8 in v5, nil, nil do
    v6 = v6 .. v8 .. "|";
end;
local v9 = v1("\\S*" .. v6:sub(1, -2) .. ")" .. "(?:\\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?" .. "\\/games\\/(\\d+)\\/?" .. "\\S*");
return function(v10)
    local v11 = {};
    local l_v10_0 = v10;
    local l_status_0, l_result_0 = pcall(function()
        return v4(l_v10_0:lower(), v9);
    end);
    if (not l_status_0 or not l_result_0) or #l_result_0 == 0 then
        return v3(v11, l_v10_0);
    else
        for _, v16 in l_result_0, nil, nil do
            local v17 = v16.capturedGroups[1];
            if v17 then
                v11 = v3(v3(v11, l_Text_0.Trim(l_v10_0:sub(1, v16.index - 1))), v17, true);
                l_v10_0 = l_v10_0:sub(v16.index + #v16.matchedText);
            end;
        end;
        return v3(v11, l_Text_0.Trim(l_v10_0));
    end;
end;
