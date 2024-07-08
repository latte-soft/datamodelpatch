local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.UIBlox);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v7 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local l_Catalog_0 = l_AvatarExperience_0.Catalog;
local v15 = require(l_Common_0.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Common_0.Types);
local v17 = require(l_Common_0.Thunks.ToggleTryOnThunk);
local v18 = require(l_Common_0.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v19 = require(l_Common_0.Hooks.useAvatarRoute);
local v20 = require(l_Catalog_0.CatalogConstants);
local v21 = require(l_Catalog_0.CatalogUtils);
local v22 = require(l_Catalog_0.Services.Analytics);
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v28)
    local v29 = l_useStyle_0();
    local l_Theme_0 = v29.Theme;
    local l_Font_0 = v29.Font;
    local v32 = v9({
        tryOn = "Feature.Avatar.Action.TryOn"
    });
    local v33 = l_useNavigation_0();
    local v34 = v11(v10);
    local v35 = v11(v22);
    local v36 = l_useDispatch_0();
    local v37 = v19();
    local v40 = v4.useCallback(function()
        local v38 = {
            itemId = v28.itemId, 
            itemType = v28.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v28.itemDetailsPeekViewRefs, 
            resultsListRef = v28.resultsListRef
        };
        local v39 = v28.itemType .. v28.itemId;
        v36(v17(v34, v35, v28.itemType, v28.itemSubType, v28.itemId, true, v37, v33));
        v36(v18(v15.TryOnItem, v39, v38));
        v35.profileTryOnAvatarItem(v20.AnalyticsContext.ProfileItemDetails, v28.itemId, v28.itemType, v28.itemSubType);
    end, {
        v34, 
        v35, 
        v37, 
        v33, 
        v28
    });
    local v41 = (v28.width * 9) / 16;
    local v42 = l_getRbxthumbWithTypeSizeAndOptions_0(v28.itemId, v21.GetRbxThumbType(v28.itemType), 420);
    local v43 = v33.getParam("fromProfile");
    local l_tryOn_0 = v32.tryOn;
    local v45 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v41), 
        LayoutOrder = 1, 
        ZIndex = 0
    }, {
        ItemBackground = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.new(1, 48, 1, 0), 
            ZIndex = 0, 
            BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
            BorderSizePixel = 0
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = -90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.4, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        Image = v3.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            Image = v42, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromOffset(v41, v41), 
            useShimmerAnimationWhileLoading = true
        }), 
        TryOnButtonFrame = if not v43 then nil else v3.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            TryOnButton = v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                position = UDim2.new(1, -v45 - 8, 1, -44), 
                size = UDim2.fromOffset(v45, 36), 
                text = l_tryOn_0, 
                onActivated = v40
            })
        })
    });
end;
