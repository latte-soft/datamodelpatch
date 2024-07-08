local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Packages_0 = l_CorePackages_0.Packages;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v4 = require(l_Packages_0.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Packages_0.LuauPolyfill);
local l_setTimeout_0 = v6.setTimeout;
local l_clearTimeout_0 = v6.clearTimeout;
local _ = require(script.Parent.Parent.Parent.Chrome.Service.WindowSizeSignal);
local v10 = require(script.Parent.Parent.Parent.Chrome.Hooks.useWindowSizeIsLarge);
local v11 = require(l_Packages_0.UIBlox);
local l_Interactable_0 = v11.Core.Control.Interactable;
local l_StyledTextLabel_0 = v11.App.Text.StyledTextLabel;
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_withTooltip_0 = v11.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v11.App.Dialog.Enum.TooltipOrientation;
local l_ControlState_0 = v11.Core.Control.Enum.ControlState;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local v20 = require(script.Parent.CameraStatusIcon);
local v21 = require(script.Parent.CameraStatusDot);
local v22 = require(script.Parent.Parent.Utils.SizingUtils);
local v23 = require(script.Parent.Parent.Utils.FaceChatUtils);
local v24 = require(script.Parent.Parent.Utils.ModelUtils);
local v25 = require(script.Parent.Parent.Hooks.useCameraOn);
local v26 = require(script.Parent.Parent.Hooks.useLocalPlayer);
local v27 = require(script.Parent.Parent.Hooks.useTrackerMessage);
local v28 = require(script.Parent.Parent.Hooks.useTooltipDismissal);
local v29 = require(script.Parent.Parent.Parent.Chrome.Unibar.Constants);
local v30 = require(script.Parent.Parent.Parent.Chrome.Service);
local l_SelfieView_0 = script.Parent.Parent.Parent.SelfieView;
local v32 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewPreviewShrinkIcon);
local v33 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewDontWaitForCharacter);
local v34 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewDontStartOnOpen);
local v35 = require(l_SelfieView_0.Flags.GetFFlagSelfieViewHideCameraStatusDot);
local v36 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.SelfView.Analytics).new();
local v37 = l_Images_0["icons/actions/previewShrink"];
local v38 = UDim2.fromOffset(14, 14);
local v39 = v29.CLOSE_BUTTON_SIZE + UDim2.fromOffset(8, 8);
local v40 = require(script.Parent.FaceClone);
return function(v41)
    local l_id_0 = v41.id;
    local v43 = l_useStyle_0();
    local l_Theme_0 = v43.Theme;
    local l_Font_0 = v43.Font;
    local v46 = l_useLocalization_0({
        robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader", 
        robloxPermissionErrorBody = "CoreScripts.TopBar.RobloxPermissionErrorBody", 
        dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader", 
        dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody"
    });
    local v47 = v25();
    local v48 = v27();
    local v49 = v10(v41.windowSize);
    local v51 = l_useSelector_0(function(v50)
        return v22.getSize(v50.displayOptions.screenSize, v49);
    end);
    v4.useEffect(function()
        v41.windowSize:requestSize(v51.X, v51.Y);
    end, {
        v51
    });
    local v52 = v26();
    local v53 = v4.useMemo(function()
        return v23.getPermissions().userCamEligible and v23.getPermissions().placeCamEnabled;
    end);
    local v54, v55, v56, v57 = v28(2000);
    local v58, v59 = v4.useState(true);
    local v60, v61 = v4.useState(false);
    local v62, v63 = v4.useState(false);
    local v64 = v4.useRef(nil);
    local function v65()
        if v64.current then
            l_clearTimeout_0(v64.current);
        end;
        v59(true);
        v64.current = l_setTimeout_0(function()
            v59(false);
        end, 2000);
    end;
    v4.useEffect(function()
        if v64.current then
            l_clearTimeout_0(v64.current);
        end;
        v59(true);
        v64.current = l_setTimeout_0(function()
            v59(false);
        end, 2000);
        return function()
            if v64.current then
                l_clearTimeout_0(v64.current);
            end;
        end;
    end, {
        v64
    });
    local function v67(v66)
        if v64.current then
            l_clearTimeout_0(v64.current);
        end;
        v59(true);
        v64.current = l_setTimeout_0(function()
            v59(false);
        end, 2000);
        if v23.getPermissions().userCamEnabled or v66 then
            if not v33() then
                if not ((v24.hasDynamicHead(v52.Character or v52.CharacterAdded:Wait()) or v23.isCameraOn()) or v66) then
                    v57(v46.dynamicAvatarMissingErrorHeader, v46.dynamicAvatarMissingErrorBody);
                end;
            elseif not (((not v52.Character or v24.hasDynamicHead(v52.Character)) or v23.isCameraOn()) or v66) then
                v57(v46.dynamicAvatarMissingErrorHeader, v46.dynamicAvatarMissingErrorBody);
            end;
            v36:setLastCtx("SelfView");
            v23.toggleVideoAnimation();
            return ;
        else
            v57(v46.robloxPermissionErrorHeader, v46.robloxPermissionErrorBody);
            return ;
        end;
    end;
    local v68 = v4.useCallback(function()
        v67(false);
    end, {
        v23, 
        v24, 
        v46, 
        v52
    });
    local v69 = v4.useCallback(function()
        if v58 then
            v41.windowSize:toggleIsLarge();
        end;
        if v64.current then
            l_clearTimeout_0(v64.current);
        end;
        v59(true);
        v64.current = l_setTimeout_0(function()
            v59(false);
        end, 2000);
    end, {
        v65, 
        v58, 
        v41.windowSize
    });
    local v70 = v4.useRef(nil);
    v4.useEffect(function()
        if not _G.__TESTEZ_RUNNING_TEST__ then
            local v71 = v40(v52, v70.current);
            if not ((v23.isCameraOn() or v41.isDraggedOut) or v34()) then
                v67(true);
            end;
            return function()
                if v71 then
                    v71();
                end;
            end;
        else
            return ;
        end;
    end, {
        v52, 
        v70
    });
    local v74 = v4.useCallback(function(_, v73)
        v63(v73 == l_ControlState_0.Hover);
    end, {
        v63
    });
    return v4.createElement("Frame", {
        Name = "SelfieViewFrame", 
        Active = true, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0, 
        [v4.Event.MouseEnter] = v65, 
        [v4.Event.MouseMoved] = v65, 
        ref = v70
    }, {}, {
        CloseButtonWrapper = v58 and v4.createElement("Frame", {
            ZIndex = 2, 
            BackgroundTransparency = 1, 
            Size = v29.CLOSE_BUTTON_FRAME
        }, {
            CloseButtonLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            CloseButtonPadding = if not v32() then nil else v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            CloseButtonInteractable = v4.createElement(l_Interactable_0, {
                Size = v29.CLOSE_BUTTON_FRAME, 
                BackgroundTransparency = 1, 
                onStateChanged = v4.useCallback(function(_, v76)
                    v61(v76 == l_ControlState_0.Hover);
                end, {
                    v61
                }), 
                [v4.Event.Activated] = function()
                    v30:toggleWindow(l_id_0);
                end
            }, {
                CloseImage = if not v32() then nil else v4.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(28, 28), 
                    Position = UDim2.fromOffset(2, 2), 
                    Image = v37, 
                    ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                    ImageTransparency = l_Theme_0.TextEmphasis.Transparency
                }), 
                Fragment = if v32() then nil else v4.createElement(v4.Fragment, nil, {
                    v4.createElement("Frame", {
                        Name = "X1", 
                        Position = v38, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Size = UDim2.new(0, 16, 0, 2), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v43.Theme.IconEmphasis.Color, 
                        BackgroundTransparency = 0, 
                        Rotation = 45
                    }, {
                        Corner = v4.createElement("UICorner")
                    }), 
                    (v4.createElement("Frame", {
                        Name = "X2", 
                        Position = v38, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Size = UDim2.new(0, 16, 0, 2), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v43.Theme.IconEmphasis.Color, 
                        BackgroundTransparency = 0, 
                        Rotation = -45
                    }, {
                        Corner = v4.createElement("UICorner")
                    }))
                }), 
                Hover = v4.createElement("Frame", {
                    Size = v39, 
                    Position = if not v32() then nil else UDim2.fromOffset(1, 1), 
                    Visible = v60, 
                    BackgroundTransparency = v43.Theme.BackgroundOnHover.Transparency, 
                    BackgroundColor3 = v43.Theme.BackgroundOnHover.Color
                }, {
                    Corner = v4.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            })
        }), 
        Corners = v4.createElement("UICorner", {}), 
        ControlMessage = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -44), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ZIndex = 2, 
            BorderSizePixel = 0, 
            Visible = v48.visible
        }, {
            Corners = v4.createElement("UICorner", {}), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 8)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Line1 = v4.createElement(l_StyledTextLabel_0, {
                text = v48.text, 
                fontStyle = l_Font_0.Footer, 
                colorStyle = l_Theme_0.TextDefault, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 1, 
                size = UDim2.fromOffset(46, 36), 
                TextWrapped = true
            }), 
            Line2 = v4.createElement(l_StyledTextLabel_0, {
                text = v48.status, 
                fontStyle = l_Font_0.Footer, 
                colorStyle = l_Theme_0.ContextualPrimaryContent, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 2, 
                size = UDim2.fromOffset(46, 12), 
                automaticSize = Enum.AutomaticSize.Y
            })
        }), 
        IconFrame = (not not v58 and v53) and v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 44), 
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            ZIndex = 2
        }, {
            Tooltip = l_withTooltip_0({
                headerText = v54, 
                bodyText = v55, 
                textXAlignment = Enum.TextXAlignment.Left
            }, {
                guiTarget = l_CoreGui_0, 
                active = v56, 
                DisplayOrder = 101, 
                preferredOrientation = l_TooltipOrientation_0.Bottom
            }, (v4.useCallback(function(v77)
                return v4.createElement(l_Interactable_0, {
                    Size = UDim2.fromOffset(38, 38), 
                    BackgroundTransparency = 1, 
                    onStateChanged = v74, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    [v4.Change.AbsoluteSize] = v77, 
                    [v4.Change.AbsolutePosition] = v77, 
                    [v4.Event.Activated] = v68
                });
            end, {
                v74, 
                v68
            }))), 
            Hover = v4.createElement("Frame", {
                Size = UDim2.fromOffset(38, 38), 
                Visible = v62, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = v43.Theme.BackgroundOnHover.Transparency, 
                BackgroundColor3 = v43.Theme.BackgroundOnHover.Color
            }, {
                Corner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            }), 
            CameraStatusIcon = v4.createElement(v20, {
                iconSize = UDim2.fromOffset(28, 28), 
                transparency = v23.getPermissions().userCamEnabled and 0 or 0.5
            })
        }) or nil, 
        FocusDarken = not not v58 and v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 0.7, 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            ZIndex = 2
        }, {
            Corners = v4.createElement("UICorner", {})
        }) or nil, 
        CameraStatusDot = if not v35() then v47 and v4.createElement(v21, {
            Position = UDim2.new(1, -5, 0, 5), 
            AnchorPoint = Vector2.new(1, 0), 
            ZIndex = 2
        }) or nil else nil, 
        Interactable = v4.createElement(l_Interactable_0, {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            [v4.Event.Activated] = v69
        })
    });
end;
