local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Common_0 = l_Modules_0.Common;
local v5 = require(l_Common_0.Roact);
local v6 = require(l_Common_0.RoactRodux);
local v7 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.BackgroundFill);
local v9 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v10 = require(l_Modules_0.LuaApp.FitChildren);
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.getIndexOfTopMostPage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v15 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v16 = require(l_CorePackages_0.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v19 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v19.Style.withStyle;
local l_SpringAnimatedItem_0 = v19.Utility.SpringAnimatedItem;
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagRefactorAuthPageForTenFoot);
local v23 = game:DefineFastFlag("LuaAppFixOnScreenKeyboardLoginPageScrolling", false);
local v24 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDoraemonLanding);
local v26 = v5.PureComponent:extend("LogoWithContentsLayout");
v26.defaultProps = {
    ContentAlign = v15.Top, 
    topButtonEnabled = true, 
    LuobuLogoEnabled = false, 
    VNAgeBadgeEnabled = false
};
local v27 = nil;
v27 = not v24 and 0 or 16;
local v28 = game:DefineFastFlag("EnableHistoryBasedTopButtonHidingV2", false);
local function v36(v29)
    local v30 = v29.layoutOrder or 0;
    local l_showCloseIcon_0 = v29.showCloseIcon;
    local l_onActivated_0 = v29.onActivated;
    local l_ZIndex_0 = v29.ZIndex;
    local v34 = "LuaApp/icons/navigation/pushBack";
    if l_showCloseIcon_0 then
        v34 = "LuaApp/icons/navigation/close";
    end;
    return l_withStyle_0(function(v35)
        return v5.createElement(v9, {
            LayoutOrder = v30, 
            Size = UDim2.new(0, 27, 0, 27), 
            Position = UDim2.new(0, v27, 0, 0), 
            Image = v34, 
            ImageColor3 = v35.Theme.TextEmphasis.Color, 
            ImageTransparency = v35.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1, 
            ZIndex = l_ZIndex_0, 
            [v5.Event.Activated] = l_onActivated_0
        });
    end);
end;
v26.init = function(v37)
    v37.state = {
        onScreenKeyboardHeight = 0, 
        childrenContainerPosition = Vector2.new(), 
        childrenContainerSize = Vector2.new()
    };
    v37.isMounted = false;
    local v38, v39 = v5.createBinding(Vector2.new());
    v37.canvasPosition = v38;
    v37.updateCanvasPosition = v39;
    v37.onScrollingFrameSizeChanged = function(v40)
        local l_onScreenKeyboardHeight_0 = v37.state.onScreenKeyboardHeight;
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 then
            l_onScreenKeyboardHeight_0 = math.min((l_l_UserInputService_0_FocusedTextBox_0.AbsolutePosition.Y + v40.CanvasPosition.Y) - 20, l_onScreenKeyboardHeight_0);
        end;
        v37.updateCanvasPosition(Vector2.new(0, l_onScreenKeyboardHeight_0));
    end;
    v37.onTopButtonActivated = function()
        local l_topButtonEnabled_0 = v37.props.topButtonEnabled;
        local l_navigateBack_0 = v37.props.navigateBack;
        local l_topButtonActivatedTracking_0 = v37.props.topButtonActivatedTracking;
        if l_topButtonActivatedTracking_0 then
            l_topButtonActivatedTracking_0();
        end;
        if l_topButtonEnabled_0 then
            l_navigateBack_0();
        end;
    end;
    v37.isDoraemonLanding = v25() and v37.props.IsDoraemonLanding;
end;
v26.didMount = function(v46)
    v46.isMounted = true;
    v46.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
        local v48 = not not l_OnScreenKeyboardVisible_0 and l_UserInputService_0.OnScreenKeyboardSize.Y or 0;
        local v49 = true;
        if v48 <= 0 then
            v49 = not l_UserInputService_0:GetFocusedTextBox();
        end;
        if v23 then
            v49 = v49 or not l_OnScreenKeyboardVisible_0;
        end;
        if v49 then
            v46:setState({
                onScreenKeyboardHeight = v48
            });
        end;
    end);
end;
v26.willUnmount = function(v50)
    v50.isMounted = false;
    if v50.keyboardVisibleChanged then
        v50.keyboardVisibleChanged:disconnect();
        v50.keyboardVisibleChanged = nil;
    end;
