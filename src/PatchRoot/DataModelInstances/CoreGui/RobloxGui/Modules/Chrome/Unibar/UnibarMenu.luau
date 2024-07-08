local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Service);
local v7 = require(l_Parent_0.Service.ChromeUtils);
local v8 = require(l_Parent_0.Service.ViewportUtil);
local v9 = require(l_Parent_0.Analytics.ChromeAnalytics);
local _ = require(l_Parent_0.Integrations);
local v11 = require(script.Parent.SubMenu);
local v12 = require(script.Parent.WindowManager);
local v13 = require(script.Parent.Constants);
local v14 = require(script.Parent.HealthBar);
local v15 = require(l_Parent_0.Hooks.useChromeMenuItems);
local v16 = require(l_Parent_0.Hooks.useChromeMenuStatus);
local v17 = require(l_Parent_0.Hooks.useObservableValue);
local v18 = require(l_Parent_0.Hooks.useMappedObservableValue);
local v19 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.PlayerList.PlayerListInitialVisibleState);
local v20 = require(script.Parent.ComponentHosts.IconHost);
local v21 = require(l_CorePackages_0.Packages.ReactOtter);
local v22 = require(l_Parent_0.Flags.GetFFlagUnibarRespawn);
local v23 = require(l_Parent_0.Flags.GetFFlagEnableSaveUserPins);
local v24 = require(l_Parent_0.Flags.GetFFlagEnableChromePinAnalytics);
local v25 = require(l_Parent_0.Flags.GetFFlagEnableUnibarSneakPeak);
local v26 = require(l_Parent_0.Flags.GetFFlagNewUnibarIA);
local v27 = require(l_Parent_0.Flags.GetFFlagEnableChromePinIntegrations);
local v28 = require(script.Parent.Parent.Flags.GetFFlagEnableChromePinnedChat)();
local v29 = require(l_Parent_0.Flags.GetFFlagOpenControlsOnMenuOpen);
local v30 = require(l_Parent_0.Flags.GetFFlagEnableSubmenuTruncationFix);
local l_GetFFlagSupportCompactUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSupportCompactUtility;
local v32 = require(l_Parent_0.Flags.GetFFlagUsePolishedAnimations);
local l_GetFFlagEnableScreenshotUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility;
local v34 = require(l_Parent_0.Flags.GetFIntIconSelectionTimeout);
configureUnibar = function(v35)
    local v36 = {
        "leaderboard", 
        "emotes", 
        "backpack"
    };
    if v22() then
        table.insert(v36, "respawn");
    end;
    if v26() then
        table.insert(v36, 1, "trust_and_safety");
    end;
    if not ((not v19() or v27() and v6:isUserPinned("leaderboard")) or v23()) then
        v6:setRecentlyUsed("leaderboard", true);
    end;
    if (not v26() or not v27()) or v6:isUserPinned("trust_and_safety") then
        if not (not v26() or v6:isMostRecentlyUsed("trust_and_safety")) then
            v6:setRecentlyUsed("trust_and_safety", true);
        end;
    elseif not v23() then
        v6:setUserPin("trust_and_safety", true);
        if v24() then
            v9.default:setPin("trust_and_safety", true, v6:userPins());
        end;
    end;
    if not v26() or not v27() then
        if not v26() then
            if not v28 or v35.tinyPortrait then
                v6:configureMenu({
                    {
                        "trust_and_safety"
                    }, 
                    {
                        "selfie_view", 
                        "toggle_mic_mute", 
                        "dummy_window", 
                        "dummy_window_2"
                    }, 
                    {
                        v6.Key.MostRecentlyUsed, 
                        "nine_dot", 
                        "chrome_toggle"
                    }
                });
                table.insert(v36, 1, "chat");
                if not v6:isMostRecentlyUsed("chat") then
                    v6:setRecentlyUsed("chat", true);
                end;
            else
                v6:removeRecentlyUsed("chat");
                v6:configureMenu({
                    {
                        "trust_and_safety"
                    }, 
                    {
                        "selfie_view", 
                        "toggle_mic_mute", 
                        "dummy_window", 
                        "dummy_window_2"
                    }, 
                    {
                        "chat", 
                        v6.Key.MostRecentlyUsed, 
                        "nine_dot", 
                        "chrome_toggle"
                    }
                });
            end;
        else
            v6:configureMenu({
                {
                    "selfie_view", 
                    "toggle_mic_mute", 
                    "chat", 
                    "dummy_window", 
                    "dummy_window_2"
                }, 
                {
                    v6.Key.MostRecentlyUsed, 
                    "nine_dot", 
                    "chrome_toggle"
                }
            });
        end;
    else
        v6:configureMenu({
            {
                "selfie_view", 
                "toggle_mic_mute", 
                "chat", 
                "dummy_window", 
                "dummy_window_2"
            }, 
            {
                v6.Key.UserPinned, 
                v6.Key.MostRecentlyUsed, 
                "nine_dot", 
                "chrome_toggle"
            }
        });
    end;
    if l_GetFFlagEnableScreenshotUtility_0() then
        if not v30() then
            table.insert(v36, "camera_entrypoint");
        else
            table.insert(v36, 2, "camera_entrypoint");
        end;
        v6:configureCompactUtility("camera_utility", {
            {
                "captures", 
                "screenshot", 
                not v32() and "chrome_toggle" or "compact_utility_back"
            }
        });
    end;
    v6:configureSubMenu("nine_dot", v36);
