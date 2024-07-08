local v0 = require(script:FindFirstAncestor("InputUi").Parent.React);
local l_Players_0 = game:GetService("Players");
local v2 = nil;
pcall(function()
    v2 = game:GetService("ThirdPartyUserService");
end);
local v3 = require(script.Parent.GamepadDisconnectedModalView);
local function _()
    local v4 = "";
    if v2 then
        v4 = v2:GetUserPlatformName();
    end;
    if not (v4 ~= "") or v4 == nil then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            v4 = l_LocalPlayer_0.DisplayName or l_LocalPlayer_0.Name;
        end;
    end;
    return v4 or "";
end;
return function(_)
    local v8 = "";
    if v2 then
        v8 = v2:GetUserPlatformName();
    end;
    if not (v8 ~= "") or v8 == nil then
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_1 then
            v8 = l_LocalPlayer_1.DisplayName or l_LocalPlayer_1.Name;
        end;
    end;
    return v0.createElement(v3, {
        username = v8 or ""
    });
end;
