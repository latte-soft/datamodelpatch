local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_reverse_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array.reverse;
local v4 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_Signal_0 = v4.Signal;
local v7 = require(script.Parent.ChromeUtils);
local v8 = require(script.Parent.LocalStore);
local v9 = require(script.Parent.ViewportUtil);
local v10 = require(script.Parent.WindowSizeSignal);
local l_ObservableValue_0 = v7.ObservableValue;
local l_NotifySignal_0 = v7.NotifySignal;
local l_AvailabilitySignal_0 = v7.AvailabilitySignal;
local _ = require(script.Parent.Types);
local v15 = require(script.Parent.Parent.Flags.GetFFlagEnableUnibarSneakPeak);
local v16 = require(script.Parent.Parent.Flags.GetFFlagEnableChromeFTUX);
local v17 = require(script.Parent.Parent.Flags.GetFFlagEnableUnibarMaxDefaultOpen);
local v18 = require(script.Parent.Parent.Flags.GetFFlagEnableChromeEscapeFix);
local v19 = require(script.Parent.Parent.Flags.GetFFlagEnableChromeDefaultOpen);
local v20 = require(script.Parent.Parent.Flags.GetFFlagNewUnibarIA);
local v21 = require(script.Parent.Parent.Flags.GetFFlagEnableChromePinIntegrations);
local v22 = require(script.Parent.Parent.Flags.GetFFlagEnableChromePinnedChat)();
local l_GetFFlagChromeSurveySupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSurveySupport;
local v24 = require(script.Parent.Parent.Flags.GetFFlagOpenControlsOnMenuOpen);
local l_GetFFlagSupportCompactUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSupportCompactUtility;
local v26 = require(script.Parent.Parent.Flags.GetFFlagDisableMostRecentlyUsed);
local v27 = require(script.Parent.Parent.Flags.GetFFlagEnableSaveUserPins);
local v28 = require(script.Parent.Parent.Flags.GetFFlagUseSelfieViewFlatIcon);
local v29 = game:DefineFastFlag("PreserveWindowsCompactUtility", false);
local v30 = game:DefineFastString("ChromeServiceDefaultPins", "leaderboard,trust_and_safety");
local v31 = {};
v31.__index = v31;
v31.AvailabilitySignal = v7.AvailabilitySignalState;
v31.MenuStatus = {
    Closed = 0, 
    Open = 1
};
v31.IntegrationStatus = {
    None = 0, 
    Icon = 1, 
    Window = 2
};
v31.Key = {
    MostRecentlyUsed = "MRU", 
    UserPinned = if not v21 then nil else "UP"
};
noop = function()
end;
local v32 = {
    id = "div", 
    label = "div", 
    initialAvailability = v31.AvailabilitySignal.Unavailable, 
    availability = l_AvailabilitySignal_0.new(v31.AvailabilitySignal.Unavailable), 
    notification = l_NotifySignal_0.new(), 
    components = {}, 
    hideNotificationCountWhileOpen = false
};
createUnibarLayoutInfo = function(v33, v34, v35)
    return {
        [v31.MenuStatus.Open] = Rect.new(v33, v33 + v35), 
        [v31.MenuStatus.Closed] = Rect.new(v33, v33 + v34)
    };
