local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
local v8 = require(l_CorePackages_0.Cryo);
local v9 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Service);
local v12 = require(l_Parent_0.Unibar.Constants);
local _ = require(l_Parent_0.Service.Types);
local v14 = require(l_Parent_0.Flags.GetFFlagEnableChromePinAnalytics)();
local v15 = require(l_Parent_0.Flags.GetFFlagEnableChromeAnalytics)();
local l_GetFFlagEnableScreenshotUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility;
local v17 = require(script.Parent.Tracker);
local v18 = {
    INACTIVE = 0, 
    ACTIVE = 1
};
local v19 = {
    NONE = 0, 
    STARTED = 1, 
    DRAGGED = 2
};
local v20 = {};
v20.__index = v20;
local function v22()
    local v21 = "Unknown";
    if l_PlayerGui_0 then
        v21 = v12.ANALYTICS.SCREEN_ORIENTATION_MAP[l_PlayerGui_0.CurrentScreenOrientation] or tostring(l_PlayerGui_0.CurrentScreenOrientation);
    end;
    return {
        screen_orientation = v21, 
        last_input_device = v12.ANALYTICS.INPUT_TYPE_MAP[l_UserInputService_0:GetLastInputType()] or tostring(l_UserInputService_0:GetLastInputType()), 
        fps = v9.getFps()
    };
end;
local function v26()
    local v23 = {};
    for _, v25 in (v11:menuList():get()), nil, nil do
        if not (not v25.integration or v25.isDivider) then
            table.insert(v23, v25.integration.id);
        end;
    end;
    return table.concat(v23, ",");
end;
local function _(v27, v28)
    return v27 .. v28;
end;
local function _(v30)
    return v11:integrations()[v30];
end;
local function _(v32)
    if not v11:withinCurrentSubmenu(v32) then
        if not v11:withinCurrentTopLevelMenu(v32) then
            return "unknown";
        else
            return "unibar";
        end;
    else
        return v11:currentSubMenu():get();
    end;
end;
v20.new = function()
    local v34 = setmetatable({
        _target = "client", 
        _context = "chrome", 
        _defaultProps = {
            screen_width = 0, 
            screen_height = 0, 
            universeid = tostring(game.GameId), 
            placeid = tostring(game.PlaceId), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
            is_game_menu_opened = false
        }, 
        _tracker = v17.new()
    }, v20);
    if l_game_EngineFeature_0 then
        v34._defaultProps.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    if v15 then
        v34._observeIntegration = function(v35)
            local v36 = v11:integrations()[v35];
            if not (not v36 or not v36.windowSize) then
                v34._tracker:set("window_size_" .. v35, v36.windowSize:get());
                v36.windowSize:connect(function(v37)
                    if typeof(v37) ~= "UDim2" then
                        return ;
                    else
                        local v38 = v36.windowSize:get();
                        local v39 = v34._tracker:get("window_status_" .. v35);
                        local v40 = "window_size_" .. v35;
                        if v39 == v18.ACTIVE then
                            if v34._tracker:get(v40) then
                                v34:onWindowResize(v35, v38);
                            end;
                            v34._tracker:set(v40, v38);
                        end;
                        return ;
                    end;
                end);
            end;
        end;
        v34._resetWindowTrackers = function(v41)
            v34._tracker:reset("window_dposition_" .. v41);
            v34._tracker:reset("window_position_" .. v41);
            v34._tracker:reset("window_size_" .. v41);
            v34._tracker:reset("window_drag_" .. v41);
            v34._tracker:reset("window_status_" .. v41);
        end;
        v34._defaultWindowTrackers = function(v42)
            v34._resetWindowTrackers(v42);
            v34._tracker:startTime("window_time_" .. v42);
            v34._tracker:set("window_status_" .. v42, v18.ACTIVE);
        end;
        v34._sendEvent = function(v43, v44)
            l_RbxAnalyticsService_0:SendEventDeferred(v34._target, v34._context, v43, (v8.Dictionary.join(v22(), v34._defaultProps, v44 or {})));
        end;
        v34._calculateWindowAbsolutePosition = function(v45, v46)
            return Vector2.new((v45.X.Scale * v34._defaultProps.screen_width + v45.X.Offset) - v46.Width.Offset / 2, (v45.Y.Scale * v34._defaultProps.screen_height + v45.Y.Offset) - v46.Height.Offset / 2);
        end;
        v34._setWindowLastPosition = function(v47, v48)
            v34._tracker:set("window_position_" .. v47, v48);
        end;
        v11:status():connect(function(v49)
            v34:onUnibarToggle(v49);
        end);
        l_GuiService_0.MenuOpened:Connect(function()
            v34._defaultProps.is_game_menu_opened = not v34._defaultProps.is_game_menu_opened;
        end);
        for _, v51 in v11:integrations() do
            v34._observeIntegration(v51.id);
        end;
        v11:onIntegrationRegistered():connect(function(v52)
            v34._observeIntegration(v52);
        end);
        v11:onIntegrationActivated():connect(function(v53)
            v34:onIconActivated(v53);
        end);
        v11:onIntegrationStatusChanged():connect(function(v54, v55)
            local v56 = v11:integrations()[v54];
            if not (not v56 or not v56.components.Window) then
                if v55 == v11.IntegrationStatus.Window then
                    v34:onWindowOpened(v54);
                    return ;
                else
                    v34:onWindowClosed(v54);
                end;
            end;
        end);
        return v34;
    else
        return v34;
    end;
