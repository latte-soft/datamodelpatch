local v0 = require(script.Parent.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local l_Map_0 = v0.Map;
local v4 = {};
local _ = require(script.Parent.Parent.Parent.types);
local v6 = require(script.Parent.Parent.Parent.Parent.types);
local l_ElementTypeForwardRef_0 = v6.ElementTypeForwardRef;
local l_ElementTypeMemo_0 = v6.ElementTypeMemo;
local l_formatDuration_0 = require(script.Parent.utils).formatDuration;
local _ = require(script.Parent.types);
local v11 = l_Map_0.new();
v4.getChartData = function(v12)
    local l_commitIndex_0 = v12.commitIndex;
    local l_commitTree_0 = v12.commitTree;
    local l_profilerStore_0 = v12.profilerStore;
    local l_rootID_0 = v12.rootID;
    local v17 = l_profilerStore_0:getCommitData(l_rootID_0, l_commitIndex_0);
    local l_fiberActualDurations_0 = v17.fiberActualDurations;
    local l_fiberSelfDurations_0 = v17.fiberSelfDurations;
    local l_nodes_0 = l_commitTree_0.nodes;
    local v21 = ("%s-%s"):format(tostring(l_rootID_0), (tostring(l_commitIndex_0)));
    if not v11:has(v21) then
        local v22 = 0;
        local v23 = {};
        for v24, _ in l_fiberActualDurations_0, nil, nil do
            local v26 = l_nodes_0:get(v24);
            if v26 == nil then
                error(string.format("Could not find node with id \"%s\" in commit tree", (tostring(v24))));
            end;
            local l_displayName_0 = v26.displayName;
            local l_key_0 = v26.key;
            local l_parentID_0 = v26.parentID;
            local l_type_0 = v26.type;
            if l_parentID_0 ~= 0 then
                local v31 = l_fiberSelfDurations_0:get(v24) or 0;
                v22 = math.max(v22, v31);
                local v32 = l_displayName_0 or "Anonymous";
                local v33 = not l_Boolean_0.toJSBoolean(l_key_0) and "" or (" key=\"%s\""):format((tostring(l_key_0)));
                local v34 = "";
                if l_type_0 == l_ElementTypeForwardRef_0 then
                    v34 = " (ForwardRef)";
                elseif l_type_0 == l_ElementTypeMemo_0 then
                    v34 = " (Memo)";
                end;
                table.insert(v23, {
                    id = v24, 
                    label = ("%s%s%s (%sms)"):format(tostring(v32), tostring(v34), tostring(v33), (tostring(l_formatDuration_0(v31)))), 
                    name = v32, 
                    value = v31
                });
            end;
        end;
        local v37 = {
            maxValue = v22, 
            nodes = l_Array_0.sort(v23, function(v35, v36)
                return v36.value - v35.value;
            end)
        };
        v11:set(v21, v37);
        return v37;
    else
        return (v11:get(v21));
    end;
end;
v4.invalidateChartData = function()
    return v11:clear();
end;
return v4;