end;
v31.new = function()
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v37 = {
        _chromeSeenCount = not v17() and 0 or getChromeSeenCount()
    };
    local v38 = if not not v19() and (v15() or v17()) then getInitialStatus(v37._chromeSeenCount) else v7.ObservableValue.new(v31.MenuStatus.Closed);
    v37._status = v38;
    v37._layout = v7.ObservableValue.new(createUnibarLayoutInfo(Vector2.zero, Vector2.zero, Vector2.zero));
    v37._menuAbsolutePosition = Vector2.zero;
    v37._menuAbsoluteSizeOpen = Vector2.zero;
    v37._menuAbsoluteSizeClosed = Vector2.zero;
    v37._currentSubMenu = v7.ObservableValue.new(nil);
    v37._selectedItem = v7.ObservableValue.new(nil);
    v37._selectedItemIdx = 0;
    v37._integrations = {};
    v37._integrationsConnections = {};
    v37._integrationsStatus = {};
    v37._menuConfig = {};
    v37._subMenuConfig = {};
    v37._compactUtilityConfig = {};
    v37._currentCompactUtility = l_ObservableValue_0.new(nil);
    v37._subMenuNotifications = {};
    v37._menuList = l_ObservableValue_0.new({});
    v37._windowList = l_ObservableValue_0.new({});
    v37._dragConnection = {};
    v37._windowPositions = l_ObservableValue_0.new({});
    v37._totalNotifications = l_NotifySignal_0.new(true);
    v37._mostRecentlyUsedFullRecord = {};
    v37._mostRecentlyUsed = {};
    v37._userPins = {};
    v37._mostRecentlyUsedAndPinnedLimit = 1;
    v37._localization = l_Localization_0.new(l_RobloxLocaleId_0);
    v37._localizedLabelKeys = {};
    v37._notificationIndicator = l_ObservableValue_0.new(nil);
    v37._lastDisplayedNotificationTick = 0;
    v37._lastDisplayedNotificationId = "";
    v37._orderAlignment = l_ObservableValue_0.new(Enum.HorizontalAlignment.Left);
    v37._onIntegrationRegistered = l_Signal_0.new();
    v37._onIntegrationActivated = l_Signal_0.new();
    v37._onIntegrationStatusChanged = l_Signal_0.new();
    v37._lastInputToOpenMenu = if (not not v18() and v19()) and v38:get() == v31.MenuStatus.Open then Enum.UserInputType.MouseButton1 else Enum.UserInputType.None;
    local v39 = setmetatable(v37, v31);
    v9.viewport:connect(function(v40)
        v39:updateScreenSize(v40.size, v40.isMobileDevice, v40.portraitOrientation, v40.tinyPortrait);
    end, true);
    if v17() then
        v39:storeChromeSeen();
    end;
    return v39;
end;
getChromeSeenCount = function()
    if not l_GetFFlagChromeSurveySupport_0() then
        if not (not v17() or not v8.isEnabled()) then
            local v41 = v8.loadForLocalPlayer("ChromeSeenCount");
            if not (not v41 or not tonumber(v41)) then
                return v41;
            end;
        end;
        return 0;
    else
        return v8.getChromeSeenCount();
    end;
end;
getInitialStatus = function(v42)
    if v8.isEnabled() then
        if not v15() or not v8.loadForLocalPlayer("ChromeInteracted2") then
            if v17() and v42 >= 3 then
                return v7.ObservableValue.new(v31.MenuStatus.Closed);
            end;
        else
            return v7.ObservableValue.new(v31.MenuStatus.Closed);
        end;
    end;
    return v7.ObservableValue.new(v31.MenuStatus.Open);
end;
v31.storeChromeInteracted = function(_)
    if not (not v15() or not v8.isEnabled()) then
        v8.storeForLocalPlayer("ChromeInteracted2", true);
    end;
end;
v31.storeChromeSeen = function(v44)
    if not (not v17() or not v8.isEnabled()) and v44._chromeSeenCount + 1 < math.huge then
        v8.storeForLocalPlayer("ChromeSeenCount", v44._chromeSeenCount + 1);
    end;
end;
v31.updateScreenSize = function(v45, _, v47, v48, v49)
    local v50 = 0;
    if not v47 then
        v50 = 4;
    else
        v50 = if not v49 then v48 and 1 or 2 else 0;
        if not (not v22 or v20()) then
            v50 = math.max(0, v50 - 1);
        end;
    end;
    if v50 ~= v45._mostRecentlyUsedAndPinnedLimit then
        v45._mostRecentlyUsedAndPinnedLimit = v50;
        if v21() then
            v45:rebuildUserPins();
        end;
        v45:rebuildMostRecentlyUsed();
    end;
    v45:updateWindowSizeSignals();
