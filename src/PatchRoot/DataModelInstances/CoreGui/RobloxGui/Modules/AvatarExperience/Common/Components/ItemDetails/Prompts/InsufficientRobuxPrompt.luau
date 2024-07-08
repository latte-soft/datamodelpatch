local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactFitComponents_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PerformXboxUpsell);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v16 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v16.Style.withStyle;
local l_InteractiveAlert_0 = v16.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v16.App.Button.Enum.ButtonType;
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_GetFFlagOpenVngShopForVngRobuxPurchase_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngShopForVngRobuxPurchase;
local v22 = require(l_Modules_0.LuaApp.Thunks.OpenPurchaseRobuxPage);
local v23 = l_GuiService_0:IsTenFootInterface();
local v24 = v3.PureComponent:extend("InsufficientRobuxPrompt");
v24.init = function(v25)
    v25.closePrompt = function()
        v20.closeOverlay(v25.props.navigation);
    end;
    v25.buyRobux = function()
        v25.closePrompt();
        if not v23 then
            v25.props.openPurchaseRobuxPage();
            return ;
        else
            v25.props.openXboxUpsell(v25.props.networking);
            return ;
        end;
    end;
end;
v24.renderMiddle = function(v26, v27)
    local l_userRobux_0 = v26.props.userRobux;
    return l_withStyle_0(function(v29)
        local l_Font_0 = v29.Font;
        local l_Theme_0 = v29.Theme;
        local v32 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        return v3.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            margin = l_RoactFitComponents_0.Rect.quad(10, 0, 10, 0), 
            contentPadding = UDim.new(0, 30), 
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            CurrentBalanceLabel = v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v27.currentBalanceLabel, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v32, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v3.createElement(v15, {
                robuxAmountText = tostring(l_userRobux_0), 
                iconSize = v32, 
                textSize = v32, 
                padding = 10
            })
        });
    end);
end;
v24.renderAlertLocalized = function(v33, v34)
    return v3.createElement(l_InteractiveAlert_0, {
        title = v34.titleText, 
        bodyText = v34.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v33.closePrompt, 
                        text = v34.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v33.buyRobux, 
                        text = v34.confirmButtonText
                    }
                }
            }
        }, 
        middleContent = function()
            return v33:renderMiddle(v34);
        end, 
        screenSize = v33.props.screenSize, 
        defaultChildRef = v33.props.defaultChildRef
    });
end;
v24.render = function(v35)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.InsufficientFunds", 
        currentBalanceLabel = "Feature.Catalog.Label.CurrentBalance", 
        messageText = "Feature.Catalog.Label.InsufficientFunds", 
        confirmButtonText = "Feature.GameDetails.Action.BuyRobux", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v36)
        return v35:renderAlertLocalized(v36);
    end);
end;
return (v14((l_RoactServices_0.connect({
    networking = v11
})((v4.connect(function(v37, _)
    return {
        userRobux = v37.UserRobux[v37.LocalUserId], 
        screenSize = v37.ScreenSize
    };
end, function(v39)
    return {
        openPurchaseRobuxPage = function()
            if not l_GetFFlagOpenVngShopForVngRobuxPurchase_0() then
                return v39(v9({
                    name = v8.PurchaseRobux
                }));
            else
                return v39(v22());
            end;
        end, 
        openXboxUpsell = function(v40)
            v39(v13(v40));
        end
    };
end)(v24))))));
