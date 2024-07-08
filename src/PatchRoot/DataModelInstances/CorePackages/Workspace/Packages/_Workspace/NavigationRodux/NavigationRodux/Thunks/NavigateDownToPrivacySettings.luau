local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_script_FirstAncestor_0.Thunks.NavigateDown);
local v4 = require(l_Parent_0.RobloxAppEnums);
local v5 = require(l_Parent_0.UrlBuilder);
local l_AppPage_0 = v4.AppPage;
local l_UrlBuilder_0 = v5.UrlBuilder;
return function(v8)
    v2.isTypeOrNil(v8, "function", "onClose");
    return v3({
        name = l_AppPage_0.SettingsSubPage, 
        detail = l_UrlBuilder_0.static.settings.privacy(), 
        extraProps = {
            titleKey = "Feature.AccountSettings.Heading.Tab.Privacy", 
            onClose = v8
        }
    });
end;
