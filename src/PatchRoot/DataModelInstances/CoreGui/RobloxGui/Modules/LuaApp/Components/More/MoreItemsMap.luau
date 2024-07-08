local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(game:GetService("CorePackages").Packages.React);
local v2 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local _ = require(l_Modules_0.LuaApp.Components.More.MoreItems.Types);
local v4 = require(l_Modules_0.LuaApp.Components.More.MoreItems.SwitchProfileSection);
local v5 = require(l_Modules_0.LuaApp.Components.More.MoreItems.DeviceSettingsSection);
local v6 = require(l_Modules_0.LuaApp.Components.More.MoreItems.LicensingSection);
local v7 = require(l_Modules_0.LuaApp.Components.More.MoreItems.AccountSettingsInfoItem);
local v8 = require(l_Modules_0.LuaApp.Components.More.MoreItems.LinkButtonItem);
local v9 = {
    [v2.ItemType.Settings_SwitchProfileSection] = v4, 
    [v2.ItemType.Settings_DeviceSettingsSection] = v5, 
    [v2.ItemType.About_LicensingSection] = v6
};
local v10 = {
    [v2.ItemType.Settings_AccountSettingsInfo] = v7, 
    [v2.ItemType.About_TermsOfService] = v8, 
    [v2.ItemType.About_Privacy] = v8
};
return {
    getSectionComponent = function(v11)
        return v9[v11];
    end, 
    getItemComponent = function(v12)
        return v10[v12];
    end
};
