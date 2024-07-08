local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v11 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
return function(v12)
    local v13 = v2.useRef({});
    local v14 = v2.useRef(l_Signal_0.new());
    local v15, v16 = v2.useState(nil);
    local v17 = v8(v9);
    local v18 = l_usePrevious_0(v12.omniFeedItems);
    local l_eventContext_0 = v12.eventContext;
    v2.useEffect(function()
        local v20 = nil;
        if v12.onItemsUpdatedSignal then
            v20 = v12.onItemsUpdatedSignal:connect(function()
                v14.current:fire();
            end);
        end;
        return function()
            if v20 ~= nil then
                v20:disconnect();
            end;
        end;
    end, {
        v12.onItemsUpdatedSignal
    });
    local function v31(v21)
        local l_omniFeedItems_0 = v12.omniFeedItems;
        if v17 then
            if not v21 or #v21 == 0 then
                return ;
            else
                local v23 = {};
                local v24 = {};
                local v25 = {};
                for v26 = 1, #v21 do
                    local v27 = v21[v26];
                    local v28 = l_omniFeedItems_0[v27];
                    local v29 = not not v28 and v28.treatmentType or "";
                    local v30 = v11.getUniqueNameForAnalytics(v28);
                    table.insert(v23, v27);
                    table.insert(v24, v29);
                    table.insert(v25, v30);
                end;
                v17:sendEventDeferred(l_eventContext_0, "feedImpressions", {
                    feedItemPos = table.concat(v23, ","), 
                    treatmentType = table.concat(v24, ","), 
                    feedItemNameId = table.concat(v25, ",")
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v2.useEffect(function()
        local v32 = false;
        if not (v18 ~= nil and v12.omniFeedItems ~= nil) or #v12.omniFeedItems < #v18 then
            v32 = true;
        else
            local v33 = 1;
            while v33 <= #v18 do
                if v18[v33] ~= v12.omniFeedItems[v33] then
                    v32 = true;
                    break;
                else
                    v33 = v33 + 1;
                end;
            end;
        end;
        if v32 then
            v13.current = {};
            v14.current:fire();
        end;
    end, l_dependencyArray_0(v12.omniFeedItems, v18));
    v2.useEffect(function()
        if v15 ~= nil then
            v31(v15);
            v16(nil);
        end;
    end, {
        v15
    });
    return v2.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v14.current, 
        filterImpressionFunc = function(v34)
            if v13.current[v34] ~= nil then
                return false;
            else
                v13.current[v34] = true;
                return true;
            end;
        end, 
        onImpressionsDetected = function(v35)
            v4.assert(v35 ~= nil);
            v4.assert(#v35 ~= 0);
            v16(v35);
        end, 
        impressionsTag = v12.impressionsTag, 
        skipZeroSizes = true
    });
end;
