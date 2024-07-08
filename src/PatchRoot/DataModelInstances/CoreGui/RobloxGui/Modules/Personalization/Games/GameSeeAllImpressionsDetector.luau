local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local l_ImpressionsVisualizer_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsVisualizer;
return function(v8)
    local v9 = v2.useRef({});
    local v10 = v2.useRef(l_Signal_0.new());
    local v12 = v2.useCallback(function(v11)
        return v8.gameSortId .. "_" .. v11;
    end, {
        v8.gameSortId
    });
    local v13 = nil;
    v13 = v2.useRef(nil);
    if v13.current == nil then
        v13.current = l_ImpressionsVisualizer_0.new(v8.impressionsTag, v12);
    end;
    assert(v13.current);
    local v14, v15 = v2.useState({});
    local v18 = l_useSelector_0(function(v16)
        local v17 = v16.Personalization.TopicContents[v8.gameSortId];
        return not not v17 and v17.updatedTimestamp or nil;
    end);
    v2.useEffect(function()
        v13.current:setCustomKeyMapper(v12);
        v10.current:fire();
    end, {
        v12
    });
    v2.useEffect(function()
        local v19 = v9.current[v8.gameSortId] or {};
        if v19.lastUpdatedTimestamp ~= nil and v18 ~= v19.lastUpdatedTimestamp then
            local l_impressionsSeen_0 = v19.impressionsSeen;
            if l_impressionsSeen_0 then
                local v21 = {};
                for v22, v23 in pairs(l_impressionsSeen_0) do
                    if v23 then
                        table.insert(v21, v22);
                    end;
                end;
                if #v21 > 0 then
                    v13.current:onClearImpressions(v21);
                end;
            end;
            v19.impressionsSeen = {};
        end;
        v19.lastUpdatedTimestamp = v18;
        v9.current[v8.gameSortId] = v19;
        v10.current:fire();
    end, l_dependencyArray_0(v8.gameSortId, v18));
    v2.useEffect(function()
        v10.current:fire();
        local v24 = nil;
        if v8.scrollViewPositionChangedSignal then
            v24 = v8.scrollViewPositionChangedSignal:connect(function()
                v10.current:fire();
            end);
        end;
        return function()
            if v24 ~= nil then
                v24:disconnect();
            end;
        end;
    end, {
        v8.scrollViewPositionChangedSignal
    });
    v2.useEffect(function()
        if v14 ~= nil and #v14 > 0 then
            v8.sendGameImpressions(v14);
            v13.current:onSendImpressions(v14);
            v15({});
        end;
    end, {
        v14
    });
    v2.useEffect(function()
        return function()
            v13.current:destroy();
        end;
    end, {});
    return v2.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v10.current, 
        parentRef = v8.parentRef, 
        filterImpressionFunc = v2.useCallback(function(v25)
            if v9.current[v8.gameSortId] == nil then
                v9.current[v8.gameSortId] = {
                    impressionsSeen = {}, 
                    lastUpdatedTimestamp = v18
                };
            end;
            local v26 = v9.current[v8.gameSortId];
            v26.impressionsSeen = v26.impressionsSeen or {};
            if v26.impressionsSeen[v25] ~= nil then
                return false;
            else
                v26.impressionsSeen[v25] = true;
                return true;
            end;
        end, {
            v8.gameSortId
        }), 
        onImpressionsDetected = v2.useCallback(function(v27)
            if not v27 or #v27 == 0 then
                return ;
            else
                v15(v27);
                return ;
            end;
        end, {}), 
        impressionsTag = v8.impressionsTag
    });
end;
