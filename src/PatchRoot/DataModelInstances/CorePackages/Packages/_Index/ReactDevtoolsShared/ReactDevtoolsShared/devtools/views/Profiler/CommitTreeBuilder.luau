local v0 = require(script.Parent.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Map_0 = v0.Map;
local l_console_0 = v0.console;
local v4 = {};
local v5 = require(script.Parent.Parent.Parent.Parent.constants);
local l___DEBUG___0 = v5.__DEBUG__;
local l_TREE_OPERATION_ADD_0 = v5.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v5.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v5.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v5.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local _ = require(script.Parent.Parent.Parent.types);
local l_ElementTypeRoot_0 = require(script.Parent.Parent.Parent.Parent.types).ElementTypeRoot;
local _ = require(script.Parent.Parent.Parent.Parent.types);
local _ = require(script.Parent.types);
local function v16(v15, ...)
    if l___DEBUG___0 then
        print("[CommitTreeBuilder]", v15, ...);
    end;
end;
local function v25(v17)
    if l___DEBUG___0 then
        local l_nodes_0 = v17.nodes;
        local l_rootID_0 = v17.rootID;
        l_console_0.group("__printTree()");
        local v20 = {
            l_rootID_0, 
            0
        };
        while #v20 > 0 do
            local v21 = table.remove(v20, 1);
            local v22 = table.remove(v20, 1);
            local v23 = l_nodes_0:get(v21);
            if v23 == nil then
                error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v21))));
            end;
            l_console_0.log(string.format("%s%s:%s %s (%s)", string.rep("\226\128\162", v22), tostring(v23.id), tostring(v23.displayName or ""), not v23.key and "" or string.format("key:\"%s\"", (tostring(v23.key))), (tostring(v23.treeBaseDuration))));
            l_Array_0.forEach(v23.children, function(v24)
                l_Array_0.concat(v20, {
                    v24, 
                    v22 + 1
                });
            end);
        end;
        l_console_0.groupEnd();
    end;
end;
local function v61(v26, v27)
    local v28 = l_Map_0.new(v26.nodes);
    local function _(v29)
        local v30 = table.clone((v28:get(v29)));
        v28:set(v29, v30);
        return v30;
    end;
    local v32 = 3;
    local function _()
        local l_v32_0 = v32;
        v32 = v32 + 1;
        return l_v32_0;
    end;
    local v35 = nil;
    local v36 = {
        ""
    };
    local l_v32_1 = v32;
    v32 = v32 + 1;
    local v38 = v32 + v27[l_v32_1];
    while v32 < v38 do
        local l_v32_2 = v32;
        v32 = v32 + 1;
        table.insert(v36, v27[l_v32_2]);
    end;
    while v32 <= #v27 do
        local l_v32_3 = v32;
        v32 = v32 + 1;
        l_v32_1 = v27[l_v32_3];
        if l_v32_1 == l_TREE_OPERATION_ADD_0 then
            l_v32_3 = v32;
            v32 = v32 + 1;
            v35 = v27[l_v32_3];
            local l_v32_4 = v32;
            v32 = v32 + 1;
            local v42 = v27[l_v32_4];
            if v28:has(v35) then
                error("Commit tree already contains fiber " .. tostring(v35) .. ". This is a bug in React DevTools.");
            end;
            if v42 == l_ElementTypeRoot_0 then
                v32 = v32 + 2;
                if l___DEBUG___0 then
                    v16("Add", ("new root fiber %s"):format((tostring(v35))));
                end;
                v28:set(v35, {
                    children = {}, 
                    displayName = nil, 
                    hocDisplayNames = nil, 
                    id = v35, 
                    key = nil, 
                    parentID = 0, 
                    treeBaseDuration = 0, 
                    type = v42
                });
            else
                local l_v32_5 = v32;
                v32 = v32 + 1;
                l_v32_3 = v27[l_v32_5];
                v32 = v32 + 1;
                local l_v32_6 = v32;
                v32 = v32 + 1;
                l_v32_5 = v36[v27[l_v32_6] + 1];
                local l_v32_7 = v32;
                v32 = v32 + 1;
                local v46 = v36[v27[l_v32_7] + 1];
                if l___DEBUG___0 then
                    v16("Add", ("fiber %s (%s) as child of %s"):format(tostring(v35), tostring(l_v32_5 or "null"), (tostring(l_v32_3))));
                end;
                local v47 = table.clone((v28:get(l_v32_3)));
                v28:set(l_v32_3, v47);
                l_v32_7 = v47;
                l_v32_7.children = l_Array_0.concat(l_v32_7.children, v35);
                v28:set(v35, {
                    children = {}, 
                    displayName = l_v32_5, 
                    hocDisplayNames = nil, 
                    id = v35, 
                    key = v46, 
                    parentID = l_v32_3, 
                    treeBaseDuration = 0, 
                    type = v42
                });
            end;
        elseif l_v32_1 == l_TREE_OPERATION_REMOVE_0 then
            local l_v32_8 = v32;
            v32 = v32 + 1;
            for _ = 1, v27[l_v32_8] do
                local l_v32_9 = v32;
                v32 = v32 + 1;
                v35 = v27[l_v32_9];
                if not v28:has(v35) then
                    error("Commit tree does not contain fiber " .. tostring(v35) .. ". This is a bug in React DevTools.");
                end;
                l_v32_9 = v35;
                local v51 = table.clone((v28:get(l_v32_9)));
                v28:set(l_v32_9, v51);
                l_v32_9 = v51.parentID;
                v28:delete(v35);
                if v28:has(l_v32_9) then
                    local v52 = table.clone((v28:get(l_v32_9)));
                    v28:set(l_v32_9, v52);
                    v51 = v52;
                    if l___DEBUG___0 then
                        v16("Remove", ("fiber %s from parent %s"):format(tostring(v35), (tostring(l_v32_9))));
                    end;
                    v51.children = l_Array_0.filter(v51.children, function(v53)
                        return v53 ~= v35;
                    end);
                end;
            end;
        elseif l_v32_1 == l_TREE_OPERATION_REORDER_CHILDREN_0 then
            l_v32_3 = v32;
            v32 = v32 + 1;
            v35 = v27[l_v32_3];
            local l_v32_10 = v32;
            v32 = v32 + 1;
            local v55 = v27[l_v32_10];
            l_v32_3 = l_Array_0.slice(v27, v32, v32 + v55);
            v32 = v32 + v55;
            if l___DEBUG___0 then
                v16("Re-order", ("fiber %s children %s"):format(tostring(v35), (tostring(l_Array_0.join(l_v32_3, ",")))));
            end;
            local l_v35_0 = v35;
            local v57 = table.clone((v28:get(l_v35_0)));
            v28:set(l_v35_0, v57);
            v57.children = l_Array_0.from(l_v32_3);
        elseif l_v32_1 == l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 then
            l_v32_3 = v32;
            v32 = v32 + 1;
            v35 = v27[l_v32_3];
            l_v32_3 = v35;
            local v58 = table.clone((v28:get(l_v32_3)));
            v28:set(l_v32_3, v58);
            local l_v58_0 = v58;
            local l_v32_11 = v32;
            v32 = v32 + 1;
            l_v58_0.treeBaseDuration = v27[l_v32_11] / 1000;
            if l___DEBUG___0 then
                v16("Update", ("fiber %s treeBaseDuration to %s"):format(tostring(v35), (tostring(l_v58_0.treeBaseDuration))));
            end;
        else
            error(string.format("Unsupported Bridge operation %s at operation index %d", tostring(l_v32_1), v32));
        end;
    end;
    return {
        nodes = v28, 
        rootID = v26.rootID
    };
