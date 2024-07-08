local v0 = game:DefineFastFlag("SelfieViewEnabled", false);
local v1 = game:DefineFastString("SelfieViewForcedUserIds", "");
local v2 = require(script.Parent.Parent.Parent.Chrome.Enabled);
local l_Players_0 = game:GetService("Players");
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v5 in v1:gmatch("%d+") do
        if l_LocalPlayer_0 and tonumber(v5) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    return v0 or v2();
end;
