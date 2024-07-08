local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.ChatSelector);
local v7 = require(l_RobloxGui_0.Modules.BackpackScript);
local v8 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v9 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v10 = v2.PureComponent:extend("CoreGuiCEnabledNotifieronnector");
v10.validateProps = v4.strictInterface({
    topBarEnabled = v4.boolean
});
v10.notifyEnabled = function(v11)
    v9:SetTopBarEnabled(v11.props.topBarEnabled);
    v6:TopbarEnabledChanged(v11.props.topBarEnabled);
    v7:TopbarEnabledChanged(v11.props.topBarEnabled);
    v8:setTopBarEnabled(v11.props.topBarEnabled);
end;
v10.didMount = function(v12)
    v12:notifyEnabled();
end;
v10.render = function(_)
    return nil;
end;
v10.didUpdate = function(v14, v15, _)
    if v14.props.topBarEnabled ~= v15.topBarEnabled then
        v14:notifyEnabled();
    end;
end;
return v3.UNSTABLE_connect2(function(v17)
    return {
        topBarEnabled = v17.displayOptions.topbarEnabled
    };
end, nil)(v10);
