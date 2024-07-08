local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v8 = require(l_CorePackages_0.Packages.RoactNavigation);
local v9 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceEnterCodeView);
local v10 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceConfirmLoginView);
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v17 = require(l_Modules_0.LuaApp.Enum.CrossDeviceLoginView);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
local v20 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
local v21 = v4.PureComponent:extend("CrossDeviceLoginPage");
v21.init = function(v22)
    v22:setState({
        View = v17.InputCode, 
        DeviceCode = "", 
        HighKeyboardMode = false, 
        DeviceName = ""
    });
    v22.confirmDeviceCode = function(v23, v24)
        v22:setState({
            View = v17.Confirm, 
            DeviceCode = v23, 
            DeviceName = v24
        });
    end;
    v22.retryCrossDeviceLogin = function()
        v22:setState({
            DeviceCode = "", 
            DeviceName = "", 
            View = v17.InputCode
        });
    end;
    v22.closeCrossDeviceLogin = function()
        v22.props.navigateBack();
    end;
    v22.continueButtonRef = v4.createRef();
end;
v21.didMount = function(v25)
    v25.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
        local v27 = not not l_OnScreenKeyboardVisible_0 and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        if not l_OnScreenKeyboardVisible_0 then
            if v25.state.HighKeyboardMode then
                v25:setState({
                    HighKeyboardMode = false
                });
            end;
        else
            local l_current_0 = v25.continueButtonRef.current;
            if l_current_0 and v25.props.screenSize.Y < ((v27 + l_current_0.AbsolutePosition.Y) + l_current_0.AbsoluteSize.Y) + 25 then
                v25:setState({
                    HighKeyboardMode = true
                });
                return ;
            end;
        end;
    end);
end;
v21.willUnmount = function(v29)
    if v29.keyboardVisibleChanged then
        v29.keyboardVisibleChanged:disconnect();
        v29.keyboardVisibleChanged = nil;
    end;
end;
v21.render = function(v30)
    local l_designTokens_0 = v30.props.designTokens;
    local v32 = true;
    if v30.props.formFactor ~= l_FormFactor_0.WIDE then
        v32 = v30.props.isTenFootUiMode;
    end;
    local v33 = nil;
    if v30.props.isTenFootUiMode then
        local l_BackgroundGradientOffset_0 = l_designTokens_0.LuaApps.More.BackgroundGradientOffset;
        local l_SafeAreaMargin_0 = l_designTokens_0.LuaApps.More.SafeAreaMargin;
        v33 = v5.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            ZIndex = -1
        }, {
            UIGradient = v5.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        });
    end;
    local v36 = {};
    local v37 = false;
    if v30.state.View == v17.InputCode then
        v37 = v4.createElement(v9, {
            isWideView = v32, 
            code = v18() and v30.props.code, 
            continueButtonRef = v30.continueButtonRef, 
            highKeyboardMode = v30.state.HighKeyboardMode, 
            confirmDeviceCode = v30.confirmDeviceCode
        });
    end;
    local v38 = false;
    if v30.state.View == v17.Confirm then
        v38 = v4.createElement(v10, {
            isWideView = v32, 
            continueButtonRef = v30.continueButtonRef, 
            highKeyboardMode = v30.state.HighKeyboardMode, 
            deviceString = v30.state.DeviceName, 
            deviceCode = v30.state.DeviceCode, 
            closeCallback = v30.closeCrossDeviceLogin, 
            retryCallback = v30.retryCrossDeviceLogin
        });
    end;
    setlist { ['R004[1 to 2]'] = 'R005 to R006' };
    return l_withStyle_0(function(_)
        local l_BackgroundColor_0 = l_designTokens_0.LuaApps.App.Page.BackgroundColor;
        local l_BackgroundTransparency_0 = l_designTokens_0.LuaApps.App.Page.BackgroundTransparency;
        local v42 = l_designTokens_0.LuaApps.CrossDeviceLogin.getDevicePadding(v32);
        local l_verticalPadding_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.verticalPadding;
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundColor_0, 
            BackgroundTransparency = l_BackgroundTransparency_0
        }, {
            BackgroundFrame = if not v30.props.isTenFootUiMode then nil else v33, 
            TopBar = if v20 or v30.props.isTenFootUiMode then nil else v4.createElement(v11.Container, {
                leftItem = v11.BackButton, 
                rightItems = {
                    v11.BuyRobuxButton, 
                    v11.NotificationsButton
                }
            }), 
            PageContent = v4.createElement("Frame", {
                Size = UDim2.new(1, -2 * v42, 1, -2 * l_verticalPadding_0 - v30.props.topBarSize), 
                Position = UDim2.new(0, v42, 0, not not v30.state.HighKeyboardMode and v30.props.topBarSize or l_verticalPadding_0 + v30.props.topBarSize), 
                BackgroundTransparency = 1
            }, v36)
        });
    end);
end;
local v47 = v6.connect(function(v44, v45)
    return {
        formFactor = v44.FormFactor, 
        topBarSize = (v20 or v45.isTenFootUiMode) and 0 or v44.TopBar.topBarHeight, 
        screenSize = v44.ScreenSize
    };
end, function(v46)
    return {
        navigateBack = function()
            return v46(v12());
        end
    };
end)(v21);
v21 = function(v48)
    return v5.createElement(v47, v3.Dictionary.join(v48, {
        designTokens = l_useDesignTokens_0(), 
        isTenFootUiMode = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot, 
        code = if not l_FFlagUnifyNavigationGraph_0 then nil else v48.navigation.getParam("extraProps", {}).code
    }));
end;
if l_FFlagUnifyNavigationGraph_0 then
    v21 = v8.withNavigation(v21);
end;
return v21;
