local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.UIBlox);
local l_Interactable_0 = v7.Core.Control.Interactable;
local l_ControlState_0 = v7.Core.Control.Enum.ControlState;
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_Images_0 = v7.App.ImageSet.Images;
local l_SelectionCursorProvider_0 = v7.App.SelectionImage.SelectionCursorProvider;
local l_Presentation_0 = script.Parent.Presentation;
local v16 = require(l_Presentation_0.MenuIcon);
local v17 = require(l_Presentation_0.BackIcon);
local v18 = require(l_Presentation_0.ChatIcon);
local v19 = require(l_Presentation_0.MoreMenu);
local v20 = require(l_Presentation_0.HealthBar);
local v21 = require(l_Presentation_0.HurtOverlay);
local v22 = require(l_Presentation_0.GamepadMenu);
local v23 = require(l_Presentation_0.HeadsetMenu);
local v24 = require(l_Presentation_0.VoiceBetaBadge);
local v25 = require(l_Presentation_0.BadgeOver13);
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local _ = require(script.Parent.Parent.Parent.ExperienceMenuABTestManager);
local _ = require(script.Parent.Parent.Parent.IsExperienceMenuABTestEnabled);
local v29 = require(l_Chrome_0.Onboarding.OnboardingTooltip);
local v30 = require(l_Chrome_0.Enabled);
local _ = require(l_Chrome_0.Unibar.Constants);
local v32 = require(l_Chrome_0.Flags.GetFFlagEnableChromeAnalytics)();
local v33 = nil;
local v34 = nil;
local v35 = nil;
if v30() then
    v33 = require(l_Chrome_0.Unibar);
end;
if game:GetEngineFeature("InGameChromeSignalAPI") then
    v34 = require(l_Chrome_0.Service.KeepOutAreasHandler);
    if v32 then
        v35 = require(l_Chrome_0.Analytics);
    end;
end;
local v36 = require(script.Parent.Connection);
local l_Parent_0 = l_Presentation_0.Parent.Parent;
local v38 = require(l_Parent_0.Constants);
local v39 = require(l_Parent_0.Flags.GetFFlagChangeTopbarHeightCalculation);
local v40 = require(l_Parent_0.Flags.GetFFlagFixDupeBetaBadge);
local v41 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v42 = require(l_Parent_0.Actions.SetScreenSize);
local v43 = require(l_Parent_0.Actions.SetKeepOutArea);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v45 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v46 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v47 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v48 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadge);
local v49 = game:DefineFastFlag("TopBarUseNewBadge", false);
local v50 = game:DefineFastFlag("ControlBetaBadgeWithGuac", false);
local v51 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableTeleportBackButton);
local v52 = require(l_RobloxGui_0.Modules.Flags.FFlagVRMoveVoiceIndicatorToBottomBar);
local v53 = require(script.Parent.Parent.Parent.Flags.GetFFlagAddOver12TopBarBadge);
local v54 = require(script.Parent.Parent.Parent.Chrome.Flags.GetFFlagEnableChromeFTUX);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v56 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v57 = require(script.Parent.Parent.TopBarAppPolicy);
local v58 = require(l_RobloxGui_0.Modules.VR.VRBottomBar.VRBottomBar);
local v59 = not v47() and 30 or v38.TopBarHeight - 4;
local function _(v60)
    return v60.displayOptions.menuOpen or v60.displayOptions.inspectMenuOpen;
end;
local v62 = v4.PureComponent:extend("TopBarApp");
v62.validateProps = v6.strictInterface({
    menuOpen = v6.optional(v6.boolean), 
    inspectMenuOpen = v6.optional(v6.boolean), 
    displayBetaBadge = v6.boolean, 
    setScreenSize = v6.callback, 
    setKeepOutArea = v6.callback, 
    showBadgeOver12 = v6.optional(v6.boolean)
});
v62.init = function(v63)
    local v64, v65 = v4.createBinding(UDim2.new());
    v63.unibarRightSidePosition = v64;
    v63.setUnibarRightSidePosition = v65;
    v64, v65 = v4.createBinding(false);
    v63.closeButtonState = v64;
    v63.setCloseButtonState = v65;
    v64, v65 = v4.createBinding(false);
    v63.badgeOver13Visible = v64;
    v63.setBadgeOver13Visible = v65;
    v63.onCloseBtnStateChange = function(_, v67)
        v63.setCloseButtonState(v67);
    end;
    if v30() then
        v63:setState({
            unibarAlignment = require(l_Chrome_0.Service):orderAlignment():get()
        });
    end;
