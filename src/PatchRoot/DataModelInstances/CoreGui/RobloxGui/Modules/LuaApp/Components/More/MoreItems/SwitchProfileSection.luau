local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v5 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v6 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreStatusButton);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local _ = require(script.Parent.Types);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local function v10()
    if l_ThirdPartyUserService_0 then
        l_ThirdPartyUserService_0:ShowAccountPicker();
    end;
end;
return function(v11)
    local v13 = l_useLocalization_0({
        title = v11.titleKey, 
        switchProfile = "Feature.Settings.Heading.SwitchProfile", 
        switchProfileDescription = {
            "Feature.Settings.Description.SwitchProfile"; 
            platform = v4(function(v12)
                return v12.getPlatformDisplayName();
            end)
        }, 
        open = "Feature.Settings.Label.Open"
    });
    return v2.createElement(v5, {
        layoutOrder = v11.layoutOrder, 
        withDivider = v11.withDivider, 
        title = v13.title
    }, {
        v2.createElement(v6, {
            layoutOrder = 1, 
            title = v13.switchProfile, 
            status = v13.open, 
            onActivated = v10
        }), 
        v2.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = v13.switchProfileDescription
        })
    });
end;
