local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_CorePackages_0.Packages.Dash);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.RoactNavigation);
local v11 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v11.App.ImageSet.Images;
local l_withStyle_0 = v11.Style.withStyle;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_IconSize_0 = v11.App.ImageSet.Enum.IconSize;
local _ = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v17 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.getIconButtonSize);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v19 = require(l_Modules_0.LuaApp.AppPage);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local _ = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local v23 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v25 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v26 = require(l_Modules_0.LuaApp.Thunks.OpenPurchaseRobuxPage);
local l_GetFFlagOpenVngShopForVngRobuxPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngShopForVngRobuxPurchase;
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableTopBarShowItemsOnSearching);
local v29 = l_Images_0["icons/common/goldrobux"];
local v30 = v8.PureComponent:extend("BuyRobuxButton");
v30.validateProps = v7.strictInterface({
    formFactor = v7.string, 
    isCompactView = v7.boolean, 
    isUnderTitleSearchBarEnabled = v7.boolean, 
    isSearching = v7.boolean, 
    isSecondary = v7.optional(v7.boolean), 
    setVisible = v6.isCallable, 
    cancelSearch = v6.isCallable, 
    activateSearch = v6.isCallable, 
    buttonRef = v7.optional(v7.table), 
    currentRoute = v7.table, 
    openPurchaseRobuxPage = v6.isCallable, 
    analytics = v7.any, 
    disableIAPEntryPoint = v7.boolean
});
v30.init = function(v31)
    v31.showBuyRobuxCallback = function()
        local l_name_0 = v31.props.currentRoute[1].name;
        v31.props.openPurchaseRobuxPage(v31.props.disableIAPEntryPoint);
        v31.props.analytics.reportRobuxButtonClick(l_name_0);
    end;
end;
local function _(v33)
    if v28() and v33.formFactor == l_FormFactor_0.WIDE then
        return true;
    else
        return v33.isUnderTitleSearchBarEnabled or not v33.isSearching;
    end;
end;
v30.updateVisibility = function(v35, v36)
    local l_props_0 = v35.props;
    local v38 = (not not v28() and l_props_0.formFactor == l_FormFactor_0.WIDE or l_props_0.isUnderTitleSearchBarEnabled) or not l_props_0.isSearching;
    if v38 ~= v36 then
        v35.props.setVisible(v38);
    end;
end;
v30.didMount = function(v39)
    v39:updateVisibility(nil);
end;
v30.didUpdate = function(v40, v41, _)
    v40:updateVisibility((not not v28() and v41.formFactor == l_FormFactor_0.WIDE or v41.isUnderTitleSearchBarEnabled) or not v41.isSearching);
end;
v30.render = function(v43)
    return l_withStyle_0(function(_)
        return v8.createElement(l_IconButton_0, {
            size = UDim2.new(0, v17(v43.props.formFactor), 1, 0), 
            icon = v29, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = not not v43.props.isSearching and v43.props.cancelSearch or v43.showBuyRobuxCallback, 
            buttonRef = v43.props.buttonRef
        });
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v45)
    return {
        disableIAPEntryPoint = v45.getDisableIAPEntryPoint()
    };
end)((l_RoactServices_0.connect({
    analytics = v23
})((v9.connect(function(v46, _)
    return {
        currentRoute = v46.Navigation.history[#v46.Navigation.history]
    };
end, function(v48)
    return {
        openPurchaseRobuxPage = function(v49)
            if not v49 then
                if not l_GetFFlagOpenVngShopForVngRobuxPurchase_0() then
                    return v48(v20({
                        name = v19.PurchaseRobux
                    }));
                else
                    return v48(v26());
                end;
            else
                v48(v25(v5.WEBVIEWS_UNAVAILABLE_TOAST));
                return ;
            end;
        end
    };
end)(v30))))));
