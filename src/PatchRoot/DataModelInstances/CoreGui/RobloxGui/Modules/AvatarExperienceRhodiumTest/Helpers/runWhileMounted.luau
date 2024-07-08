local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.AvatarExperience.Common.Debug.dumpInstanceTree);
return function(v4, v5)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v7 = v2.mount(v4, l_ScreenGui_0);
    local l_status_0, l_result_0 = pcall(v5, l_ScreenGui_0, v7);
    local v10 = nil;
    if not l_status_0 then
        v10 = string.format("%s\n\nInstance Tree:\n\n%s", tostring(l_result_0), v3(l_ScreenGui_0));
    end;
    v2.unmount(v7);
    if not l_status_0 then
        error(v10);
    end;
end;
