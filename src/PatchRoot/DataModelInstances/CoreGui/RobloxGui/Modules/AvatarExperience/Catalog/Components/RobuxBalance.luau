local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v7 = require(l_CorePackages_0.RoactRodux);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v9 = require(l_CorePackages_0.UIBlox);
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_Images_0 = v9.App.ImageSet.Images;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_withStyle_0 = v9.Style.withStyle;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local v23 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v24 = require(l_Modules_0.LuaApp.AppPage);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v26 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_GetFFlagOpenVngShopForVngRobuxPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngShopForVngRobuxPurchase;
local v28 = require(l_Modules_0.LuaApp.Thunks.OpenPurchaseRobuxPage);
local v29 = l_Images_0["component_assets/circle_17"];
local v30 = l_Images_0["component_assets/circle_17_stroke_1"];
local v31 = l_Images_0["icons/common/goldrobux"];
local v32 = v5.PureComponent:extend("RobuxBalance");
local v33 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v34 = require(l_Modules_0.LuaApp.Constants);
v32.defaultProps = {
    LayoutOrder = 1
};
v32.init = function(v35)
    v35.fetchRobuxBalance = function()
        local l_localUserId_0 = v35.props.localUserId;
        local l_networking_0 = v35.props.networking;
        if typeof(l_localUserId_0) == "string" and l_localUserId_0 ~= "" then
            v35.props.requestRobuxInfo(l_networking_0, l_localUserId_0);
        end;
    end;
    v35.openPurchaseRobuxPage = function()
        v35.props.openPurchaseRobuxPage(v35.props.navigation, v35.props.disableIAPEntryPoint);
    end;
end;
v32.didMount = function(v38)
    v38.fetchRobuxBalance();
end;
local function _(v39)
    return v39.avatarRoute.opaque.name == v25.Catalog;
end;
v32.didUpdate = function(v41, v42, _)
    if v42.localUserId ~= v41.props.localUserId then
        v41.fetchRobuxBalance();
        return ;
    else
        local v44 = v41.props.avatarRoute.opaque.name == v25.Catalog;
        if not (v42.avatarRoute.opaque.name == v25.Catalog or not v44) then
            v41.fetchRobuxBalance();
        end;
        return ;
    end;
end;
v32.render = function(v45)
    local l_userRobuxBalance_0 = v45.props.userRobuxBalance;
    local v47 = not not l_userRobuxBalance_0 and l_NumberLocalization_0.abbreviate(l_userRobuxBalance_0, v45.props.localization:GetLocale()) or "-";
    return l_withStyle_0(function(v48)
        local l_Font_0 = v48.Font;
        local l_Theme_0 = v48.Theme;
        local l_Font_1 = l_Font_0.CaptionHeader.Font;
        local v52 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local v53 = (40 + l_TextService_0:GetTextSize(v47, v52, l_Font_1, Vector2.new(math.huge, v52)).X) + 8;
        return l_withSelectionCursorProvider_0(function(v54)
            return v5.createElement(l_Focusable_0[l_ImageSetButton_0], {
                BackgroundTransparency = 1, 
                Image = v29, 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                Size = UDim2.new(0, v53, 0, 40), 
                [v5.Event.Activated] = v45.openPurchaseRobuxPage, 
                [v5.Ref] = v45.props.forwardRef, 
                NextSelectionLeft = v45.props.NextSelectionLeft, 
                SelectionImageObject = v54(l_CursorKind_0.RoundedRectNoInset)
            }, {
                Border = v5.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v30, 
                    ImageColor3 = l_Theme_0.Divider.Color, 
                    ImageTransparency = l_Theme_0.Divider.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    Size = UDim2.new(1, 0, 1, 0)
                }), 
                Content = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    RobuxIcon = v5.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, 28, 0, 28), 
                        BackgroundTransparency = 1, 
                        Image = v31, 
                        LayoutOrder = 1
                    }), 
                    RobuxInfo = v5.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Text = v47, 
                        Font = l_Font_1, 
                        TextSize = v52, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        LayoutOrder = 2
                    })
                })
            });
        end);
    end);
end;
v32 = v19((l_withNavigation_0((v7.connect(function(v55, _)
    local l_LocalUserId_0 = v55.LocalUserId;
    return {
        localUserId = l_LocalUserId_0, 
        userRobuxBalance = v55.UserRobux[l_LocalUserId_0]
    };
end, function(v58, _)
    return {
        openPurchaseRobuxPage = function(_, v61)
            if not v61 then
                if not l_GetFFlagOpenVngShopForVngRobuxPurchase_0() then
                    return v58(v26({
                        name = v24.PurchaseRobux
                    }));
                else
                    return v58(v28());
                end;
            else
                v58(v33(v34.WEBVIEWS_UNAVAILABLE_TOAST));
                return ;
            end;
        end, 
        requestRobuxInfo = function(v62, v63)
            return v58(v23(v62, v63, false));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v64)
    return {
        disableIAPEntryPoint = v64.getDisableIAPEntryPoint()
    };
end)((l_RoactServices_0.connect({
    localization = v17, 
    networking = v18
})(v32)))))))));
return v5.forwardRef(function(v65, v66)
    return v5.createElement(v32, v4.Dictionary.join(v65, {
        forwardRef = v66
    }));
end);
