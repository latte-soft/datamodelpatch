local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v4 = require(l_CorePackages_0.Packages.ReactOtter);
local v5 = require(l_CorePackages_0.UIBlox);
local l_useProperties_0 = v5.Core.Hooks.useProperties;
local l_useForwardRef_0 = v5.Core.Hooks.useForwardRef;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_RoactRodux_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux;
local _ = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = {
    dampingRatio = 1, 
    frequency = 3, 
    restingPositionLimit = 0.1, 
    restingVelocityLimit = 2
};
local function _(v15, v16)
    return v1.useMemo(function()
        return v1.joinBindings((v2.map(v16, function(v17)
            if not (type(v17) == "table") or not v17.getValue then
                return v1.createBinding(v17);
            else
                return v17;
            end;
        end))):map(function(v18)
            return v15(unpack(v18));
        end);
    end, v16);
end;
local function v23(v20, v21)
    return (v3.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v1.useCallback(function(v22)
        if not (not (v22.eventData and v22.eventData.UserInputState == Enum.UserInputState.End) or not v21) then
            v22.cancelled = true;
            v21();
        end;
    end, {
        v21
    }), nil, v20));
end;
local function v36(v24)
    local v25 = v3.useFocusedGuiObject();
    local v26 = v3.useFocusGuiObject();
    local v27 = v1.useRef(nil);
    local v28 = v1.useRef(nil);
    local v30, v31 = v4.useAnimatedBinding(0, (v1.useCallback(function(v29)
        if not (not (v29 == 1) or not v27.current) then
            v27.current();
            v27.current = nil;
        end;
        if not (not (v29 == 0) or not v28.current) then
            v28.current();
            v28.current = nil;
        end;
    end, {})));
    local v32, v33 = v1.useState(false);
    local v34 = v1.useRef(nil);
    return l_useForwardRef_0(v24, (v1.useCallback(function(v35)
        v34.current = function()
            v27.current = function()
                v26(v35);
            end;
            v28.current = function()
                v33(false);
                v26(v25);
            end;
        end;
    end, {
        v25, 
        v26
    }))), v32, v30, v1.useCallback(function()
        if not (not (v30:getValue() == 0) or not v34.current) then
            v34.current();
            v33(true);
            v31(v4.spring(1, v14));
        end;
    end, {
        v25, 
        v30
    }), (v1.useCallback(function()
        if v30:getValue() == 1 then
            v31(v4.spring(0, v14));
        end;
    end, {
        v30
    }));
