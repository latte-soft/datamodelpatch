local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.TenFootInterface);
local v5 = nil;
if v4:IsEnabled() then
    v5 = v4:SetupTopStat();
end;
local v6 = v2.PureComponent:extend("TopStatConnector");
v6.render = function(v7)
    if v5 then
        v5:SetTopStatEnabled(v7.props.displayOptions.playerlistCoreGuiEnabled);
    end;
    return nil;
end;
return v3.connect(function(v8)
    return {
        displayOptions = v8.displayOptions
    };
end, nil)(v6);