end;
if not v26() then
    local v37 = nil;
    do
        local l_v37_0 = v37;
        v8.viewport:connect(function(v39)
            local l_tinyPortrait_0 = v39.tinyPortrait;
            if l_tinyPortrait_0 ~= l_v37_0 then
                configureUnibar(v39);
                l_v37_0 = l_tinyPortrait_0;
            end;
        end, true);
    end;
else
    configureUnibar({
        tinyPortrait = false
    });
end;
IconDivider = function(v41)
    local v42 = l_useStyle_0();
    return v3.createElement("Frame", {
        Position = v41.position, 
        Size = UDim2.new(0, v13.DIVIDER_CELL_WIDTH, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        DividerBar = v3.createElement("Frame", {
            Position = UDim2.new(0, 2, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, 1, 0, 28), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v42.Theme.Divider.Color, 
            BackgroundTransparency = if not not v32() and v41.toggleTransition then v41.toggleTransition:map(function(v43)
                return v42.Theme.Divider.Transparency + (1 - v43) * (1 - v42.Theme.Divider.Transparency);
            end) else v42.Theme.Divider.Transparency, 
            Visible = v41.visible or true
        })
    });
end;
AnimationStateHelper = function(v44)
    local v45 = v3.useRef(false);
    local v46 = v3.useRef(false);
    local v47 = v16() == v6.MenuStatus.Open;
    local v48 = v17(v6:selectedItem());
    v3.useEffect(function()
        if not v47 then
            if not v29() then
                l_ContextActionService_0:UnbindCoreAction("RBXEscapeUnibar");
            end;
            if not (not l_GuiService_0.SelectedCoreObject or not v44.menuFrameRef.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject)) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            if not ((not v29() or not l_GuiService_0.MenuIsOpen) or not v45.current) then
                v46.current = true;
            end;
            if not v32() then
                v44.setToggleTransition(v21.spring(0, v13.MENU_ANIMATION_SPRING));
            else
                v44.setToggleIconTransition((v21.spring(0, v13.MENU_ANIMATION_SPRING)));
                v44.setToggleWidthTransition((v21.spring(0, v13.MENU_ANIMATION_SPRING)));
            end;
        else
            local v49 = v6:getLastInputToOpenMenu();
            local v50 = true;
            if v49 ~= Enum.UserInputType.MouseButton1 then
                v50 = v49 == Enum.UserInputType.Touch;
            end;
            if not v50 then
                if not v29() then
                    l_ContextActionService_0:BindCoreAction("RBXEscapeUnibar", function()
                        if not v25() then
                            v6:toggleOpen();
                            return ;
                        else
                            v6:close();
                            return ;
                        end;
                    end, false, Enum.KeyCode.Escape);
                end;
                if v44.menuFrameRef.current then
                    l_GuiService_0:Select(v44.menuFrameRef.current);
                end;
            end;
            if not ((not v29() or not l_GuiService_0.MenuIsOpen) or not v46.current) then
                v45.current = false;
                v46.current = false;
            end;
            if not v32() then
                v44.setToggleTransition(v21.spring(1, v13.MENU_ANIMATION_SPRING));
            else
                v44.setToggleIconTransition(v21.instant(0));
                task.wait();
                v44.setToggleIconTransition((v21.spring(1, v13.MENU_ANIMATION_SPRING)));
                v44.setToggleWidthTransition((v21.spring(1, v13.MENU_ANIMATION_SPRING)));
            end;
        end;
        local v51 = nil;
        local v52 = nil;
        if v29() then
            v51 = l_GuiService_0.MenuOpened:Connect(function()
                if not (not (v6:status():get() ~= v6.MenuStatus.Open) or not l_GetFFlagSupportCompactUtility_0()) then
                    v6:open(true);
                    v45.current = true;
                end;
            end);
            v52 = l_GuiService_0.MenuClosed:Connect(function()
                if not (((not v45.current or v7.isTakingScreenshot()) or l_GetFFlagSupportCompactUtility_0() and v6:getCurrentUtility():get()) or not l_GetFFlagSupportCompactUtility_0()) then
                    v6:close();
                    v45.current = false;
                    v46.current = false;
                end;
            end);
        end;
        return function()
            if not (not v29() or not v51) then
                v51:Disconnect();
            end;
            if not (not v29() or not v52) then
                v52:Disconnect();
            end;
        end;
    end, {
        v47, 
        v17(v6:getCurrentUtility()) ~= nil
    });
    v3.useEffect(function()
        if not v32() then
            if not (not v44.menuFrameRef.current or not v48) then
                local l_FirstChild_0 = v44.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v48, true);
                if l_FirstChild_0 then
                    l_GuiService_0.SelectedCoreObject = l_FirstChild_0;
                end;
            end;
            return ;
        else
            coroutine.resume((coroutine.create(function()
                local v54 = 0;
                while true do
                    if v54 < v34() then
                        v54 = v54 + 1;
                        task.wait();
                        if not (not v44.menuFrameRef.current or not v48) then
                            local l_FirstChild_1 = v44.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v48, true);
                            if l_FirstChild_1 then
                                l_GuiService_0.SelectedCoreObject = l_FirstChild_1;
                                return ;
                            end;
                        end;
                    else
                        return ;
                    end;
                end;
            end)));
            return ;
        end;
    end, {
        v48
    });
    return nil;
