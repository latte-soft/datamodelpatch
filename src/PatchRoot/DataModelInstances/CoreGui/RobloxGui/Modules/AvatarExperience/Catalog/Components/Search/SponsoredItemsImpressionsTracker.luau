local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSignal_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSignal;
local l_useThrottledCallback_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useThrottledCallback;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v12 = game:DefineFastInt("AXSponsoredItemsImpressionsPeriod", 1);
local function v14(v13)
    return v13.ScreenSize;
end;
local function v16(v15)
    return v15.GlobalGuiInset;
end;
local function _(v17)
    if not (not v17 or not v17.id) and v17.type then
        return tostring(v17.type) .. "-" .. tostring(v17.id);
    else
        return "";
    end;
end;
return function(v19)
    local l_visibleItems_0 = v19.visibleItems;
    local l_scrollingFrameRef_0 = v19.scrollingFrameRef;
    local l_sponsoredGridRef_0 = v19.sponsoredGridRef;
    local l_requestImpressionsSignal_0 = v19.requestImpressionsSignal;
    local l_indexOffset_0 = v19.indexOffset;
    local v25 = v7(v10);
    local v26 = l_useSelector_0(v14);
    local v27 = l_useSelector_0(v16);
    local v28 = v3.useRef({});
    local function _()
        if l_sponsoredGridRef_0.current then
            local l_current_0 = l_sponsoredGridRef_0.current;
            return l_current_0.AbsolutePosition.Y + l_current_0.AbsoluteSize.Y / 2;
        else
            return nil;
        end;
    end;
    local function _()
        if l_scrollingFrameRef_0 and l_scrollingFrameRef_0.current then
            assert(l_scrollingFrameRef_0, "");
            local l_Y_0 = l_scrollingFrameRef_0.current.AbsolutePosition.Y;
            local v32 = v26.Y - v27.bottom;
            local v33;
            if l_sponsoredGridRef_0.current then
                local l_current_1 = l_sponsoredGridRef_0.current;
                v33 = l_current_1.AbsolutePosition.Y + l_current_1.AbsoluteSize.Y / 2;
            else
                v33 = nil;
            end;
            local v35;
            if v33 and l_Y_0 < v33 then
                v35 = true;
                if not (v33 >= v32) then
                    goto label0;
                end;
            end;
            v35 = false;
            ::label0::;
            return v35;
        else
            return false;
        end;
    end;
    local function v43()
        local v37 = {};
        local l_current_2 = v28.current;
        for v39, v40 in l_visibleItems_0, nil, nil do
            local l_v40_0 = v40;
            local v42 = if (not not l_v40_0 and l_v40_0.id) and l_v40_0.type then tostring(l_v40_0.type) .. "-" .. tostring(l_v40_0.id) else "";
            if not l_current_2[v42] then
                table.insert(v37, (v8.join(v40, {
                    index = v39
                })));
                l_current_2[v42] = true;
            end;
        end;
        v25.sendSponsoredItemsImpressions(v37, l_indexOffset_0);
    end;
    l_useSignal_0(l_requestImpressionsSignal_0, (l_useThrottledCallback_0(function()
        local v44;
        if l_scrollingFrameRef_0 and l_scrollingFrameRef_0.current then
            assert(l_scrollingFrameRef_0, "");
            local l_Y_1 = l_scrollingFrameRef_0.current.AbsolutePosition.Y;
            local v46 = v26.Y - v27.bottom;
            local v47;
            if l_sponsoredGridRef_0.current then
                local l_current_3 = l_sponsoredGridRef_0.current;
                v47 = l_current_3.AbsolutePosition.Y + l_current_3.AbsoluteSize.Y / 2;
            else
                v47 = nil;
            end;
            if v47 and l_Y_1 < v47 then
                v44 = true;
                if not (v47 >= v46) then
                    goto label1;
                end;
            end;
            v44 = false;
        else
            v44 = false;
        end;
        ::label1::;
        if v44 then
            v43();
        end;
    end, v12)));
    return nil;
end;
