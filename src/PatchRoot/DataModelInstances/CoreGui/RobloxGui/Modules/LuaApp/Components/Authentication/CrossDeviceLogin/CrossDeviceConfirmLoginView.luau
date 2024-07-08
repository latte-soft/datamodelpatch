local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.LuaApp.Themes.Colors);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v14 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v15 = require(l_Modules_0.LuaApp.FitChildren);
local v16 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v19 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout);
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v6.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v6.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v26 = l_Images_0["icons/graphic/devices_xxlarge"];
local _ = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
local v28 = l_getIconSize_0(l_IconSize_0.XLarge);
local v29 = l_Images_0["icons/status/alert"];
local v30 = l_getIconSizeUDim2_0(l_IconSize_0.Medium);
local v31 = v3.PureComponent:extend("CrossDeviceConfirmLoginView");
local v32 = require(l_Modules_0.LuaApp.EventStreamConstants);
v31.init = function(v33)
    v33:setState({
        isConfirming = false
    });
    v33.confirming = false;
    v33.confirmButtonPressed = function()
        if not v33.confirming then
            v33.confirming = true;
            v33:setState({
                isConfirming = true
            });
            v33.props.authAnalytics.reportButtonClicked(v32.Context.ApproveQuickLogin, v32.Button.GrantAccess);
            v33.props.confirmDeviceAccess(v33.props.networking, v33.props.deviceCode):andThen(function(_)
                v33.confirmCallback(true);
            end, function(_)
                v33.confirmCallback(false);
            end);
        end;
    end;
    v33.confirmCallback = function(v36)
        if v33.confirming then
            v33.confirming = false;
            v33:setState({
                isConfirming = false
            });
            v33.props.openConfirmationModal(v36, v33.props.closeCallback, v33.props.retryCallback, v33.props.deviceString);
        end;
    end;
    v33.closeButtonPressed = function()
        v33.props.cancelLoginCode(v33.props.networking, v33.props.deviceCode);
        if v33.props.closeCallback then
            v33.props.closeCallback();
        end;
    end;
end;
v31.didMount = function(v37)
    v37.props.authAnalytics.reportScreenLoaded(v32.Context.ApproveQuickLogin);
end;
v31.willUnmount = function(v38)
    v38.confirming = false;
end;
v31.render = function(v39)
    local l_isWideView_0 = v39.props.isWideView;
    local l_isConfirming_0 = v39.state.isConfirming;
    return l_withStyle_0(function(v42)
        return v8({
            heading = "Authentication.CrossDevice.Heading.Warning", 
            confirmation1 = "Authentication.CrossDevice.Label.ConfirmationMessage1", 
            confirmation2 = "Authentication.CrossDevice.Label.ConfirmationMessage2", 
            confirmation3 = "Authentication.CrossDevice.Label.ConfirmationMessage3", 
            confirm = "Authentication.CrossDevice.Action.ConfirmLogin", 
            cancel = "Authentication.CrossDevice.Action.CancelLogin"
        })(function(v43)
            local l_designTokens_0 = v39.props.designTokens;
            local v45 = UDim2.fromOffset(l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize, l_designTokens_0.LuaApps.CrossDeviceLogin.iconSize);
            local l_Font_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.Font;
            local l_FontSize_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerFont.FontSize;
            local l_Color3_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Color3;
            local l_Font_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.Font;
            local l_FontSize_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.FontSize;
            local l_Color3_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
            local l_Transparency_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
            local l_Font_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.Font;
            local l_FontSize_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertFont.FontSize;
            local l_Color3_2 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
            local l_BaseSize_0 = v42.Font.BaseSize;
            local l_Color_0 = v42.Theme.UIEmphasis.Color;
            return v3.createElement(not not l_isWideView_0 and v20 or v19, {
                TabletHeaderText = v43.tabletHeader, 
                Style = v42, 
                HighKeyboardMode = v39.props.highKeyboardMode, 
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Size = v45, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v26, 
                    ImageColor3 = l_Color_0, 
                    ImageTransparency = 0
                }), 
                WarningText = v3.createElement(v15.FitFrame, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, not not l_isWideView_0 and -50 - v28 or -20, 0, 0), 
                    fitAxis = v15.FitAxis.Height, 
                    BackgroundTransparency = 1
                }, {
                    Align = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = UDim.new(0, 6), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TopWarning = v3.createElement(v15.FitFrame, {
                        fitAxis = v15.FitAxis.Height, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        ListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = not not l_isWideView_0 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 0), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        WarningIcon1 = v3.createElement(l_ImageSetLabel_0, {
                            Size = v30, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v29, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = 0
                        }), 
                        WarningText = v3.createElement(v16, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(0, l_BaseSize_0, 1, 0), 
                            Text = v43.heading, 
                            TextWrapped = true, 
                            Font = l_Font_0, 
                            TextSize = l_FontSize_0, 
                            TextColor3 = l_Color3_0, 
                            TextTransparency = l_Transparency_0, 
                            TextXAlignment = not not l_isWideView_0 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                            fitAxis = v15.FitAxis.Width, 
                            BackgroundTransparency = 1
                        }), 
                        WarningIcon2 = v3.createElement(l_ImageSetLabel_0, {
                            Size = v30, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            ScaleType = Enum.ScaleType.Fit, 
                            Image = v29, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = 0
                        })
                    }), 
                    Warning1 = v3.createElement(v16, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = string.format(v43.confirmation1, v39.props.deviceString), 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v15.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    Warning2 = v3.createElement(v16, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v43.confirmation2, 
                        TextWrapped = true, 
                        Font = l_Font_2, 
                        TextSize = l_FontSize_2, 
                        TextColor3 = l_Color3_2, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v15.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }), 
                    Warning3 = v3.createElement(v16, {
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v43.confirmation3, 
                        TextWrapped = true, 
                        Font = l_Font_1, 
                        TextSize = l_FontSize_1, 
                        TextColor3 = l_Color3_1, 
                        TextTransparency = l_Transparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fitAxis = v15.FitAxis.Height, 
                        BackgroundTransparency = 1
                    })
                }), 
                LoginButton = v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v43.confirm, 
                    onActivated = v39.confirmButtonPressed, 
                    isLoading = l_isConfirming_0
                }), 
                CancelButton = v3.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v43.cancel, 
                    onActivated = v39.closeButtonPressed
                })
            });
        end);
    end);
end;
local v69 = v5.connect(function(v58, _)
    return {
        screenSize = v58.ScreenSize
    };
end, function(v60)
    return {
        confirmDeviceAccess = function(v61, v62)
            return v60(v13.ConfirmDeviceAccess(v61, v62));
        end, 
        cancelLoginCode = function(v63, v64)
            return v60(v13.CancelLoginCode(v63, v64));
        end, 
        openConfirmationModal = function(v65, v66, v67, v68)
            return v60(v13.OpenConfirmationOverlay(v65, v66, v67, v68));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v10, 
    authAnalytics = v14
})(v31)));
return function(v70)
    return v4.createElement(v69, v2.Dictionary.join(v70, {
        designTokens = l_useDesignTokens_0()
    }));
end;