end;
local function v62(v63, v64, v65, v66)
    local v67 = v66.snapshots:get(v63);
    if v67 ~= nil then
        v65:set(v63, {
            id = v63, 
            children = v67.children, 
            displayName = v67.displayName, 
            hocDisplayNames = v67.hocDisplayNames, 
            key = v67.key, 
            parentID = v64, 
            treeBaseDuration = v66.initialTreeBaseDurations:get(v63), 
            type = v67.type
        });
        for _, v69 in v67.children, nil, nil do
            v62(v69, v63, v65, v66);
        end;
    end;
end;
local v70 = l_Map_0.new();
local function v71(v72)
    local l_commitIndex_0 = v72.commitIndex;
    local l_profilerStore_0 = v72.profilerStore;
    local l_rootID_1 = v72.rootID;
    if not v70:has(l_rootID_1) then
        v70:set(l_rootID_1, {});
    end;
    local v76 = v70:get(l_rootID_1);
    if l_commitIndex_0 <= #v76 then
        return v76[l_commitIndex_0];
    else
        local v77 = l_profilerStore_0:profilingData();
        if v77 == nil then
            error("No profiling data available");
        end;
        local v78 = v77.dataForRoots:get(l_rootID_1);
        if v78 == nil then
            error(string.format("Could not find profiling data for root \"%s\"", (tostring(l_rootID_1))));
        end;
        local l_operations_0 = v78.operations;
        if l_commitIndex_0 == 1 then
            local v80 = l_Map_0.new();
            v62(l_rootID_1, 0, v80, v78);
            if l_operations_0 ~= nil and l_commitIndex_0 <= #l_operations_0 then
                local v81 = v61({
                    nodes = v80, 
                    rootID = l_rootID_1
                }, l_operations_0[l_commitIndex_0]);
                if l___DEBUG___0 then
                    v25(v81);
                end;
                table.insert(v76, v81);
                return v81;
            end;
        else
            local v82 = v71({
                commitIndex = l_commitIndex_0 - 1, 
                profilerStore = l_profilerStore_0, 
                rootID = l_rootID_1
            });
            if l_operations_0 ~= nil and l_commitIndex_0 <= #l_operations_0 then
                local v83 = v61(v82, l_operations_0[l_commitIndex_0]);
                if l___DEBUG___0 then
                    v25(v83);
                end;
                table.insert(v76, v83);
                return v83;
            end;
        end;
        error(string.format("getCommitTree(): Unable to reconstruct tree for root \"%s\" and commit %s", tostring(l_rootID_1), (tostring(l_commitIndex_0))));
        return ;
    end;
end;
v4.getCommitTree = v71;
v4.invalidateCommitTrees = function()
    return v70:clear();
end;
return v4;
