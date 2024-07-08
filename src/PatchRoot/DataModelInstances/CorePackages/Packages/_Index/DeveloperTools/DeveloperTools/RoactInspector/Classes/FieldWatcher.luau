local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v3 = require(l_Parent_1.Dash);
local l_assign_0 = v3.assign;
local l_class_0 = v3.class;
local l_collect_0 = v3.collect;
local l_copy_0 = v3.copy;
local l_keys_0 = v3.keys;
local l_pretty_0 = v3.pretty;
local l_reduce_0 = v3.reduce;
local l_shallowEqual_0 = v3.shallowEqual;
local l_insert_0 = table.insert;
local v15 = l_class_0("FieldWatcher", function(v13, v14)
    return {
        onFieldsChanged = v13, 
        activeFields = {}, 
        rootKey = v14
    };
end);
v15._init = function(v16)
    v16.onPoll = function()
        if not (not v16.root or not v16.polling) then
            v16:checkFields();
            delay(0.5, v16.onPoll);
        end;
    end;
end;
v15.monitor = function(v17)
    if not v17.polling then
        v17.polling = true;
        spawn(v17.onPoll);
    end;
end;
v15.checkFields = function(v18)
    local v22 = l_collect_0(v18.activeFields, function(v19, v20)
        local v21 = v18:walk(v18.root, v19);
        if l_shallowEqual_0(v20, v21) then
            return nil;
        else
            return v19, v21;
        end;
    end);
    l_assign_0(v18.activeFields, v22);
    local v23 = l_keys_0(v22);
    if #v23 > 0 then
        v18.onFieldsChanged(v23);
    end;
end;
v15.collect = function(v24, v25, v26, v27)
    if typeof(v25) ~= "table" then
        return {};
    else
        return (l_collect_0(v25, function(v28, v29)
            local v30 = typeof(v28) == "number" and v28 or tostring(v28);
            local v31 = l_copy_0(v27);
            l_insert_0(v31, v30);
            return v30, {
                Name = v30, 
                Summary = l_pretty_0(v29, {
                    depth = 2, 
                    arrayLength = true
                }), 
                Path = v31, 
                Children = (typeof(v29) == "table" and v26 > 0) and v24:collect(v29, v26 - 1, v31) or {}
            };
        end));
    end;
end;
v15.walk = function(v32, _, v34)
    local l_status_0, l_result_0 = pcall(function()
        return l_reduce_0(v34, function(v35, v36, v37)
            local v38 = v2(v35, v36);
            if not (v38 and v37 == 1) or not v32.rootKey then
                return v38;
            else
                return v38[v32.rootKey];
            end;
        end, v32.root);
    end);
    if not l_status_0 then
        warn(("Cannot walk path %s: %s "):format(l_pretty_0(v34), l_result_0));
        l_result_0 = nil;
    end;
    return l_result_0;
end;
v15.setRoot = function(v41, v42)
    v41.root = v42;
end;
v15.clear = function(v43)
    v43.activeFields = {};
    v43:monitor();
end;
v15.addPath = function(v44, v45)
    local v46 = v44:walk(v44.root, v45);
    v44.activeFields[v45] = not not v46 and l_copy_0(v46) or {};
end;
v15.destroy = function(v47)
    v47.root = nil;
    v47.polling = false;
end;
return v15;
