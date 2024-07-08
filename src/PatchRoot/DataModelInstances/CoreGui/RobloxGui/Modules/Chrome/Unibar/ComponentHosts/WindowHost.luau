local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local v6 = require(l_CorePackages_0.Packages.ReactOtter);
local l_Interactable_0 = require(l_CorePackages_0.UIBlox).Core.Control.Interactable;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Utility.debounce);
local v10 = require(l_Parent_0.Service);
local v11 = require(l_Parent_0.Unibar.Constants);
local _ = require(l_Parent_0.Service.Types);
local v13 = require(l_Parent_0.Analytics.ChromeAnalytics);
local v14 = require(l_Parent_0.Flags.GetFFlagEnableChromeAnalytics)();
local v15 = require(l_Parent_0.Flags.GetFFlagSelfViewFixes)();
local v16 = require(l_Parent_0.Utility.shouldRejectMultiTouch);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GetFFlagSelfViewAssertFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewAssertFix;
local v19 = require(script.Parent.Parent.Parent.Hooks.useWindowSize);
local v20 = {
    dampingRatio = 1, 
    frequency = 3
};
local v21 = {
    INTEGRATION = 1, 
    CLOSE_BUTTON = 2, 
    INPUT_SHIELD = 3, 
    INPUT_WRAPPER = 4
};
return function(v22)
    local v23 = v19(v22.integration.integration);
    local v24 = v1.useRef(nil);
    local v25 = v1.useRef(nil);
    local v26, v27 = v1.useBinding(false);
    local v28 = v1.useMemo(function()
        return nil;
    end, {});
    local v30 = if not v15 then nil else l_useSelector_0(function(v29)
        return v29.displayOptions.menuOpen or v29.displayOptions.inspectMenuOpen;
    end);
    local v31, v32 = v1.useBinding(false);
    local v33, v34 = v6.useAnimatedBinding(v23.X.Offset);
    local v35, v36 = v6.useAnimatedBinding(v23.Y.Offset);
    v1.useEffect(function()
        v34(v6.spring(v23.X.Offset, v20));
    end, {
        v23.X.Offset
    });
    v1.useEffect(function()
        v36(v6.spring(v23.Y.Offset, v20));
    end, {
        v23.Y.Offset
    });
    v1.useEffect(function()
        local v37 = nil;
        local v38 = nil;
        local v39 = v10:dragConnection(v22.integration.id);
        v37 = v39.connection;
        v38 = v39.inputObject;
        assert(v24.current ~= nil);
        assert(v24.current.Parent ~= nil);
        local l_current_0 = v24.current;
        local l_AbsoluteSize_0 = v24.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        if v37 ~= nil then
            v25 = v37;
            v27(true);
            if v25 then
                v34((v6.instant(42)));
                v36((v6.instant(42)));
                task.defer(v34, v6.spring(v23.X.Offset, v20));
                task.defer(v36, v6.spring(v23.Y.Offset, v20));
                local v42 = Vector3.new(v24.current.AbsolutePosition.X, v24.current.AbsolutePosition.Y, 0);
                if v14 then
                    v13.default:setWindowDefaultPosition(v22.integration.id, Vector2.new(v42.X, v42.Y));
                end;
                v25.current = l_UserInputService_0.InputChanged:Connect(function(v43, _)
                    local l_Position_0 = v43.Position;
                    if not v16(v38, v43) then
                        local v46 = l_Position_0 - v42;
                        local v47 = {
                            X = math.clamp((v46 + v42).X, 0, l_AbsoluteSize_0.X), 
                            Y = math.clamp((v46 + v42).Y, 0, l_AbsoluteSize_0.Y)
                        };
                        l_current_0.Position = UDim2.fromOffset(v47.X, v47.Y);
                        return ;
                    else
                        return ;
                    end;
                end);
            end;
        else
            local v48 = v22.position or UDim2.new();
            if not v22.integration.integration.cachePosition then
                l_current_0.Position = UDim2.new(0, if v48.X.Scale == 1 then l_AbsoluteSize_0.X else 0 + v48.X.Offset, 0, v48.Y.Offset);
            else
                local v49 = v10:windowPosition(v22.integration.id) or UDim2.new();
                l_current_0.Position = UDim2.new(0, if v49.X.Scale == 1 then l_AbsoluteSize_0.X else 0 + v49.X.Offset, 0, v49.Y.Offset);
            end;
        end;
    end, {});
    local v51 = v1.useCallback(function(v50)
        if v22.integration.integration.cachePosition then
            v10:updateWindowPosition(v22.integration.id, v50);
        end;
    end, {
        v22.integration
    });
    local v66 = v1.useCallback(function(_, v53)
        assert(v24.current ~= nil);
        assert(v24.current.Parent ~= nil);
        local l_current_1 = v24.current;
        local l_AbsoluteSize_1 = v24.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        local v56 = v33:getValue() / 2;
        local v57 = v35:getValue() / 2;
        local l_Position_1 = v53.Position;
        local v59 = Vector3.new(v24.current.AbsolutePosition.X + v56, v24.current.AbsolutePosition.Y + v57, 0);
        if not (v53.UserInputType ~= Enum.UserInputType.MouseButton1) or v53.UserInputType == Enum.UserInputType.Touch then
            if v14 then
                v13.default:onWindowTouchBegan(v22.integration.id, Vector2.new(v24.current.AbsolutePosition.X, v24.current.AbsolutePosition.Y));
            end;
            if not (v25.current or v31:getValue()) then
                local v60 = {
                    X = math.clamp(v59.X, 0, l_AbsoluteSize_1.X - v56), 
                    Y = math.clamp(v59.Y, 0, l_AbsoluteSize_1.Y - v57)
                };
                l_current_1.Position = UDim2.fromOffset(v60.X, v60.Y);
                v25.current = l_UserInputService_0.InputChanged:Connect(function(v61, _)
                    if not v16(v53, v61) then
                        v27(true);
                        local l_Position_2 = v61.Position;
                        local v64 = l_Position_2 - l_Position_1;
                        local v65 = {
                            X = math.clamp((v64 + v59).X, v56, l_AbsoluteSize_1.X - v56), 
                            Y = math.clamp((v64 + v59).Y, v57, l_AbsoluteSize_1.Y - v57)
                        };
                        l_current_1.Position = UDim2.fromOffset(v65.X, v65.Y);
                        if v14 then
                            v13.default:onWindowDrag(v22.integration.id, l_Position_2);
                        end;
                        return ;
                    else
                        return ;
                    end;
                end);
            end;
        end;
    end, {});
    local function v75(v67)
        local l_Parent_1 = v67.Parent;
        local l_Offset_0 = v67.Position.X.Offset;
        local l_Offset_1 = v67.Position.Y.Offset;
        local v71 = v33:getValue() / 2;
        local v72 = v35:getValue() / 2;
        local l_AbsoluteSize_2 = l_Parent_1.AbsoluteSize;
        local v74 = true;
        if l_Offset_0 >= v71 then
            v74 = true;
            if l_AbsoluteSize_2.X - v71 >= l_Offset_0 then
                v74 = true;
                if l_Offset_1 >= v72 then
                    v74 = l_AbsoluteSize_2.Y - v72 < l_Offset_1;
                end;
            end;
        end;
        return v74;
    end;
    local v85 = v1.useCallback(function()
        if l_GetFFlagSelfViewAssertFix_0() and (not (v24 ~= nil) or v24.current == nil) then
            return ;
        else
            assert(v24.current ~= nil);
            assert(v24.current.Parent ~= nil);
            local l_current_2 = v24.current;
            local l_Offset_2 = l_current_2.Position.X.Offset;
            local l_Offset_3 = l_current_2.Position.Y.Offset;
            if v28 and v28.PlaybackState == Enum.PlaybackState.Playing then
                v28:Cancel();
            end;
            if not v75(l_current_2) then
                v51(UDim2.new(0, l_Offset_2, 0, l_Offset_3));
                return ;
            elseif l_current_2 == nil then
                return ;
            else
                local l_Parent_2 = v24.current.Parent;
                local v80 = v33:getValue() / 2;
                local v81 = v35:getValue() / 2;
                local l_AbsoluteSize_3 = l_Parent_2.AbsoluteSize;
                v32(true);
                local v83 = UDim2.new(0, math.clamp(l_Offset_2, v80, l_AbsoluteSize_3.X - v80), 0, (math.clamp(l_Offset_3, v81, l_AbsoluteSize_3.Y - v81)));
                v51(v83);
                v28 = l_TweenService_0:Create(l_current_2, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Position = v83
                });
                assert(v28 ~= nil);
                v28.Completed:Connect(function(_)
                    v32(false);
                    v28 = nil;
                end);
                v28:Play();
                return ;
            end;
        end;
    end, {});
    return v2.createPortal({
        Name = v1.createElement("ScreenGui", {
            Name = v11.WINDOW_HOST_GUI_NAME .. ":" .. v22.integration.id, 
            [v1.Change.AbsoluteSize] = v9(function()
                v85();
            end, 0.2), 
            DisplayOrder = if v15 then v30 and -1 or 100 else 100, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            WindowFrame = v1.createElement("Frame", {
                Size = v1.joinBindings({
                    v33, 
                    v35
                }):map(function(v86)
                    return UDim2.fromOffset(v86[1], v86[2]);
                end), 
                LayoutOrder = 1, 
                ref = v24, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, {
                WindowWrapper = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Integration = v22.integration.component(v22) or nil, 
                    InputShield = v1.createElement(l_Interactable_0, {
                        ZIndex = v21.INPUT_SHIELD, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Visible = v26
                    }), 
                    InputWrapper = v1.createElement("Frame", {
                        ZIndex = v21.INPUT_WRAPPER, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        [v1.Event.InputBegan] = v66, 
                        [v1.Event.InputEnded] = v1.useCallback(function(_, v88)
                            if not (v88.UserInputType ~= Enum.UserInputType.MouseButton1) or v88.UserInputType == Enum.UserInputType.Touch then
                                if not (not v24.current or not v14) then
                                    v13.default:onWindowTouchEnded(v22.integration.id, Vector2.new(v24.current.AbsolutePosition.X, v24.current.AbsolutePosition.Y), (v75(v24.current)));
                                end;
                                if v25.current then
                                    v25.current:Disconnect();
                                    v25.current = nil;
                                    v27(false);
                                    v10:gesture(v22.integration.id, nil);
                                    v85();
                                end;
                            end;
                        end, {})
                    })
                })
            })
        })
    }, l_CoreGui_0);
end;