end;
v20.setPin = function(v57, v58, v59, v60)
    if v14 then
        v57._sendEvent(if not v59 then v12.ANALYTICS.PIN_REMOVED else v12.ANALYTICS.PIN_ADDED, {
            integration_id = v58, 
            source = if not v11:withinCurrentSubmenu(v58) then v11:withinCurrentTopLevelMenu(v58) and "unibar" or "unknown" else v11:currentSubMenu():get(), 
            user_pins = table.concat(v60, ",")
        });
    end;
    return nil;
end;
v20.setScreenSize = function(v61, v62)
    v61._defaultProps.screen_width = v62.X;
    v61._defaultProps.screen_height = v62.Y;
    return nil;
end;
v20.onUnibarToggle = function(v63, v64)
    local v65 = {
        visible_integrations = v26(), 
        mru_slots = #v8.Dictionary.keys(v11:mostRecentlyUsed())
    };
    if v64 == v11.MenuStatus.Open then
        v63._tracker:startTime("unibar_time");
        v63._sendEvent(v12.ANALYTICS.UNIBAR_OPENED, v65);
    elseif v64 == v11.MenuStatus.Closed then
        v65.total_open_time = v63._tracker:finishTime("unibar_time");
        v63._sendEvent(v12.ANALYTICS.UNIBAR_CLOSED, v65);
    end;
    return nil;
end;
v20.onIconActivated = function(v66, v67)
    local v68 = v11:integrations()[v67];
    if v68 then
        local v69 = v68.notification:get();
        local v70 = 0;
        if v69.type == "count" then
            v70 = tonumber(v69.value) or 0;
        end;
        v66._sendEvent(v12.ANALYTICS.ICON_ACTIVATED, {
            integration_id = v67, 
            source = if not v11:withinCurrentSubmenu(v67) then v11:withinCurrentTopLevelMenu(v67) and "unibar" or "unknown" else v11:currentSubMenu():get(), 
            notification_count = v70
        });
    end;
    return nil;
end;
v20.onIconTouchBegan = function(v71, v72)
    v71._tracker:set("icon_drag_" .. v72, v19.STARTED);
    return nil;
end;
v20.onIconDrag = function(v73, v74)
    local v75 = "icon_drag_" .. v74;
    if v73._tracker:get(v75) == v19.STARTED then
        v73._tracker:set(v75, v19.DRAGGED);
        v73._sendEvent(v12.ANALYTICS.ICON_DRAG_START, {
            integration_id = v74, 
            source = if not v11:withinCurrentSubmenu(v74) then v11:withinCurrentTopLevelMenu(v74) and "unibar" or "unknown" else v11:currentSubMenu():get()
        });
    end;
    return nil;
end;
v20.onIconTouchEnded = function(v76, v77, v78, v79)
    local v80 = "icon_drag_" .. v77;
    local v81 = v76._tracker:get(v80);
    local v82 = v11:integrations()[v77];
    if not (not v82 or not v82.windowSize) and v81 == v19.DRAGGED then
        v76._tracker:reset(v80);
        v76._setWindowLastPosition(v77, v78);
        local v83 = v82.windowSize:get();
        v76._sendEvent(v12.ANALYTICS.ICON_DRAG_END, {
            integration_id = v77, 
            source = if not v11:withinCurrentSubmenu(v77) then v11:withinCurrentTopLevelMenu(v77) and "unibar" or "unknown" else v11:currentSubMenu():get(), 
            window_position_x = v78.X, 
            window_position_y = v78.Y, 
            window_width = v83.Width.Offset, 
            window_height = v83.Height.Offset, 
            will_reposition = v79
        });
    end;
    return nil;
end;
v20.onWindowOpened = function(v84, v85)
    local v86 = v11:integrations()[v85];
    local v87 = v84._tracker:get("window_status_" .. v85);
    if v86 and v87 ~= v18.ACTIVE then
        v84._defaultWindowTrackers(v85);
        if not (((not (v84._tracker:get("icon_drag_" .. v85) ~= v19.DRAGGED) or v84._tracker:get("window_dposition_" .. v85)) or not v86.windowSize) or not v86.startingWindowPosition) then
            local v88 = v86.windowSize:get();
            if v88 then
                v84:setWindowDefaultPosition(v85, (v84._calculateWindowAbsolutePosition(v86.startingWindowPosition, v88)));
            end;
        end;
        v84._sendEvent(v12.ANALYTICS.WINDOW_OPENED, {
            integration_id = v85
        });
    end;
    return nil;
