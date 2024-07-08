local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local v9 = require(l_Parent_0.jsUtils.invariant);
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = {};
v13.__index = v13;
v13.new = function(v14)
    local v15 = setmetatable({}, v13);
    if v14 == nil then
        v14 = {
            viewAreaCoveragePercentThreshold = 0
        };
    end;
    v15._hasInteracted = false;
    v15._timers = l_Set_0.new();
    v15._viewableIndices = {};
    v15._viewableItems = l_Map_0.new();
    v15._config = v14;
    return v15;
end;
v13.dispose = function(v16)
    v16._timers:forEach(function(v17)
        l_clearTimeout_0(v17);
    end);
end;
v13.computeViewableItems = function(v18, v19, v20, v21, v22, v23)
    local l_itemVisiblePercentThreshold_0 = v18._config.itemVisiblePercentThreshold;
    local l_viewAreaCoveragePercentThreshold_0 = v18._config.viewAreaCoveragePercentThreshold;
    local v26 = l_viewAreaCoveragePercentThreshold_0 ~= nil;
    local v27 = if not v26 then l_itemVisiblePercentThreshold_0 else l_viewAreaCoveragePercentThreshold_0;
    local l_v9_0 = v9;
    local v29 = false;
    if v27 ~= nil then
        v29 = (l_itemVisiblePercentThreshold_0 ~= nil) ~= (l_viewAreaCoveragePercentThreshold_0 ~= nil);
    end;
    l_v9_0(v29, "Must set exactly one of itemVisiblePercentThreshold or viewAreaCoveragePercentThreshold");
    l_v9_0 = {};
    if v19 == 0 then
        return l_v9_0;
    else
        v29 = 0;
        local v30 = nil;
        local v31 = nil;
        local v32 = v23 or {
            first = 1, 
            last = v19
        };
        v30 = v32.first;
        v31 = v32.last;
        if v19 < v31 then
            l_console_0.warn("Invalid render range computing viewability { renderRange = " .. tostring(v23) .. ", itemCount = " .. tostring(v19) .. " }");
            return {};
        else
            v32 = v30;
            while v32 <= v31 do
                local l_v32_0 = v32;
                local v34 = v22(l_v32_0);
                if v34 then
                    local v35 = v34.offset - v20;
                    local v36 = v35 + v34.length;
                    if v35 < v21 and v36 > 0 then
                        v29 = l_v32_0;
                        if v12(v26, v27, v35, v36, v21, v34.length) then
                            table.insert(l_v9_0, l_v32_0);
                        end;
                    elseif not (v29 < 1) then
                        break;
                    end;
                    v32 = v32 + 1;
                else
                    v32 = v32 + 1;
                end;
            end;
            return l_v9_0;
        end;
    end;
end;
v13.onUpdate = function(v37, v38, v39, v40, v41, v42, v43, v44)
    if (not (v37._config.waitForInteraction and not v37._hasInteracted) and v38 ~= 0) and v41(1) then
        local v45 = {};
        if v38 then
            v45 = v37:computeViewableItems(v38, v39, v40, v41, v44);
        end;
        if not (#v37._viewableIndices == #v45) or not l_Array_0.every(v37._viewableIndices, function(v46, v47)
            return v46 == v45[v47];
        end) then
            v37._viewableIndices = v45;
            if not v37._config.minimumViewTime then
                v37:_onUpdateSync(v45, v43, v42);
            else
                local v48 = nil;
                do
                    local l_v48_0 = v48;
                    l_v48_0 = l_setTimeout_0(function()
                        v37._timers:delete(l_v48_0);
                        v37:_onUpdateSync(v45, v43, v42);
                    end, v37._config.minimumViewTime);
                    v37._timers:add(l_v48_0);
                end;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v13.resetViewableIndices = function(v50)
    v50._viewableIndices = {};
end;
v13.recordInteraction = function(v51)
    v51._hasInteracted = true;
end;
v13._onUpdateSync = function(v52, v53, v54, v55)
    v53 = l_Array_0.filter(v53, function(v56)
        return l_Array_0.includes(v52._viewableIndices, v56);
    end);
    local l__viewableItems_0 = v52._viewableItems;
    local v60 = l_Map_0.new(l_Array_0.map(v53, function(v58)
        local v59 = v55(v58, true);
        return {
            v59.key, 
            v59
        };
    end));
    local v61 = {};
    for _, v63 in ipairs(v60:keys()) do
        if not l__viewableItems_0:has(v63) then
            table.insert(v61, v60:get(v63));
        end;
    end;
    for _, v65 in ipairs(l__viewableItems_0:keys()) do
        if not v60:has(v65) then
            table.insert(v61, l_Object_0.assign({}, l__viewableItems_0:get(v65), {
                isViewable = false
            }));
        end;
    end;
    if #v61 > 0 then
        v52._viewableItems = v60;
        v54({
            viewableItems = l_Array_0.from(v60:values()), 
            changed = v61, 
            viewabilityConfig = v52._config
        });
    end;
end;
v12 = function(v66, v67, v68, v69, v70, v71)
    if not v10(v68, v69, v70) then
        local v72 = v11(v68, v69, v70);
        return v67 <= 100 * if not v66 then v72 / v71 else v72 / v70;
    else
        return true;
    end;
end;
v11 = function(v73, v74, v75)
    return (math.max(0, math.min(v74, v75) - math.max(v73, 0)));
end;
v10 = function(v76, v77, v78)
    local v79 = false;
    if v76 >= 0 then
        v79 = false;
        if v77 <= v78 then
            v79 = v76 < v77;
        end;
    end;
    return v79;
end;
return v13;
