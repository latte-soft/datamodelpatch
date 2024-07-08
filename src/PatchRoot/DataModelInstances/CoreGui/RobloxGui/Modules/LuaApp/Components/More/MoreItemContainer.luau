local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v9 = require(l_Modules_0.LuaApp.Components.More.LogOutButton);
local v10 = require(l_Modules_0.LuaApp.Components.More.MoreButton);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks);
local v16 = v2.PureComponent:extend("MoreItemContainer");
v16.defaultProps = {
    layoutInfo = {}
};
v16.init = function(v17)
    v17.navigateDown = function()
        local l_item_0 = v17.props.item;
        local l_url_0 = l_item_0.context.url;
        local l_titleKey_0 = l_item_0.context.titleKey;
        local l_notificationType_0 = l_item_0.context.notificationType;
        if l_item_0.urlGenerator then
            local l_localUserId_0 = v17.props.localUserId;
            l_url_0 = if not v15() then l_item_0.urlGenerator(l_localUserId_0) else l_item_0.urlGenerator(l_localUserId_0, v17.props.appPolicy);
        end;
        local v23 = nil;
        if l_item_0.getSearchParams then
            v23 = l_item_0.getSearchParams(v17.props.formFactor);
        end;
        local v24 = nil;
        if not (not (l_titleKey_0 or v23) and not l_notificationType_0) then
            v24 = {
                titleKey = l_titleKey_0, 
                searchParams = v23, 
                notificationType = l_notificationType_0
            };
        end;
        local v25 = l_item_0.shouldOpenInExternalBrowser and v17.props.shouldUseExternalBrowserForMorePageItem();
        local v26 = false;
        if v17.props.disableWebViewSupport == true then
            v26 = l_item_0.context.fallbackToExternalBrowser == true;
        end;
        if not v25 and not v26 then
            v17.props.navigateDown({
                name = l_item_0.context.page, 
                detail = l_url_0, 
                extraProps = v24
            });
            return ;
        else
            v14(v17.props.linking, l_url_0);
            return ;
        end;
    end;
end;
v16.render = function(v27)
    local l_layoutInfo_0 = v27.props.layoutInfo;
    local l_item_1 = v27.props.item;
    v5.isType(l_layoutInfo_0, "table", "MoreItemContainer.props.layoutInfo");
    v5.isType(l_item_1, "table", "MoreItemContainer.props.item");
    if l_item_1.itemType == v6.ItemType.LogOut then
        return v2.createElement(v9, {
            onActivated = v27.onActivated
        });
    else
        return v2.createElement(v10, v1.Dictionary.join(l_layoutInfo_0, {
            badgeComponent = l_item_1.badgeComponent, 
            badgeCount = l_item_1.badgeCount, 
            icon = l_item_1.icon, 
            rightImage = l_item_1.rightImage, 
            textKey = l_item_1.textKey, 
            TextXAlignment = l_item_1.textXAlignment, 
            onActivated = v27.navigateDown
        }));
    end;
end;
return l_RoactServices_0.connect({
    linking = l_AppLinking_0, 
    networkImpl = v11
})((l_RoactAppPolicy_0.connect(function(v30)
    return {
        shouldUseExternalBrowserForMorePageItem = v30.shouldUseExternalBrowserForMorePageItem, 
        disableWebViewSupport = not v30.getWebViewSupport(), 
        appPolicy = if not v15() then nil else v30
    };
end)((v3.connect(function(v31, _)
    return {
        formFactor = v31.FormFactor, 
        localUserId = v31.LocalUserId
    };
end, function(v33)
    return {
        navigateDown = function(v34)
            v33(v12(v34));
        end
    };
end)(v16)))));