end;
linearInterpolation = function(v56, v57, v58)
    return v56 * (1 - v58) + v57 * v58;
end;
IconPositionBinding = function(v59, v60, v61, v62, v63, v64, v65, v66, v67)
    return (v3.joinBindings({
        v59, 
        v63, 
        v64
    }):map(function(v68)
        local v69 = 0;
        v69 = if not v67.current then linearInterpolation(v60, v61, v68[2]) else linearInterpolation(v61, v60, v68[2]);
        local l_v62_0 = v62;
        if not (not v66 or v65) then
            l_v62_0 = v62 - v68[3];
        end;
        return UDim2.new(0, l_v62_0 + (v69 - l_v62_0) * v68[1], 0, 0);
    end));
end;
isLeft = function(v71)
    return v71 == Enum.HorizontalAlignment.Left;
end;
Unibar = function(v72)
    local v73 = {};
    local v74 = v3.useRef({});
    local v75 = v3.useRef(Vector2.zero);
    local v76 = false;
    local v77 = v74.current or {};
    local v78 = v15();
    local v79 = v6:status():get() == v6.MenuStatus.Open;
    local v80, v81 = v21.useAnimatedBinding(not v79 and 0 or 1);
    local v82, v83 = v21.useAnimatedBinding(not v79 and 0 or 1);
    local v84, v85 = v21.useAnimatedBinding(not v79 and 0 or 1);
    local v86, v87 = v21.useAnimatedBinding(0);
    local v88, v89 = v21.useAnimatedBinding(1);
    local v90 = v3.useRef(false);
    local v91 = v3.useRef(0);
    local v92 = {};
    local v93 = 0;
    local v94 = 0;
    local v95 = 0;
    local v96 = 0;
    local v97 = 0;
    local v100 = v3.useCallback(function(v98)
        local l_zero_0 = Vector2.zero;
        if v98 then
            l_zero_0 = v98.AbsolutePosition;
            if l_zero_0 ~= v75.current then
                v75.current = l_zero_0;
                v6:setMenuAbsolutePosition(l_zero_0);
            end;
        end;
        if not (not v98 or not v72.onAreaChanged) then
            v72.onAreaChanged(v13.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, v98.AbsoluteSize);
        end;
    end, {});
    local v102 = v3.joinBindings({
        if not v32() then v80 else v84, 
        v86
    }):map(function(v101)
        return UDim2.new(0, linearInterpolation(v96, v101[2], v101[1]), 0, v13.ICON_CELL_WIDTH);
    end);
    local v103 = v18(v6:orderAlignment(), isLeft);
    for _, v105 in v78, nil, nil do
        if v105.integration.availability:get() == v6.AvailabilitySignal.Pinned then
            v93 = v93 + 1;
        end;
    end;
    local v106 = 0;
    v106 = if not v103 then math.max(v93 - 1, 0) else 1;
    for v107, v108 in v78, nil, nil do
        if not v108.isDivider then
            if v108.integration then
                local v109 = false;
                local v110 = v94 + v13.ICON_CELL_WIDTH * v106;
                if v108.integration.availability:get() == v6.AvailabilitySignal.Pinned then
                    v109 = true;
                    v110 = v95;
                end;
                local v111 = if v77[v108.id] == nil then v94 else v77[v108.id];
                v73[v108.id] = v94;
                v76 = v76 or v111 ~= v94;
                local v112 = IconPositionBinding(if not v32() then v80 else v82, v111, v94, v110, v88, v86, v109, v103, v90);
                local _ = nil;
                v92[v108.id or "icon" .. v107] = v3.createElement(v20, {
                    position = v112, 
                    visible = v109 or if not v103 then v3.joinBindings({
                        v112, 
                        v102
                    }):map(function(v114)
                        return v114[1].X.Offset <= v114[2].X.Offset - v13.ICON_CELL_WIDTH * 1.5;
                    end) else v3.joinBindings({
                        v112, 
                        v102
                    }):map(function(v115)
                        return v13.ICON_CELL_WIDTH * 0.5 <= v115[1].X.Offset;
                    end), 
                    toggleTransition = if not v32() then v80 else v82, 
                    integration = v108
                });
                v94 = v94 + v13.ICON_CELL_WIDTH;
                if v109 then
                    v95 = v95 + v13.ICON_CELL_WIDTH;
                end;
            end;
        else
            local v116 = v94 + v13.ICON_CELL_WIDTH * v106;
            local v117 = v77[v108.id] or v94;
            v73[v108.id] = v94;
            v76 = v76 or v117 ~= v94;
            local v118 = IconPositionBinding(if not v32() then v80 else v82, v117, v94, v116, v88, v86, false, v103, v90);
            local _ = nil;
            v92[v108.id or "icon" .. v107] = v3.createElement(IconDivider, {
                position = v118, 
                visible = if not v103 then v3.joinBindings({
                    v118, 
                    v102
                }):map(function(v120)
                    return v120[1].X.Offset <= v120[2].X.Offset - v13.ICON_CELL_WIDTH;
                end) else v3.joinBindings({
                    v118, 
                    v102
                }):map(function(v121)
                    return v13.ICON_CELL_WIDTH * 0.5 <= v121[1].X.Offset;
                end), 
                toggleTransition = if not v32() then nil else v84
            });
            v94 = v94 + v13.DIVIDER_CELL_WIDTH;
        end;
    end;
    v96 = v13.ICON_CELL_WIDTH * v93;
    if v72.onMinWidthChanged then
        v72.onMinWidthChanged(v96);
    end;
    v97 = v94;
    v3.useEffect(function()
        local v122 = v86:getValue();
        if v86:getValue() == 0 then
            v87((v21.instant(v97)));
            return ;
        else
            if v122 ~= v97 then
                v87(v21.spring(v97, v13.MENU_ANIMATION_SPRING));
            end;
            return ;
        end;
    end, {
        v97
    });
    v3.useEffect(function()
        v6:setMenuAbsoluteSize(Vector2.new(v96, v13.ICON_CELL_WIDTH), Vector2.new(v97, v13.ICON_CELL_WIDTH));
    end, {
        v96, 
        v97
    });
    if v76 then
        v91.current = (v91.current or 0) + 1;
    end;
    v74.current = v73;
    v3.useEffect(function()
        if v90.current then
            v89(v21.spring(1, v13.MENU_ANIMATION_SPRING));
            v90.current = false;
            return ;
        else
            v89(v21.spring(0, v13.MENU_ANIMATION_SPRING));
            v90.current = true;
            return ;
        end;
    end, {
        v91.current, 
        v90
    });
    local v123 = l_useStyle_0();
    return v3.createElement("Frame", {
        Size = v102, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        ref = v72.menuFrameRef, 
        [v3.Change.AbsoluteSize] = v100, 
        [v3.Change.AbsolutePosition] = v100
    }, {
        v3.createElement(AnimationStateHelper, {
            setToggleTransition = v81, 
            setToggleIconTransition = v83, 
            setToggleWidthTransition = v85, 
            menuFrameRef = v72.menuFrameRef
        }), 
        v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v123.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v123.Theme.BackgroundUIContrast.Transparency
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, v92), 
        v3.createElement(v14, {
            size = v102
        })
    });
end;
return v3.memo(function(v124)
    local v125 = v3.useRef(nil);
    local v126 = v3.useRef(nil);
    local function v127()
        if not (not v126.current or not v125.current) then
            v126.current.Size = v125.current.Size;
        end;
    end;
    local v128 = v18(v6:orderAlignment(), isLeft);
    v3.useEffect(function()
        local v129 = nil;
        if not (not v125 or not v125.current) then
            v129 = v125.current:GetPropertyChangedSignal("Size"):Connect(v127);
        end;
        if not (not v126.current or not v125.current) then
            v126.current.Size = v125.current.Size;
        end;
        return function()
            if v129 then
                v129:disconnect();
            end;
        end;
    end);
    return {
        v3.createElement("Frame", {
            Name = "UnibarMenu", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v124.layoutOrder, 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            ref = v126
        }, {
            v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = if not v128 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 10)
            }), 
            v3.createElement(Unibar, {
                menuFrameRef = v125, 
                onAreaChanged = v124.onAreaChanged, 
                onMinWidthChanged = v124.onMinWidthChanged
            }), 
            v3.createElement(v11), 
            (v3.createElement(v12))
        })
    };
end);
