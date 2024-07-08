local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(l_CorePackages_0.Packages.React);
useCoreGuiEnabled = function(v3)
    local v4, v5 = v2.useState(l_StarterGui_0:GetCoreGuiEnabled(v3));
    v2.useEffect(function()
        local v8 = l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v6, v7)
            if v6 == v3 then
                v5(v7);
            end;
        end);
        v5(l_StarterGui_0:GetCoreGuiEnabled(v3));
        return function()
            v8:Disconnect();
        end;
    end, {
        v3
    });
    return v4;
end;
return useCoreGuiEnabled;
