local v0 = require(script.Parent.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Boolean_0 = v0.Boolean;
local l_Map_0 = v0.Map;
local l_Set_0 = v0.Set;
local v4 = {};
local _ = require(script.Parent.Parent.Parent.types);
local l_formatDuration_0 = require(script.Parent.utils).formatDuration;
local _ = require(script.Parent.types);
local v8 = l_Map_0.new();
v4.getChartData = function(v9)
    local l_commitIndex_0 = v9.commitIndex;
    local l_commitTree_0 = v9.commitTree;
    local l_profilerStore_0 = v9.profilerStore;
    local l_rootID_0 = v9.rootID;
    local v14 = l_profilerStore_0:getCommitData(l_rootID_0, l_commitIndex_0);
    local l_fiberActualDurations_0 = v14.fiberActualDurations;
    local l_fiberSelfDurations_0 = v14.fiberSelfDurations;
    local l_nodes_0 = l_commitTree_0.nodes;
    local v18 = ("%s-%s"):format(tostring(l_rootID_0), (tostring(l_commitIndex_0)));
    if not v8:has(v18) then
        local v19 = l_Map_0.new();
        local v20 = l_Set_0.new();
        local v21 = {};
        local v22 = 0;
        local v23 = 0;
        local function v24(v25, v26, v27)
            v19:set(v25, v27);
            local v28 = l_nodes_0:get(v25);
            if v28 == nil then
                error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v25))));
            end;
            local l_children_0 = v28.children;
            local l_displayName_0 = v28.displayName;
            local l_hocDisplayNames_0 = v28.hocDisplayNames;
            local l_key_0 = v28.key;
            local l_treeBaseDuration_0 = v28.treeBaseDuration;
            local v34 = l_fiberActualDurations_0:get(v25) or 0;
            local v35 = l_fiberSelfDurations_0:get(v25) or 0;
            local v36 = l_fiberActualDurations_0:has(v25);
            local v37 = l_displayName_0 or "Anonymous";
            local v38 = not l_Boolean_0.toJSBoolean(l_key_0) and "" or (" key=\"%s\""):format((tostring(l_key_0)));
            local v39 = "";
            if l_hocDisplayNames_0 ~= nil and #l_hocDisplayNames_0 > 0 then
                v39 = string.format(" (%s)", (tostring(l_hocDisplayNames_0[1])));
            end;
            local v40 = string.format("%s%s%s%s", tostring(v37), tostring(v39), tostring(v38), not v36 and "" or string.format(" (%sms of %sms)", tostring(l_formatDuration_0(v35)), (tostring(l_formatDuration_0(v34)))));
            v22 = math.max(v22, v27);
            v23 = math.max(v23, v35);
            local v41 = {
                actualDuration = v34, 
                didRender = v36, 
                id = v25, 
                label = v40, 
                name = v37, 
                offset = v26 - l_treeBaseDuration_0, 
                selfDuration = v35, 
                treeBaseDuration = l_treeBaseDuration_0
            };
            if #v21 < v27 then
                table.insert(v21, {
                    v41
                });
            else
                table.insert(v21[v27 - 1], v41);
            end;
            local v42 = #l_children_0;
            while v42 >= 1 do
                v26 = v26 - v24(l_children_0[v42], v26, v27).treeBaseDuration;
                v42 = v42 - 1;
            end;
            return v41;
        end;
        local v43 = 0;
        if l_nodes_0.size > 0 then
            local v44 = l_nodes_0:get(l_rootID_0);
            if v44 == nil then
                error(string.format("Could not find root node with id \"%s\" in commit tree", (tostring(l_rootID_0))));
            end;
            local v45 = #v44.children;
            while v45 >= 1 do
                local v46 = v44.children[v45];
                local v47 = l_nodes_0:get(v46);
                if v47 == nil then
                    error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v46))));
                end;
                v43 = v43 + v47.treeBaseDuration;
                v24(v46, v43, 2);
                v45 = v45 - 1;
            end;
            for v48, _ in l_fiberActualDurations_0, nil, nil do
                local v50 = l_nodes_0:get(v48);
                if v50 ~= nil then
                    local l_parentID_0 = v50.parentID;
                    while l_parentID_0 ~= 0 and not v20:has(l_parentID_0) do
                        v20:add(l_parentID_0);
                        v50 = l_nodes_0:get(l_parentID_0);
                        if v50 ~= nil then
                            l_parentID_0 = v50.parentID;
                        else
                            l_parentID_0 = 0;
                        end;
                    end;
                end;
            end;
        end;
        local v52 = {
            baseDuration = v43, 
            depth = v22, 
            idToDepthMap = v19, 
            maxSelfDuration = v23, 
            renderPathNodes = v20, 
            rows = v21
        };
        v8:set(v18, v52);
        return v52;
    else
        return (v8:get(v18));
    end;
end;
v4.invalidateChartData = function()
    return v8:clear();
end;
return v4;
