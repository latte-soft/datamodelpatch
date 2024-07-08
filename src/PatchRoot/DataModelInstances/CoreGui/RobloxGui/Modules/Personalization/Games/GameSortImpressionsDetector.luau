local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useRouteName;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_CorePackages_0.Cryo);
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local l_ImpressionsVisualizer_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsVisualizer;
return function(v9)
    local v10 = v2.useRef({});
    local v11 = v2.useRef(l_Signal_0.new());
    local v12 = nil;
    v12 = v2.useRef(nil);
    if v12.current == nil then
        v12.current = l_ImpressionsVisualizer_0.new(v9.impressionsTag);
    end;
    assert(v12.current);
    local v13, v14 = v2.useState({});
    local v15, v16 = v2.useState(v9.dataUpdatedTimestamp);
    local v17 = l_useRouteName_0();
    local v19 = l_useSelector_0(function(v18)
        return v18.ScreenSize;
    end);
    local v20 = v2.useRef(v9.impressionsTag);
    v2.useEffect(function()
        if v20.current ~= v9.impressionsTag then
            v20.current = v9.impressionsTag;
            v16(v9.dataUpdatedTimestamp);
            v10.current = {};
            v12.current:onClearAllImpressions();
            v12.current:setImpressionsTag(v9.impressionsTag);
        end;
    end, {
        v9.impressionsTag
    });
    v2.useEffect(function()
        v11.current:fire();
        local v21 = nil;
        if v9.scrollViewPositionChangedSignal then
            v21 = v9.scrollViewPositionChangedSignal:connect(function()
                v11.current:fire();
            end);
        end;
        return function()
            if v21 ~= nil then
                v21:disconnect();
            end;
        end;
    end, {
        v9.scrollViewPositionChangedSignal
    });
    v2.useEffect(function()
        local _ = false;
        if if type(v9.pageContext) == "table" then v6.List.find(v9.pageContext, v17) ~= nil else v17 == v9.pageContext then
            v11.current:fire();
            if v9.dataUpdatedTimestamp ~= v15 then
                v16(v9.dataUpdatedTimestamp);
                v10.current = {};
                v12.current:onClearAllImpressions();
            end;
        end;
    end, {
        v17, 
        v9.pageContext, 
        v9.dataUpdatedTimestamp, 
        v15, 
        v19
    });
    v2.useEffect(function()
        if v13 ~= nil and #v13 > 0 then
            v9.sendGameImpressions(v13);
            v12.current:onSendImpressions(v13);
            v14({});
        end;
    end, {
        v13
    });
    v2.useEffect(function()
        return function()
            v12.current:destroy();
        end;
    end, {});
    return v2.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v11.current, 
        parentRef = v9.parentRef, 
        filterImpressionFunc = v2.useCallback(function(v23)
            if v10.current[v23] ~= nil then
                return false;
            else
                v10.current[v23] = true;
                return true;
            end;
        end, {}), 
        onImpressionsDetected = v2.useCallback(function(v24)
            if not v24 or #v24 == 0 then
                return ;
            else
                v14(v24);
                return ;
            end;
        end, {}), 
        impressionsTag = v9.impressionsTag
    });
end;