end;
return v1.forwardRef(function(v37, v38)
    local v39 = v37.selectionCursor or l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v41 = l_RoactRodux_0.useSelector(function(v40)
        return v40.ScreenSize or Vector2.zero;
    end);
    local v42 = v1.useMemo(function()
        if not v37.safeAreaSize then
            return v41;
        else
            return Vector2.new(v41.X * v37.safeAreaSize.X.Scale + v37.safeAreaSize.X.Offset, v41.Y * v37.safeAreaSize.Y.Scale + v37.safeAreaSize.Y.Offset);
        end;
    end, {
        v41, 
        v37.safeAreaSize
    });
    local v43, v44 = v1.useBinding(Vector2.zero);
    local v45 = l_useProperties_0(v38, v44, "AbsolutePosition");
    local v46, v47 = v1.useBinding(Vector2.zero);
    local v48 = l_useProperties_0(nil, v47, "AbsoluteSize");
    local _, v50 = v1.useBinding(Vector2.zero);
    local v51 = l_useProperties_0(nil, v50, "AbsolutePosition");
    local v52, v53 = v1.useBinding(Vector2.zero);
    local v54 = l_useProperties_0(nil, v53, "AbsoluteSize");
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59, v60, v61, v62, v63 = v36(v45);
    v45 = v59;
    v55 = v60;
    v56 = v61;
    v57 = v62;
    v58 = v63;
    v45 = v23(v45, if not v55 then nil else v58);
    v59, v60 = v1.useState(false);
    v61 = v1.useMemo(function()
        return (v37.renderHeader or v2.noop)(v55);
    end, {
        v55, 
        v37.renderHeader
    });
    v62 = v1.useMemo(function()
        return v37.renderContents(v55);
    end, {
        v55, 
        v37.renderContents
    });
    local v64;
    v63, v64 = v1.useMemo(function()
        local v65, v66 = v37.renderContentWrapper(v59, v55, (v1.createElement("Frame", {
            Position = UDim2.new(), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ref = v54, 
            BackgroundTransparency = 1, 
            Selectable = false, 
            SelectionGroup = true, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, v62)));
        return v65, v66 or {};
    end, {
        v62, 
        v59, 
        v54, 
        v37.renderContentWrapper
    });
    local function v72(v67, v68, v69, _, _)
        return UDim2.new(1, 0, 0, ((v67.Y + (v69.top or 0)) + v68.Y) + (v69.bottom or 0));
    end;
    local v73 = {
        v46, 
        v52, 
        v64, 
        v37.limitInlineHeight, 
        v42
    };
    local l_v73_0 = v73 --[[ copy: 30 -> 40 ]];
    local l_v72_0 = v72 --[[ copy: 29 -> 41 ]];
    local v78 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v73_0, function(v76)
            if not (type(v76) == "table") or not v76.getValue then
                return v1.createBinding(v76);
            else
                return v76;
            end;
        end))):map(function(v77)
            return l_v72_0(unpack(v77));
        end);
    end, v73);
    v73 = function(v79, v80)
        if v79 > 0 then
            return 1000000;
        else
            return v80;
        end;
    end;
    local v81 = {
        v56, 
        v37.zIndex
    };
    local l_v81_0 = v81 --[[ copy: 31 -> 42 ]];
    local l_v73_1 = v73 --[[ copy: 30 -> 43 ]];
    v72 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v81_0, function(v84)
            if not (type(v84) == "table") or not v84.getValue then
                return v1.createBinding(v84);
            else
                return v84;
            end;
        end))):map(function(v85)
            return l_v73_1(unpack(v85));
        end);
    end, v81);
    v81 = function(v86, v87)
        if v86 > 0 then
            return UDim2.fromOffset(-v87.X, -v87.Y - 200);
        else
            return UDim2.new();
        end;
    end;
    local v88 = {
        v56, 
        v43
    };
    local l_v88_0 = v88 --[[ copy: 32 -> 44 ]];
    local l_v81_1 = v81 --[[ copy: 31 -> 45 ]];
    v73 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v88_0, function(v91)
            if not (type(v91) == "table") or not v91.getValue then
                return v1.createBinding(v91);
            else
                return v91;
            end;
        end))):map(function(v92)
            return l_v81_1(unpack(v92));
        end);
    end, v88);
    v88 = function(v93, v94)
        if v93 > 0 then
            return UDim2.fromOffset(v94.X, v94.Y + 400);
        else
            return UDim2.new();
        end;
    end;
    local v95 = {
        v56, 
        v41
    };
    local l_v95_0 = v95 --[[ copy: 33 -> 46 ]];
    local l_v88_1 = v88 --[[ copy: 32 -> 47 ]];
    v81 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v95_0, function(v98)
            if not (type(v98) == "table") or not v98.getValue then
                return v1.createBinding(v98);
            else
                return v98;
            end;
        end))):map(function(v99)
            return l_v88_1(unpack(v99));
        end);
    end, v95);
    v95 = function(v100, v101)
        return 1 - v100 * (1 - v101);
    end;
    local v102 = {
        v56, 
        v37.overlayTransparency or 1
    };
    local l_v102_0 = v102 --[[ copy: 34 -> 48 ]];
    local l_v95_1 = v95 --[[ copy: 33 -> 49 ]];
    v88 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v102_0, function(v105)
            if not (type(v105) == "table") or not v105.getValue then
                return v1.createBinding(v105);
            else
                return v105;
            end;
        end))):map(function(v106)
            return l_v95_1(unpack(v106));
        end);
    end, v102);
    v102 = function(v107, v108, v109)
        local l_Offset_0 = v108.Y.Offset;
        local v111 = math.min(l_Offset_0, v109.Y) - l_Offset_0;
        local v112 = not v37.limitInlineHeight and 0 or v111;
        local l_v60_0 = v60;
        local v114 = false;
        if v111 < 0 then
            v114 = v107 == 1;
        end;
        l_v60_0(v114);
        return UDim2.new(1, 0, 0, (l_Offset_0 + v107 * v111) + (1 - v107) * v112);
    end;
    local v115 = {
        v56, 
        v78, 
        v42, 
        v59, 
        v60
    };
    local l_v115_0 = v115 --[[ copy: 35 -> 50 ]];
    local l_v102_1 = v102 --[[ copy: 34 -> 51 ]];
    v95 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v115_0, function(v118)
            if not (type(v118) == "table") or not v118.getValue then
                return v1.createBinding(v118);
            else
                return v118;
            end;
        end))):map(function(v119)
            return l_v102_1(unpack(v119));
        end);
    end, v115);
    v115 = function(v120, v121, v122, v123)
        return UDim2.fromOffset(0, v120 * ((v123.Y - v122.Y.Offset) / 2 - v121.Y));
    end;
    local v124 = {
        v56, 
        v43, 
        v95, 
        v41
    };
    local l_v124_0 = v124 --[[ copy: 36 -> 52 ]];
    local l_v115_1 = v115 --[[ copy: 35 -> 53 ]];
    v102 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v124_0, function(v127)
            if not (type(v127) == "table") or not v127.getValue then
                return v1.createBinding(v127);
            else
                return v127;
            end;
        end))):map(function(v128)
            return l_v115_1(unpack(v128));
        end);
    end, v124);
    v124 = function(v129, v130)
        return v129 + UDim2.fromOffset(0, v130.Y);
    end;
    local v131 = {
        v102, 
        v46
    };
    local l_v131_0 = v131 --[[ copy: 37 -> 54 ]];
    local l_v124_1 = v124 --[[ copy: 36 -> 55 ]];
    v115 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v131_0, function(v134)
            if not (type(v134) == "table") or not v134.getValue then
                return v1.createBinding(v134);
            else
                return v134;
            end;
        end))):map(function(v135)
            return l_v124_1(unpack(v135));
        end);
    end, v131);
    v131 = function(v136, v137)
        return v136 - UDim2.fromOffset(0, v137.Y);
    end;
    local v138 = {
        v95, 
        v46
    };
    local l_v138_0 = v138 --[[ copy: 38 -> 56 ]];
    v124 = v1.useMemo(function()
        return v1.joinBindings((v2.map(l_v138_0, function(v140)
            if not (type(v140) == "table") or not v140.getValue then
                return v1.createBinding(v140);
            else
                return v140;
            end;
        end))):map(function(v141)
            return v131(unpack(v141));
        end);
    end, v138);
    v138 = function(v142)
        if v142 < 1 then
            return 4;
        else
            return 2;
        end;
    end;
    local v143 = {
        v56
    };
    return v1.createElement("Frame", {
        Size = if not v37.limitInlineHeight then v78 else v95, 
        ref = v45, 
        BackgroundTransparency = 1, 
        LayoutOrder = v37.layoutOrder, 
        ZIndex = v72, 
        Selectable = false
    }, {
        Overlay = v1.createElement("TextButton", {
            Text = "", 
            Position = v73, 
            Size = v81, 
            BackgroundColor3 = v37.overlayColor3 or Color3.new(0, 0, 0), 
            BackgroundTransparency = v88, 
            AutoButtonColor = false, 
            ZIndex = 1, 
            Selectable = false, 
            Active = true, 
            [v1.Event.Activated] = v58
        }), 
        Header = v1.createElement("Frame", {
            ref = v48, 
            Position = v102, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Selectable = false, 
            ZIndex = 3
        }, v61), 
        Panel = v1.createElement("Frame", {
            Position = v115, 
            Size = v124, 
            ref = v51, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            ZIndex = 3
        }, v63), 
        Cover = v1.createElement("TextButton", {
            Text = "", 
            Position = v115, 
            Size = v124, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            ZIndex = v1.useMemo(function()
                return v1.joinBindings((v2.map(v143, function(v144)
                    if not (type(v144) == "table") or not v144.getValue then
                        return v1.createBinding(v144);
                    else
                        return v144;
                    end;
                end))):map(function(v145)
                    return v138(unpack(v145));
                end);
            end, v143), 
            Active = true, 
            Selectable = true, 
            SelectionImageObject = v39, 
            SelectionOrder = 1, 
            SelectionGroup = v55, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            [v1.Event.Activated] = v57
        })
    });
end);