end;
v26.render = function(v51)
    return l_withStyle_0(function(_)
        local v53 = v51.props[v5.Children];
        local l_ContentAlign_0 = v51.props.ContentAlign;
        local l_statusBarHeight_0 = v51.props.statusBarHeight;
        local l_screenSize_0 = v51.props.screenSize;
        local l_globalGuiInset_0 = v51.props.globalGuiInset;
        local _ = v51.props.navigateBack;
        local l_navigation_0 = v51.props.navigation;
        local v60 = l_navigation_0.history[#l_navigation_0.history];
        local l_name_0 = v60[#v60].name;
        local l_Landing_0 = v12.Landing;
        local v63 = #l_navigation_0.history[#l_navigation_0.history];
        local v64 = v63 - (v13(l_Landing_0, l_navigation_0.history) or 0) <= 1;
        local v65 = nil;
        v65 = if not v28 then l_name_0 ~= l_Landing_0 else v63 > 1;
        local l_LuobuLogoEnabled_0 = v51.props.LuobuLogoEnabled;
        local l_VNAgeBadgeEnabled_0 = v51.props.VNAgeBadgeEnabled;
        local v68 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).Y.Offset - l_statusBarHeight_0;
        local v69 = nil;
        local v70 = nil;
        local v71 = false;
        if not (not l_screenSize_0.X or not l_screenSize_0.Y) and l_screenSize_0.X / l_screenSize_0.Y > 0.5625 then
            v71 = true;
        end;
        if not v71 then
            v69 = "rbxasset://textures/ui/LuaApp/graphic/Auth/DoraemonCompact.png";
            v70 = 0.5625;
        else
            v69 = "rbxasset://textures/ui/LuaApp/graphic/Auth/DoraemonSquare.png";
            v70 = 1;
        end;
        local v72 = nil;
        local v73 = nil;
        if not l_LuobuLogoEnabled_0 and not l_VNAgeBadgeEnabled_0 then
            if v51.props.formFactor == l_FormFactor_0.COMPACT then
                v72 = 0.15;
                v73 = 0.3;
            else
                v72 = 0.25;
                v73 = 0.45;
            end;
        elseif v51.props.formFactor == l_FormFactor_0.COMPACT then
            v72 = 0.3;
            v73 = 0.35;
        else
            v72 = 0.3;
            v73 = 0.4;
        end;
        local v74 = nil;
        local v75 = nil;
        if not l_LuobuLogoEnabled_0 then
            v74 = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png";
            v75 = 5.78;
        else
            v74 = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_luobu.png";
            v75 = 4.05;
        end;
        local v76 = v68 * v72;
        local v77 = v68 * v73;
        local v78 = v68 * 0.05;
        local v79 = UDim2.new(1, 0, v73, v51.state.childrenContainerSize.Y);
        local v80 = {
            [v15.Top] = {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, 
            [v15.Bottom] = {
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1)
            }
        };
        local _ = UDim2.new(0, v51.state.childrenContainerPosition.X + v51.state.childrenContainerSize.X / 2, 0, v51.state.childrenContainerPosition.Y + v51.state.childrenContainerSize.Y / 2);
        local v82 = {
            dampingRatio = 1, 
            frequency = 1 / math.max(l_UserInputService_0.OnScreenKeyboardAnimationDuration, 0.1)
        };
        local l_isDualLayout_0 = v51.props.isDualLayout;
        local _ = v51.props.tokens;
        local l_xOffset_0 = v51.props.tokens.LuaApps.LoginView.xOffset;
        return v5.createElement(v7, {
            includeStatusBar = true, 
            renderFullscreenBackground = function(_)
                if not v51.isDoraemonLanding then
                    return v5.createElement(v8, {
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
                        AspectRatio = 1
                    });
                else
                    return v5.createElement(v8, {
                        Image = v69, 
                        AspectRatio = v70, 
                        TopGradient = true, 
                        BottomContentSize = v51.state.childrenContainerSize.Y + l_globalGuiInset_0.bottom
                    });
                end;
            end
        }, {
            ReverseVignette = nil, 
            AuthScrollingFrame = v5.createElement(l_SpringAnimatedItem_0.AnimatedScrollingFrame, {
                regularProps = {
                    Selectable = (not v22() or not l_GuiService_0:IsTenFootInterface()) and nil, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v5.Children] = {
                        VNAgeBadge = l_VNAgeBadgeEnabled_0 and v5.createElement("ImageLabel", {
                            Position = UDim2.new(0.05, 0, 0, v78), 
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(0, 0), 
                            Size = UDim2.new(0.7, 0, 0.7, 0), 
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/vn_agebadge.png", 
                            ZIndex = 1, 
                            [v5.Children] = {
                                UISizeConstraint = v5.createElement("UISizeConstraint", {
                                    MaxSize = Vector2.new(460, 87.78625954198473)
                                }), 
                                UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = 5.24, 
                                    AspectType = Enum.AspectType.FitWithinMaxSize
                                })
                            }
                        }), 
                        Logo = v5.createElement("ImageLabel", {
                            Position = UDim2.new(0.5, 0, 0, v76), 
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Size = UDim2.new(0.7, 0, 0.7, 0), 
                            Image = v74, 
                            ZIndex = 1, 
                            [v5.Children] = {
                                UISizeConstraint = v5.createElement("UISizeConstraint", {
                                    MaxSize = Vector2.new(460, 460 / v75)
                                }), 
                                UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = v75, 
                                    AspectType = Enum.AspectType.FitWithinMaxSize
                                })
                            }
                        }), 
                        AlignmentContainer = v5.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Position = if not l_isDualLayout_0 then UDim2.new(0.5, 0, 0, v77) else UDim2.new(0, l_xOffset_0, 0, v77), 
                            Size = if not l_isDualLayout_0 then UDim2.new(1, 0, 1, -v77) else UDim2.new(1, -(2 * l_xOffset_0), 1, -v77), 
                            AnchorPoint = if not l_isDualLayout_0 then Vector2.new(0.5, 0) else Vector2.new(0, 0), 
                            ZIndex = 2
                        }, {
                            Content = v5.createElement(v10.FitFrame, {
                                Position = v80[l_ContentAlign_0].Position, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                fitAxis = v10.FitAxis.Height, 
                                AnchorPoint = v80[l_ContentAlign_0].AnchorPoint, 
                                BackgroundTransparency = 1, 
                                [v5.Change.AbsoluteSize] = function(v87)
                                    spawn(function()
                                        if v51.isMounted then
                                            v51:setState({
                                                childrenContainerSize = v87.AbsoluteSize
                                            });
                                            return ;
                                        else
                                            return ;
                                        end;
                                    end);
                                end, 
                                [v5.Change.AbsolutePosition] = function(v88)
                                    spawn(function()
                                        if v51.isMounted then
                                            v51:setState({
                                                childrenContainerPosition = v88.AbsolutePosition
                                            });
                                            return ;
                                        else
                                            return ;
                                        end;
                                    end);
                                end, 
                                [v5.Children] = v53
                            })
                        })
                    }, 
                    CanvasSize = v79, 
                    CanvasPosition = v51.canvasPosition, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 0, 
                    ZIndex = 2, 
                    [v5.Change.AbsoluteSize] = v51.onScrollingFrameSizeChanged
                }, 
                animatedValues = {
                    onScreenKeyboardHeight = v51.state.onScreenKeyboardHeight
                }, 
                mapValuesToProps = function(v89)
                    return {
                        Size = UDim2.new(1, 0, 1, -v89.onScreenKeyboardHeight)
                    };
                end, 
                springOptions = v82
            }), 
            TopButton = not not v65 and v5.createElement(v36, {
                showCloseIcon = v64, 
                onActivated = v51.onTopButtonActivated, 
                ZIndex = 3
            }) or nil
        });
    end);
end;
local v93 = v6.connect(function(v90, _)
    return {
        formFactor = v90.FormFactor, 
        statusBarHeight = v90.TopBar.statusBarHeight, 
        globalGuiInset = v90.GlobalGuiInset, 
        screenSize = v90.ScreenSize, 
        navigation = v90.Navigation
    };
end, function(v92)
    return {
        navigateBack = function()
            return v92(v11());
        end
    };
end)(v26);
return function(v94)
    return v5.createElement(v93, v16.Dictionary.join({
        tokens = l_useDesignTokens_0()
    }, v94));
end;
