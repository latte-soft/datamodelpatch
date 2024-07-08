local v0 = require(game:GetService("CorePackages").Packages.React);
local l_Players_0 = game:GetService("Players");
return function()
    return v0.useMemo(function()
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        assert(l_LocalPlayer_0 ~= nil);
        return l_LocalPlayer_0;
    end);
end;
