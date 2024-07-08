local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v5 = require(l_Modules_0.Flags.GetFStringInExperienceNotificationsLayer);
local v6 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuIXP);
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
local v8 = {};
v8.__index = v8;
v8.new = function(v9)
    local v10 = {
        _ixpServiceWrapper = v9 or v4, 
        _styleEnabled = false, 
        _customizationEnabled = false, 
        _newSendEndpointEnabled = false, 
        _inviteListSortOrder = if not l_GetFFlagInviteListRerank_0() then nil else 0
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.getStyleEnabled = function(v11)
    return v11._styleEnabled;
end;
v8.getCustomizationEnabled = function(v12)
    return v12._customizationEnabled;
end;
v8.getNewSendEndpointEnabled = function(v13)
    return v13._newSendEndpointEnabled;
end;
if l_GetFFlagInviteListRerank_0() then
    v8.getInviteListSortOrder = function(v14)
        return v14._inviteListSortOrder;
    end;
end;
v8.initialize = function(v15)
    if v6() then
        task.spawn(function()
            v15._ixpServiceWrapper:WaitForInitialization();
            local l_LayerData_0 = v15._ixpServiceWrapper:GetLayerData(v5());
            if l_LayerData_0 then
                v15._styleEnabled = l_LayerData_0.NewInviteMenuStyleEnabled or false;
                v15._customizationEnabled = l_LayerData_0.NewInviteMenuCustomizationEnabled or false;
                v15._newSendEndpointEnabled = l_LayerData_0.NewInviteMenuEndpointEnabled or false;
                v15._inviteListSortOrder = if not l_GetFFlagInviteListRerank_0() then nil else l_LayerData_0.invite_list_sort_order or 0;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v8.default = v8.new();
return v8;
