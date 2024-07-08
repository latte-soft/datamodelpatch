local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.VR.VRServiceWrapper);
local v4 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_t_0 = v4.t;
local v7 = require(script:FindFirstAncestor("InGameMenu").Resources.Constants);
local v8 = l_Roact_0.PureComponent:extend("BlurredModalPortal");
v8.validateProps = l_t_0.strictInterface({
    Enabled = l_t_0.boolean, 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
v8.render = function(v9)
    return l_Roact_0.createElement(l_Roact_0.Portal, {
        target = l_CoreGui_0
    }, {
        InGameMenuModalBlur = l_Roact_0.createElement("ScreenGui", {
            OnTopOfCoreBlur = true, 
            Enabled = v9.props.Enabled, 
            IgnoreGuiInset = true, 
            DisplayOrder = v7.DisplayOrder.BlurredModalPortal
        }, v9.props[l_Roact_0.Children])
    });
end;
v8.didUpdate = function(v10, v11)
    if not v3.VREnabled then
        local l_Enabled_0 = v11.Enabled;
        local l_Enabled_1 = v10.props.Enabled;
        if l_Enabled_0 ~= l_Enabled_1 then
            l_RunService_0:SetRobloxGuiFocused(l_Enabled_1);
        end;
        return ;
    else
        return ;
    end;
end;
return v8;