end;
v31.rebuildMostRecentlyUsed = function(v51)
    table.clear(v51._mostRecentlyUsed);
    local v52 = #v51._mostRecentlyUsedFullRecord;
    if v52 > 0 then
        local v53 = (v52 - v51._mostRecentlyUsedAndPinnedLimit) + 1;
        if v21() then
            v53 = ((v52 - v51._mostRecentlyUsedAndPinnedLimit) + #v51._userPins) + 1;
        end;
        table.move(v51._mostRecentlyUsedFullRecord, math.max(1, v53), v52, 1, v51._mostRecentlyUsed);
    end;
    v51:updateMenuList();
    v51:updateNotificationTotals();
end;
v31.rebuildUserPins = function(v54)
    if v21() and v54._mostRecentlyUsedAndPinnedLimit < #v54._userPins then
        local v55 = {};
        local v56 = #v54._userPins;
        table.move(v54._userPins, math.max(1, (v56 - v54._mostRecentlyUsedAndPinnedLimit) + 1), v56, 1, v55);
        v54._userPins = v55;
        v54:updateMenuList();
        v54:updateNotificationTotals();
    end;
    if v27() then
        local v57 = {};
        for v58 in v30:gmatch("([^,]+),?") do
            table.insert(v57, v58);
        end;
        v54._userPins = v8.loadForLocalPlayer("ChromePinned") or v57;
        v54:updateMenuList();
        v54:updateNotificationTotals();
    end;
end;
v31.updateWindowSizeSignals = function(v59)
    for _, v61 in v59._integrations, nil, nil do
        if v61.windowSize then
            v61.windowSize:updateConstraints();
        end;
    end;
end;
v31.triggerNotificationIndicator = function(v62, v63)
    local l__status_0 = v62._status;
    local v65 = v62._integrations[v63];
    local v66 = v65.availability:get();
    if not (v66 ~= v31.AvailabilitySignal.Unavailable) or v66 == v31.AvailabilitySignal.Pinned then
        return ;
    elseif l__status_0:get() ~= v31.MenuStatus.Closed then
        return ;
    else
        local v67 = v65.notification:get();
        if v67.type == "count" and v67.value > 0 then
            local v68 = tick();
            local v69 = v68 - v62._lastDisplayedNotificationTick;
            v62._lastDisplayedNotificationTick = v68;
            if v62._lastDisplayedNotificationId == v63 and v69 < 10 then
                return ;
            else
                v62._lastDisplayedNotificationId = v63;
                v62._notificationIndicator:setMomentary(v62:createIconProps(v63, 0, false), 2.5);
            end;
        end;
        return ;
    end;
end;
v31.notificationIndicator = function(v70)
    return v70._notificationIndicator;
end;
v31.toggleSubMenu = function(v71, v72)
    if v71._status:get() == v31.MenuStatus.Closed then
        warn("Can't toggleSubMenu while menu is closed");
        return ;
    elseif v71._subMenuConfig[v72] then
        if v71._currentSubMenu:get() == v72 then
            v71._currentSubMenu:set(nil);
            return ;
        else
            v71._currentSubMenu:set(v72);
            return ;
        end;
    else
        warn("Not a valid subMenuId:" .. v72);
        return ;
    end;
end;
v31.currentSubMenu = function(v73)
    return v73._currentSubMenu;
end;
v31.toggleOpen = function(v74)
    local l__status_1 = v74._status;
    local l__currentSubMenu_0 = v74._currentSubMenu;
    if not v15() then
        if l__status_1:get() == v31.MenuStatus.Closed then
            l__status_1:set(v31.MenuStatus.Open);
            v74._lastDisplayedNotificationId = "";
            v74._notificationIndicator:set(nil);
            v74._lastInputToOpenMenu = l_UserInputService_0:GetLastInputType();
            return ;
        else
            v74._selectedItem:set(nil);
            l__currentSubMenu_0:set(nil);
            l__status_1:set(v31.MenuStatus.Closed);
            v74._lastInputToOpenMenu = Enum.UserInputType.None;
            return ;
        end;
    elseif l__status_1:get() == v31.MenuStatus.Closed then
        v74:open();
        return ;
    else
        v74:close();
        return ;
    end;
end;
v31.open = function(v77, v78)
    local l__status_2 = v77._status;
    if l__status_2:get() == v31.MenuStatus.Closed then
        l__status_2:set(v31.MenuStatus.Open);
        v77._lastDisplayedNotificationId = "";
        v77._notificationIndicator:set(nil);
        if not v16() and not v24() then
            v77._lastInputToOpenMenu = l_UserInputService_0:GetLastInputType();
        else
            v77._lastInputToOpenMenu = if not v78 then l_UserInputService_0:GetLastInputType() else Enum.UserInputType.Touch;
            return ;
        end;
    end;
end;
v31.close = function(v80, v81)
    local l__status_3 = v80._status;
    local l__currentSubMenu_1 = v80._currentSubMenu;
    local l__currentCompactUtility_0 = v80._currentCompactUtility;
    if l__status_3:get() == v31.MenuStatus.Open then
        if not (l_GetFFlagSupportCompactUtility_0() and l__currentCompactUtility_0:get() ~= nil) or v81 then
            if l_GetFFlagSupportCompactUtility_0() then
                local v85 = l__currentCompactUtility_0:get();
                if v85 then
                    v80:toggleCompactUtility(v85);
                end;
            end;
            v80._selectedItem:set(nil);
            l__currentSubMenu_1:set(nil);
            l__status_3:set(v31.MenuStatus.Closed);
            v80._lastInputToOpenMenu = Enum.UserInputType.None;
        else
            return ;
        end;
    end;
end;
v31.getLastInputToOpenMenu = function(v86)
    return v86._lastInputToOpenMenu;
end;
v31.toggleWindow = function(v87, v88)
    if v87._integrations[v88].components.Window then
        if not (v87._integrationsStatus[v88] and v87._integrationsStatus[v88] ~= v31.IntegrationStatus.None) or v87._integrationsStatus[v88] == v31.IntegrationStatus.Icon then
            v87._integrationsStatus[v88] = v31.IntegrationStatus.Window;
        else
            v87._integrationsStatus[v88] = v31.IntegrationStatus.Icon;
        end;
        v87._onIntegrationStatusChanged:fire(v88, v87._integrationsStatus[v88]);
    end;
    v87:updateMenuList();
end;
v31.isWindowOpen = function(v89, v90)
    return v89._integrations[v90].components.Window and v89._integrationsStatus[v90] == v31.IntegrationStatus.Window;
end;
v31.status = function(v91)
    return v91._status;
end;
v31.menuList = function(v92)
    return v92._menuList;
end;
v31.windowList = function(v93)
    return v93._windowList;
end;
v31.dragConnection = function(v94, v95)
    if not v94._integrations[v95] then
        return nil;
    else
        return v94._dragConnection[v95];
    end;
end;
v31.updateLocalization = function(v96, v97)
    local v98 = "";
    local v99 = "";
    v96._localizedLabelKeys[v97.id] = {};
    v96._localizedLabelKeys[v97.id].label = v97.label;
    v98 = v97.label;
    local l_status_0, l_result_0 = pcall(function()
        v98 = v96._localization:Format(v98);
    end);
    if not l_status_0 then
        v98 = v97.label;
        warn(l_result_0);
    end;
    v97.label = v98;
    if v97.secondaryAction then
        v96._localizedLabelKeys[v97.id].secondaryActionLabel = v97.secondaryAction.label;
        v99 = v97.secondaryAction.label;
        local l_status_1, l_result_1 = pcall(function()
            v99 = v96._localization:Format(v99);
        end);
        if not l_status_1 then
            v99 = v97.secondaryAction.label;
            warn(l_result_1);
        end;
        v97.secondaryAction.label = v99;
    end;
    return v97;
end;
v31.register = function(v104, v105)
    if v104._integrations[v105.id] then
        warn(string.format(v105.id .. "already registered", debug.traceback()));
        for _, v107 in v104._integrationsConnections[v105.id], nil, nil do
            v107:disconnect();
        end;
    end;
    v104._integrationsConnections[v105.id] = {};
    local v108 = v104._integrationsConnections[v105.id];
    if v105.initialAvailability == nil then
        v105.initialAvailability = v31.AvailabilitySignal.Unavailable;
    end;
    if v105.availability == nil then
        v105.availability = l_AvailabilitySignal_0.new(v105.initialAvailability or v31.AvailabilitySignal.Unavailable);
    end;
    if v105.notification == nil then
        v105.notification = l_NotifySignal_0.new();
    end;
    if v105.components == nil then
        v105.components = {};
    end;
    if v105.availability then
        v108[#v108 + 1] = v105.availability:connect(function()
            v104:availabilityChanged(v105);
        end);
    end;
    if not (not v105.notification or v105.notification:excludeFromTotalCounts()) then
        v108[#v108 + 1] = v105.notification:connect(function()
            v104:triggerNotificationIndicator(v105.id);
            v104:updateNotificationTotals();
        end);
    end;
    if not ((not (v105.windowSize == nil) or not v105.components) or not v105.components.Window) then
        v105.windowSize = v10.new();
    end;
    v105 = v104:updateLocalization(v105);
    local l_v105_0 = v105;
    v104._integrations[v105.id] = l_v105_0;
    return l_v105_0;
end;
v31.createIconProps = function(v110, v111, v112, v113)
    local v114 = v112 or 0;
    if not v110._integrations[v111] then
        return {
            id = v111, 
            children = {}, 
            order = v114, 
            activated = noop, 
            integration = v32
        };
    else
        return {
            id = v111, 
            children = {}, 
            order = v114, 
            component = v110._integrations[v111].components.Icon, 
            integration = v110._integrations[v111], 
            isDivider = false, 
            recentlyUsedItem = v113 or false, 
            activated = function()
                v110:activate(v111);
            end
        };
    end;
end;
reverseOrder = function(v115)
    local v116 = #v115;
    local v117 = {};
    for v118 = 1, v116 do
        v117[v118] = v115[v118].order;
    end;
    for v119 = 1, v116 do
        v115[v119].order = v117[(v116 - v119) + 1];
    end;
end;
v31.updateMenuList = function(v120)
    local v121 = 0;
    local v122 = 0;
    local function v125(v123, v124)
        v122 = v122 + 1;
        return v120:createIconProps(v123, v122, v124);
    end;
    local function v127(v126)
        v122 = v122 + 1;
        if not v120._integrations[v126] then
            return {
                id = v126, 
                children = {}, 
                order = v122, 
                activated = noop, 
                integration = v32
            };
        else
            return {
                id = v126, 
                children = {}, 
                order = v122, 
                component = v120._integrations[v126].components.Window, 
                activated = noop, 
                integration = v120._integrations[v126]
            };
        end;
    end;
    local function v129(_)
        v121 = v121 + 1;
        v122 = v122 + 1;
        return {
            id = "DIV" .. v121, 
            order = v122, 
            isDivider = true, 
            children = {}, 
            activated = noop, 
            integration = v32
        };
    end;
    local function _(v130)
        local v131 = v120._integrations[v130];
        if not v131 then
            return false;
        else
            local l_availability_0 = v131.availability;
            return l_availability_0 and l_availability_0:get() ~= v31.AvailabilitySignal.Unavailable;
        end;
    end;
    local function v134(v135, v136, v137, v138)
        local v139 = 0;
        for v140, v141 in pairs(v135) do
            if v141 == v31.Key.MostRecentlyUsed then
                v134(v120._mostRecentlyUsed, v136, v137);
            elseif v21() and v141 == v31.Key.UserPinned then
                v134(v120._userPins, v136, v137);
            elseif type(v141) == "table" then
                if not #v136.children then
                    table.insert(v136.children, (v129(v121)));
                end;
                if v134(v141, v136, v137) > 0 then
                    table.insert(v136.children, (v129(v121)));
                end;
            else
                if typeof(v141) ~= "string" then
                    error((("Only tables or strings should be passed into the items list, received %* (at key %*)"):format(v141, v140)));
                end;
                if not v120._subMenuConfig[v141] then
                    local v142 = v120._integrations[v141];
                    local v143;
                    if not v142 then
                        v143 = false;
                    else
                        local l_availability_1 = v142.availability;
                        v143 = l_availability_1 and l_availability_1:get() ~= v31.AvailabilitySignal.Unavailable;
                    end;
                    if v143 then
                        if not v120:isWindowOpen(v141) then
                            table.insert(v136.children, v125(v141));
                            v139 = v139 + 1;
                        else
                            table.insert(v137, (v127(v141)));
                            if v28() then
                                table.insert(v136.children, v125(v141));
                                v139 = v139 + 1;
                            end;
                        end;
                    end;
                else
                    local v145 = v120._integrations[v141];
                    local v146;
                    if not v145 then
                        v146 = false;
                    else
                        local l_availability_2 = v145.availability;
                        v146 = l_availability_2 and l_availability_2:get() ~= v31.AvailabilitySignal.Unavailable;
                    end;
                    if v146 then
                        v122 = v122 + 1;
                        v146 = v120:createIconProps(v141, v122, v138);
                        v139 = v139 + 1;
                        v134(v120._subMenuConfig[v141], v146, v137);
                        if #v146.children > 0 then
                            table.insert(v136.children, v146);
                        end;
                    end;
                end;
            end;
        end;
        return v139;
    end;
    local v148 = {
        children = {}
    };
    local v149 = {};
    local v150 = if not l_GetFFlagSupportCompactUtility_0() then nil else v120._currentCompactUtility:get();
    if (not l_GetFFlagSupportCompactUtility_0() or not v150) or not v120._compactUtilityConfig[v150] then
        v134(v120._menuConfig, v148, v149);
    else
        v134(v120._compactUtilityConfig[v150], v148, v149);
    end;
    if not ((not #v148.children or not v148.children[#v148.children]) or not v148.children[#v148.children].isDivider) then
        table.remove(v148.children, #v148.children);
    end;
    if v120._orderAlignment:get() == Enum.HorizontalAlignment.Left then
        v148.children = l_reverse_0(v148.children);
        reverseOrder(v148.children);
    end;
    if not (((not l_GetFFlagSupportCompactUtility_0() or not v29) or not v150) or not v120._compactUtilityConfig[v150]) then
        for _, v152 in v120._windowList:get() do
            if v120:isWindowOpen(v152.integration.id) then
                table.insert(v149, v152);
            end;
        end;
    end;
    v120._menuList:set(v148.children);
    v120._windowList:set(v149);
    v120:repairSelected();
end;
v31.availabilityChanged = function(v153, _)
    v153:updateNotificationTotals();
    v153:updateMenuList();
end;
v31.subMenuNotifications = function(v155, v156)
    if not v155._subMenuNotifications[v156] then
        v155._subMenuNotifications[v156] = l_NotifySignal_0.new(true);
    end;
    return v155._subMenuNotifications[v156];
end;
v31.totalNotifications = function(v157)
    return v157._totalNotifications;
end;
v31.onIntegrationRegistered = function(v158)
    return v158._onIntegrationRegistered;
end;
v31.onIntegrationActivated = function(v159)
    return v159._onIntegrationActivated;
end;
v31.onIntegrationStatusChanged = function(v160)
    return v160._onIntegrationStatusChanged;
end;
v31.integrations = function(v161)
    return v161._integrations;
end;
v31.userPins = function(v162)
    return v162._userPins;
end;
v31.mostRecentlyUsed = function(v163)
    return v163._mostRecentlyUsed;
end;
v31.updateNotificationTotals = function(v164)
    local v165 = 0;
    for _, v167 in v164._integrations, nil, nil do
        if not (not (v167.availability:get() ~= v31.AvailabilitySignal.Unavailable and v167.availability:get() ~= v31.AvailabilitySignal.Pinned) or v167.notification:excludeFromTotalCounts()) then
            local v168 = v167.notification:get();
            if v168 and v168.type == "count" then
                assert(typeof(v168.value) == "number", "Expected count value to be number");
                v165 = v165 + v168.value;
            end;
        end;
    end;
    v164._totalNotifications:fireCount(v165);
    for v169, v170 in v164._subMenuNotifications, nil, nil do
        local v171 = v164:withinCurrentTopLevelMenu(v169);
        v165 = 0;
        if v171 then
            for _, v173 in v171.children, nil, nil do
                if not (not (not v164:withinCurrentTopLevelMenu(v173.id) and v173.integration.availability:get() ~= v31.AvailabilitySignal.Unavailable) or v173.integration.notification:excludeFromTotalCounts()) then
                    local v174 = v173.integration.notification:get();
                    if v174 and v174.type == "count" then
                        assert(typeof(v174.value) == "number", "Expected count value to be number");
                        v165 = v165 + v174.value;
                    end;
                end;
            end;
            v170:fireCount(v165);
        end;
    end;
end;
v31.configureReset = function(v175)
    v175._menuConfig = {};
    v175._subMenuConfig = {};
    v175._compactUtilityConfig = {};
    v175._subMenuNotifications = {};
    v175:updateMenuList();
end;
v31.configureMenu = function(v176, v177)
    v176._menuConfig = v177;
    v176:updateNotificationTotals();
    v176:updateMenuList();
end;
v31.configureSubMenu = function(v178, v179, v180)
    v178._subMenuConfig[v179] = v180;
    if not v178._subMenuNotifications[v179] then
        v178._subMenuNotifications[v179] = l_NotifySignal_0.new(true);
    end;
    v178:updateNotificationTotals();
    v178:updateMenuList();
end;
v31.configureCompactUtility = function(v181, v182, v183)
    if l_GetFFlagSupportCompactUtility_0() then
        v181._compactUtilityConfig[v182] = v183;
        v181:updateMenuList();
    end;
end;
v31.toggleCompactUtility = function(v184, v185)
    local v186 = v184._currentCompactUtility:get();
    if l_GetFFlagSupportCompactUtility_0() then
        if not v186 or v186 ~= v185 then
            v184._currentCompactUtility:set(v185);
        else
            v184._currentCompactUtility:set(nil);
        end;
        v184:updateMenuList();
    end;
end;
v31.getCurrentUtility = function(v187)
    return v187._currentCompactUtility;
end;
v31.gesture = function(v188, v189, v190, v191)
    if v188._integrations[v189] then
        v188._dragConnection[v189] = {
            connection = v190, 
            inputObject = v191
        };
    end;
end;
v31.withinCurrentTopLevelMenu = function(v192, v193)
    for v194, v195 in (v192._menuList:get()), nil, nil do
        if v195.id == v193 then
            return v195, v194;
        end;
    end;
    return nil, 0;
end;
v31.withinCurrentSubmenu = function(v196, v197)
    local v198 = v196._currentSubMenu:get();
    if v198 then
        local v199 = v196._menuList:get();
        local v200 = nil;
        for _, v202 in v199, nil, nil do
            if v202.id == v198 then
                v200 = v202.children;
                break;
            end;
        end;
        if v200 then
            for _, v204 in v200, nil, nil do
                if v204.id == v197 then
                    return true;
                end;
            end;
            return false;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v31.isMostRecentlyUsed = function(v205, v206)
    return table.find(v205._mostRecentlyUsed, v206) ~= nil;
end;
v31.removeRecentlyUsed = function(v207, v208)
    local v209 = table.find(v207._mostRecentlyUsedFullRecord, v208);
    if v209 then
        table.remove(v207._mostRecentlyUsedFullRecord, v209);
    end;
    v207:rebuildMostRecentlyUsed();
end;
v31.setRecentlyUsed = function(v210, v211, v212)
    if not v26() then
        if not (not v212 and (not v210:withinCurrentSubmenu(v211) or v210:isMostRecentlyUsed(v211))) then
            if not v21() or not v210:isUserPinned(v211) then
                table.insert(v210._mostRecentlyUsed, v211);
                local l__mostRecentlyUsedAndPinnedLimit_0 = v210._mostRecentlyUsedAndPinnedLimit;
                if v21() then
                    l__mostRecentlyUsedAndPinnedLimit_0 = v210._mostRecentlyUsedAndPinnedLimit - #v210._userPins;
                end;
                while v210._mostRecentlyUsedAndPinnedLimit >= 0 and l__mostRecentlyUsedAndPinnedLimit_0 < #v210._mostRecentlyUsed do
                    table.remove(v210._mostRecentlyUsed, 1);
                end;
                v210:updateMenuList();
                v210:updateNotificationTotals();
                local v214 = table.find(v210._mostRecentlyUsedFullRecord, v211);
                if v214 then
                    table.remove(v210._mostRecentlyUsedFullRecord, v214);
                end;
                table.insert(v210._mostRecentlyUsedFullRecord, v211);
            else
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v31.isUserPinned = function(v215, v216)
    return v21() and table.find(v215._userPins, v216) ~= nil;
end;
v31.removeUserPin = function(v217, v218)
    if v21() then
        local v219 = table.find(v217._userPins, v218);
        if v219 then
            table.remove(v217._userPins, v219);
        end;
        if v27() then
            v8.storeForLocalPlayer("ChromePinned", v217._userPins);
        end;
        v217:updateMenuList();
        v217:updateNotificationTotals();
        return ;
    else
        return ;
    end;
end;
v31.setUserPin = function(v220, v221, v222)
    if v27() then
        local v223 = v8.loadForLocalPlayer("ChromePinned") or {};
        if not table.find(v223, v221) then
            table.insert(v223, v221);
            v8.storeForLocalPlayer("ChromePinned", v223);
        else
            return ;
        end;
    end;
    if not (not (not (not v222 and (not v220:withinCurrentSubmenu(v221) or v220:isUserPinned(v221))) and #v220._userPins < v220._mostRecentlyUsedAndPinnedLimit) or not v21()) then
        table.insert(v220._userPins, v221);
        v220:removeRecentlyUsed(v221);
    end;
end;
v31.areUserPinsFull = function(v224)
    return v21() and v224._mostRecentlyUsedAndPinnedLimit <= #v224._userPins;
end;
v31.windowPosition = function(v225, v226)
    return v225._windowPositions[v226];
end;
v31.updateWindowPosition = function(v227, v228, v229)
    v227._windowPositions[v228] = v229;
end;
v31.activate = function(v230, v231)
    local v232 = nil;
    if v230._integrations[v231] then
        local v233 = false;
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v235 = true;
        if l_l_UserInputService_0_LastInputType_0 ~= Enum.UserInputType.MouseButton1 then
            v235 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Touch;
        end;
        v230:setRecentlyUsed(v231);
        local l_activated_0 = v230._integrations[v231].activated;
        v230._onIntegrationActivated:fire(v231);
        if v15() then
            v230:storeChromeInteracted();
        end;
        if v16() then
            v8.storeForLocalPlayer(v231, true);
        end;
        if not l_activated_0 then
            if v230._subMenuConfig[v231] then
                v230:toggleSubMenu(v231);
                v233 = true;
            end;
            v230:toggleWindow(v231);
        else
            local l_status_2, l_result_2 = pcall(function()
                l_activated_0(v230._integrations[v231]);
            end);
            if not l_status_2 then
                warn("ChromeService: activate error thrown for " .. v231);
                v232 = l_result_2;
            end;
        end;
        if v230._currentSubMenu:get() ~= v231 then
            v230._currentSubMenu:set(nil);
        end;
        local v239 = if not l_GetFFlagSupportCompactUtility_0() then nil else v230._currentCompactUtility ~= nil;
        if ((not v15() or v235) or v233) or v239 then
            if not ((v15() or v235) or v233) and v230._status:get() == v31.MenuStatus.Open then
                v230:toggleOpen();
            end;
        else
            v230:close();
        end;
    end;
    if v232 then
        error(v232);
    end;
end;
v31.selectedItem = function(v240)
    return v240._selectedItem;
end;
v31.setSelected = function(v241, v242)
    local v243, v244 = v241:withinCurrentTopLevelMenu(v242 or "");
    if v243 then
        local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
        local v246 = true;
        if l_l_UserInputService_0_LastInputType_1 ~= Enum.UserInputType.MouseButton1 then
            v246 = l_l_UserInputService_0_LastInputType_1 == Enum.UserInputType.Touch;
        end;
        local v247 = v241._currentSubMenu:get();
        if not (not (v247 and v247 ~= v242) or v246) then
            v241:toggleSubMenu(v247);
        end;
        v241._selectedItemIdx = v244;
        v241._selectedItem:set(v242);
        return ;
    else
        return ;
    end;
end;
v31.setSelectedByOffset = function(v248, v249)
    local v250 = v248._menuList:get();
    local _, v252 = v248:withinCurrentTopLevelMenu(v248._selectedItem:get() or "");
    if v252 > 0 then
        v248:setSelected(v250[math.clamp(v252 + v249, 1, #v250)].id);
    end;
end;
v31.repairSelected = function(v253)
    if v253._selectedItem:get() then
        local _, v255 = v253:withinCurrentTopLevelMenu(v253._selectedItem:get() or "");
        if v255 == 0 then
            v255 = v253._selectedItemIdx;
        end;
        local v256 = v253._menuList:get();
        v253:setSelected(v256[math.clamp(v255, 1, #v256)].id);
    end;
end;
v31.configureOrderAlignment = function(v257, v258)
    if v257._orderAlignment:get() ~= v258 then
        v257._orderAlignment:set(v258);
        v257:updateMenuList();
    end;
end;
v31.orderAlignment = function(v259)
    return v259._orderAlignment;
end;
v31.setMenuAbsolutePosition = function(v260, v261)
    if v261 ~= v260._menuAbsolutePosition then
        v260._menuAbsolutePosition = v261;
        v260._layout:set(createUnibarLayoutInfo(v261, v260._menuAbsoluteSizeClosed, v260._menuAbsoluteSizeOpen));
    end;
end;
v31.setMenuAbsoluteSize = function(v262, v263, v264)
    if not (v263 == v262._menuAbsoluteSizeClosed) or v264 ~= v262._menuAbsoluteSizeOpen then
        v262._menuAbsoluteSizeClosed = v263;
        v262._menuAbsoluteSizeOpen = v264;
        v262._layout:set(createUnibarLayoutInfo(v262._menuAbsolutePosition, v263, v264));
    end;
end;
v31.layout = function(v265)
    return v265._layout;
end;
return v31;