end;
v62.didMount = function(v68)
    if v30() then
        local v69 = require(l_Chrome_0.Service);
        v68.orderAlignmentConnection = v69:orderAlignment():connect(function()
            v68:setState({
                unibarAlignment = v69:orderAlignment():get()
            });
        end);
    end;
end;
v62.willUnmount = function(v70)
    if not (not v30() or not v70.orderAlignmentConnection) then
        v70.orderAlignmentConnection:disconnect();
        v70.orderAlignmentConnection = nil;
    end;
end;
v62.render = function(v71)
    return l_withStyle_0(function(v72)
        return v71:renderWithStyle(v72);
    end);
end;
v62.renderWithStyle = function(v73, v74)
    local v75 = v30();
    local v76 = v48() and not v75;
    local v77 = nil;
    if v50 then
        if not v40() then
            v76 = v73.props.displayBetaBadge;
        else
            v77 = v73.props.displayBetaBadge;
        end;
    end;
    local l_Right_0 = Enum.HorizontalAlignment.Right;
    if v73.state.unibarAlignment ~= nil then
        l_Right_0 = v73.state.unibarAlignment;
    end;
    local l_ScreenSideOffset_0 = v38.ScreenSideOffset;
    local v80 = if v47() then v38.TopBarHeight else 36;
    if v39() then
        v80 = v38.TopBarHeight;
    end;
    if v45:IsEnabled() then
        l_ScreenSideOffset_0 = v38.ScreenSideOffsetTenFoot;
        v80 = v38.TopBarHeightTenFoot;
    end;
    local v81 = not (v73.props.menuOpen or v73.props.inspectMenuOpen);
    local v82 = UDim2.new(0, 0, 0, not v39() and 0 or v38.TopBarTopMargin);
    local v83 = v80 - v38.TopBarTopMargin;
    local v84 = UDim2.new(0, l_ScreenSideOffset_0, 0, 0);
    local v85 = UDim2.new(1, -l_ScreenSideOffset_0, 0, 0);
    local v86 = UDim2.new(1, -l_ScreenSideOffset_0, 0, v38.TopBarTopMargin);
    local v87 = UDim2.new(0, 0, 0.5, 0);
    return v4.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 6, 
        [v4.Change.AbsoluteSize] = function(v88)
            v73.props.setScreenSize(v88.AbsoluteSize);
        end
    }, {
        Connection = v4.createElement(v36), 
        GamepadMenu = v4.createElement(v22), 
        HeadsetMenu = v4.createElement(v23), 
        VRBottomBar = not not l_VRService_0.VREnabled and if not v52 then v4.createElement(v58) else v4.createElement(v56.Provider, {}, {
            VRBottomBar = v56.withVoiceState(function(v89)
                return v4.createElement(v58, {
                    voiceChatServiceManager = l_default_0, 
                    voiceEnabled = v89.voiceEnabled, 
                    voiceState = v89.voiceState
                });
            end)
        }) or nil, 
        KeepOutAreasHandler = if not not v41 and v34 then v4.createElement(v34) else nil, 
        FullScreenFrame = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v81
        }, {
            HurtOverlay = v4.createElement(v21)
        }), 
        MenuIconHolder = v47() and v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_ScreenSideOffset_0, 0, not v39() and 0 or v38.TopBarTopMargin), 
            Size = UDim2.new(1, 0, 0, if not v39() then v80 else v83)
        }, {
            MenuIcon = v4.createElement(v16, {
                iconScale = not v73.props.menuOpen and 1 or 1.25, 
                layoutOrder = 1, 
                showBadgeOver12 = if not v53() then nil else v73.props.showBadgeOver12
            })
        }), 
        LegacyCloseMenu = (not v33 and not v46()) and v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_ScreenSideOffset_0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v80), 
            Visible = v73.props.menuOpen
        }, {
            CloseMenuButtonRound = not not v33 and v4.createElement(l_Interactable_0, {
                onStateChanged = v73.onCloseBtnStateChange, 
                Visible = not v45:IsEnabled(), 
                BackgroundTransparency = v74.Theme.Overlay.Transparency, 
                Position = v87, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v59, 0, v59), 
                BackgroundColor3 = v74.Theme.Overlay.Color, 
                [v4.Event.Activated] = function()
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }, {
                UICorner = not not v75 and v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) or nil, 
                Line1 = v4.createElement("Frame", {
                    Name = "TopLine", 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Size = UDim2.new(0, 16, 0, 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Rotation = 45
                }), 
                Line2 = v4.createElement("Frame", {
                    Name = "BottomLine", 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Size = UDim2.new(0, 16, 0, 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Rotation = -45
                }), 
                StateOverlayRound = not v75 and v4.createElement("Frame", {
                    BackgroundTransparency = v73.closeButtonState:map(function(v90)
                        if v90 == l_ControlState_0.Pressed then
                            return v74.Theme.BackgroundOnPress.Transparency;
                        elseif v90 == l_ControlState_0.Hover then
                            return v74.Theme.BackgroundOnHover.Transparency;
                        else
                            return 1;
                        end;
                    end), 
                    BackgroundColor3 = v73.closeButtonState:map(function(v91)
                        if v91 == l_ControlState_0.Pressed then
                            return v74.Theme.BackgroundOnPress.Color;
                        elseif v91 == l_ControlState_0.Hover then
                            return v74.Theme.BackgroundOnHover.Color;
                        else
                            return Color3.new(1, 1, 1);
                        end;
                    end), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 2
                }, {
                    UICorner = not not v75 and v4.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) or nil
                }) or nil
            }) or nil, 
            CloseMenuButton = not v33 and v4.createElement(l_ImageSetButton_0, {
                Visible = not v45:IsEnabled(), 
                BackgroundTransparency = 1, 
                Position = v87, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v59, 0, v59), 
                Image = l_Images_0["icons/controls/close-ingame"], 
                [v4.Event.Activated] = function()
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }) or nil
        }), 
        UnibarOnboarding = if not v54() then nil else v4.createElement(v29), 
        UnibarLeftFrame = (not not v33 and l_Right_0 == Enum.HorizontalAlignment.Left) and v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if not v39() then v80 else v83), 
            Position = if not v39() then v85 else v86, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ChromeAnalytics = if not v35 then nil else v4.createElement(v35), 
            KeepOutAreasHandler = if not v41 and v34 then v4.createElement(v34) else nil, 
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2), 
                PaddingLeft = UDim.new(0, ((l_ScreenSideOffset_0 + v38.Padding) + v38.TopBarHeight) + 2)
            }), 
            VoiceStateContext = v4.createElement(v56.Provider, {}, {
                CursorProvider = v4.createElement(l_SelectionCursorProvider_0, {}, {
                    Unibar = v4.createElement(v33, {
                        layoutOrder = 1, 
                        onAreaChanged = v73.props.setKeepOutArea, 
                        onMinWidthChanged = function(v92)
                            v73.setUnibarRightSidePosition(UDim2.new(0, v92, 0, 0));
                        end
                    })
                })
            }), 
            StackedElements = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = v73.unibarRightSidePosition, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v38.Padding)
                }), 
                Layout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v38.Padding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                BackIcon = not not v51() and v4.createElement(v17, {
                    layoutOrder = 1
                }) or nil, 
                HealthBar = v4.createElement(v20, {
                    layoutOrder = 10
                }), 
                CenterBadgeOver13 = if not v49 then nil else v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    LayoutOrder = 4, 
                    Visible = v73.badgeOver13Visible
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    BadgeOver13 = v4.createElement(v25, {
                        layoutOrder = 1, 
                        analytics = l_Analytics_0.new(), 
                        player = l_Players_0.LocalPlayer, 
                        voiceChatServiceManager = l_default_0, 
                        VRService = game:GetService("VRService"), 
                        visibilityChanged = v73.setBadgeOver13Visible
                    })
                }), 
                VoiceBetaBadge = if not not v48() and (not v40() or v77) then v4.createElement(v24, {
                    layoutOrder = 6, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            })
        }) or nil, 
        UnibarRightFrame = (not not v33 and l_Right_0 == Enum.HorizontalAlignment.Right) and v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if not v39() then v80 else v83), 
            Position = if not v39() then v85 else v86, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ChromeAnalytics = if not v35 then nil else v4.createElement(v35), 
            KeepOutAreasHandler = if not v41 and v34 then v4.createElement(v34) else nil, 
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            Layout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, v38.Padding), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            HealthBar = v4.createElement(v20, {
                layoutOrder = 1
            }), 
            VoiceStateContext = v4.createElement(v56.Provider, {}, {
                CursorProvider = v4.createElement(l_SelectionCursorProvider_0, {}, {
                    Unibar = v4.createElement(v33, {
                        onAreaChanged = v73.props.setKeepOutArea, 
                        layoutOrder = 2
                    })
                })
            })
        }) or nil, 
        TopBarFrame = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, if not v39() then v80 else v83), 
            Visible = v81, 
            Position = v82
        }, {
            LeftFrame = not v45:IsEnabled() and v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -l_ScreenSideOffset_0, 1, 0), 
                Position = v84
            }, {
                Layout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v38.Padding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = if not v49 then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Blank = v75 and v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v38.TopBarHeight - 4, 0, 1), 
                    BackgroundTransparency = 1
                }), 
                MenuIcon = not v47() and v4.createElement(v16, {
                    layoutOrder = 1, 
                    showBadgeOver12 = if not v53() then nil else v73.props.showBadgeOver12
                }), 
                BackIcon = (not v75 and v51()) and v4.createElement(v17, {
                    layoutOrder = 2
                }) or nil, 
                ChatIcon = not v75 and v4.createElement(v18, {
                    layoutOrder = 3
                }) or nil, 
                BadgeOver13 = if not v49 or v75 then nil else v4.createElement(v25, {
                    layoutOrder = 4, 
                    analytics = l_Analytics_0.new(), 
                    player = l_Players_0.LocalPlayer, 
                    voiceChatServiceManager = l_default_0, 
                    VRService = game:GetService("VRService"), 
                    visibilityChanged = nil
                }), 
                VoiceBetaBadge = if not not v76 and (not v40() or v77) then v4.createElement(v24, {
                    layoutOrder = 4, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            }), 
            RightFrame = not v33 and v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -l_ScreenSideOffset_0, 1, 0), 
                Position = v85, 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v38.Padding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = v4.createElement(v20, {
                    layoutOrder = 1
                }), 
                MoreMenu = not v45:IsEnabled() and v4.createElement(v19, {
                    layoutOrder = 2
                })
            }) or nil
        })
    });
end;
return v5.UNSTABLE_connect2(function(v93)
    return {
        menuOpen = v93.displayOptions.menuOpen, 
        inspectMenuOpen = v93.displayOptions.inspectMenuOpen
    };
end, function(v94)
    return {
        setScreenSize = function(v95)
            return v94(v42(v95));
        end, 
        setKeepOutArea = function(v96, v97, v98)
            return v94(v43(v96, v97, v98));
        end
    };
end)((v57.connect(function(v99, _)
    return {
        displayBetaBadge = v99.getDisplayVoiceBetaBadge(), 
        showBadgeOver12 = if not v53() then nil else v99.showBadgeOver12()
    };
end)(v62)));
