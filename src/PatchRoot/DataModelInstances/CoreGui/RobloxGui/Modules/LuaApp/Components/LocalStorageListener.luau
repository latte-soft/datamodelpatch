local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local v5 = require(l_Modules_0.Common.Roact);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = v5.PureComponent:extend("LocalStorageListener");
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
local v11 = {
    mid = l_MessageBus_0.getMessageId("Locale", "RobloxLocaleIdChanged"), 
    validateParams = v8.strictInterface({
        localeId = v8.string
    })
};
v9.init = function(_)
end;
v9.render = function(_)
end;
v9.didMount = function(v14)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v4.RobloxLocaleId);
    if not v10() then
        l_LocalizationService_0:SetRobloxLocaleId(l_l_AppStorageService_0_Item_0);
    elseif l_l_AppStorageService_0_Item_0 ~= "" then
        l_LocalizationService_0:SetRobloxLocaleId(l_l_AppStorageService_0_Item_0);
    end;
    v14.connections = {
        l_AppStorageService_0.ItemWasSet:Connect(function(v16, v17)
            if v16 == v4.RobloxLocaleId then
                l_LocalizationService_0:SetRobloxLocaleId(v17);
                l_MessageBus_0.publish(v11, {
                    localeId = v17
                });
                return ;
            else
                if v16 == v4.AuthenticatedTheme then
                    l_NotificationService_0.SelectedTheme = v17;
                end;
                return ;
            end;
        end)
    };
end;
v9.willUnmount = function(v18)
    for _, v20 in ipairs(v18.connections) do
        v20:Disconnect();
    end;
end;
return v9;