end;
v20.onWindowClosed = function(v89, v90)
    if v89._tracker:get("window_status_" .. v90) == v18.ACTIVE then
        v89._sendEvent(v12.ANALYTICS.WINDOW_CLOSED, {
            integration_id = v90, 
            total_open_time = v89._tracker:finishTime("window_time_" .. v90)
        });
        v89._resetWindowTrackers(v90);
    end;
    return nil;
end;
v20.onWindowTouchBegan = function(v91, v92, _)
    local v94 = v11:integrations()[v92];
    if not (not v94 or not v94.windowSize) then
        v91._tracker:set("window_drag_" .. v92, v19.STARTED);
    end;
    return nil;
end;
v20.onWindowDrag = function(v95, v96, v97)
    local v98 = "window_drag_" .. v96;
    local v99 = v95._tracker:get(v98);
    local v100 = v11:integrations()[v96];
    if not (not v100 or not v100.windowSize) and v99 == v19.STARTED then
        local v101 = v95._tracker:get("window_position_" .. v96);
        if v101 then
            local v102 = Vector2.new(v97.X - v101.X, v97.Y - v101.Y);
            if not (v102.X == 0) or v102.Y ~= 0 then
                v95._tracker:set(v98, v19.DRAGGED);
                local v103 = v100.windowSize:get();
                v95._sendEvent(v12.ANALYTICS.WINDOW_DRAG_START, {
                    integration_id = v96, 
                    position_x = v101.X, 
                    position_y = v101.Y, 
                    width = v103.Width.Offset, 
                    height = v103.Height.Offset, 
                    is_starting_position = v95._tracker:get("window_dposition_" .. v96) == v101
                });
            end;
        end;
    end;
    return nil;
end;
v20.onWindowTouchEnded = function(v104, v105, v106, v107)
    local v108 = v104._tracker:get("icon_drag_" .. v105);
    local v109 = v11:integrations()[v105];
    if v108 == v19.DRAGGED then
        return v104:onIconTouchEnded(v105, v106, v107);
    else
        local v110 = "window_drag_" .. v105;
        local v111 = v104._tracker:get(v110);
        if not (not v109 or not v109.windowSize) and v111 == v19.DRAGGED then
            local v112 = v109.windowSize:get();
            v104._tracker:reset(v110);
            v104._setWindowLastPosition(v105, v106);
            v104._sendEvent(v12.ANALYTICS.WINDOW_DRAG_END, {
                integration_id = v105, 
                position_x = v106.X, 
                position_y = v106.Y, 
                width = v112.Width.Offset, 
                height = v112.Height.Offset, 
                will_autoposition = v107
            });
        end;
        return nil;
    end;
end;
v20.setWindowDefaultPosition = function(v113, v114, v115)
    v113._tracker:set("window_dposition_" .. v114, v115);
    v113._setWindowLastPosition(v114, v115);
    return nil;
end;
v20.onWindowResize = function(v116, v117, v118)
    local v119 = v11:integrations()[v117];
    if not (not v119 or not v119.windowSize) then
        local v120 = "window_size_" .. v117;
        local v121 = "window_position_" .. v117;
        local v122 = v116._tracker:get(v120);
        local v123 = v116._tracker:get(v121);
        local v124 = nil;
        if v123 then
            v124 = Vector2.new(v123.X + (v122.Width.Offset - v118.Width.Offset) / 2, v123.Y + (v122.Height.Offset - v118.Height.Offset) / 2);
        end;
        if v124 then
            v116._setWindowLastPosition(v117, v124);
        end;
        v116._tracker:set(v120, v118);
        v116._sendEvent(v12.ANALYTICS.WINDOW_RESIZE, {
            integration_id = v117, 
            previous_position_x = not not v123 and v123.X or nil, 
            previous_position_y = not not v123 and v123.Y or nil, 
            previous_width = not not v122 and v122.Width.Offset or nil, 
            previous_height = not not v122 and v122.Height.Offset or nil, 
            current_position_x = not not v124 and v124.X or nil, 
            current_position_y = not not v124 and v124.Y or nil, 
            current_width = v118.Width.Offset, 
            current_height = v118.Height.Offset
        });
    end;
    return nil;
end;
v20.onCaptureTaken = function(_, v126, v127, v128)
    if l_GetFFlagEnableScreenshotUtility_0() then
        l_RbxAnalyticsService_0:SendEventDeferred(v126, v128, v127, {
            isUnder13 = if not l_Players_0.LocalPlayer then nil else l_Players_0.LocalPlayer:GetUnder13(), 
            pid = tostring(game.PlaceId), 
            btn = "CapturesChromeBarUtilityEntrypointActivated"
        });
    end;
    return nil;
end;
v20.default = v20.new();
return v20;
