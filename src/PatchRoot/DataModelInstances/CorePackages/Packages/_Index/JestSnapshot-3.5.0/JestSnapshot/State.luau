local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local _ = require(l_Parent_1.JestTypes);
local _ = require(l_Parent_0.PrettyFormat);
local v9 = require(l_Parent_0.utils);
local l_addExtraLineBreaks_0 = v9.addExtraLineBreaks;
local l_getSnapshotData_0 = v9.getSnapshotData;
local l_keyToTestName_0 = v9.keyToTestName;
local l_removeExtraLineBreaks_0 = v9.removeExtraLineBreaks;
local l_saveSnapshotFile_0 = v9.saveSnapshotFile;
local l_serialize_0 = v9.serialize;
local l_testNameToKey_0 = v9.testNameToKey;
local _ = require(l_Parent_0.types);
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20)
    local v21 = l_getSnapshotData_0(v19.getInstance(), v20.updateSnapshot);
    local l_data_0 = v21.data;
    return (setmetatable({
        _snapshotPath = v19, 
        _initialData = l_data_0, 
        _snapshotData = l_data_0, 
        _dirty = v21.dirty, 
        _inlineSnapshots = {}, 
        _uncheckedKeys = l_Set_0.new(l_Object_0.keys(l_data_0)), 
        _counters = {}, 
        _index = 0, 
        expand = v20.expand or false, 
        added = 0, 
        matched = 0, 
        unmatched = 0, 
        _updateSnapshot = v20.updateSnapshot, 
        updated = 0, 
        _snapshotFormat = v20.snapshotFormat
    }, v18));
end;
v18.markSnapshotsAsCheckedForTest = function(v23, v24)
    for _, v26 in v23._uncheckedKeys, nil, nil do
        if l_keyToTestName_0(v26) == v24 then
            v23._uncheckedKeys:delete(v26);
        end;
    end;
end;
v18._addSnapshot = function(v27, v28, v29, v30)
    v27._dirty = true;
    if not v30.isInline then
        v27._snapshotData[v28] = v29;
        return ;
    else
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        return ;
    end;
end;
v18.clear = function(v31)
    v31._snapshotData = v31._initialData;
    v31._inlineSnapshots = {};
    v31._counters = {};
    v31._index = 0;
    v31.added = 0;
    v31.matched = 0;
    v31.unmatched = 0;
    v31.updated = 0;
end;
v18.save = function(v32)
    local v33 = #l_Object_0.keys(v32._snapshotData) > 0;
    local v34 = #v32._inlineSnapshots > 0;
    local v35 = not v33 and not v34;
    local v36 = {
        deleted = false, 
        saved = false
    };
    if not (v32._dirty or v32._uncheckedKeys.size > 0) or v35 then
        if not v33 and v32._snapshotPath.getInstance() ~= nil then
            if v32._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox or in #jest-roblox");
            end;
            v36.deleted = true;
        end;
        return v36;
    else
        if v33 and (v32._dirty or v32._updateSnapshot == "all") then
            l_saveSnapshotFile_0(v32._snapshotData, v32._snapshotPath.getPath());
        end;
        if v34 then
            error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        end;
        v36.saved = true;
        return v36;
    end;
end;
v18.getUncheckedCount = function(v37)
    return v37._uncheckedKeys.size or 0;
end;
v18.getUncheckedKeys = function(v38)
    return l_Array_0.from(v38._uncheckedKeys);
end;
v18.removeUncheckedKeys = function(v39)
    if v39._updateSnapshot == "all" and v39._uncheckedKeys.size > 0 then
        v39._dirty = true;
        for _, v41 in v39._uncheckedKeys, nil, nil do
            v39._snapshotData[v41] = nil;
        end;
        v39._uncheckedKeys:clear();
    end;
end;
v18.match = function(v42, v43)
    local l_testName_0 = v43.testName;
    local l_received_0 = v43.received;
    local l_isInline_0 = v43.isInline;
    local l_error__0 = v43.error_;
    v42._counters[l_testName_0] = (v42._counters[l_testName_0] or 0) + 1;
    local v48 = v42._counters[l_testName_0];
    local v49 = if not v43.key then l_testNameToKey_0(l_testName_0, v48) else v43.key;
    if not l_isInline_0 or v42._snapshotData[v49] == nil then
        v42._uncheckedKeys:delete(v49);
    end;
    local v50 = l_addExtraLineBreaks_0(l_serialize_0(l_received_0, nil, v42._snapshotFormat));
    local v51 = nil;
    if not l_isInline_0 then
        v51 = v42._snapshotData[v49];
    else
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
    end;
    local v52 = v51 == v50;
    local v53 = v51 ~= nil;
    local l_status_0, _ = pcall(function()
        local _ = require(v42._snapshotPath.getInstance());
    end);
    local v57 = l_isInline_0 or l_status_0;
    if not (not v52 or l_isInline_0) then
        v42._snapshotData[v49] = v50;
    end;
    if not (not v53 or v42._updateSnapshot ~= "all") or not (v53 and v57) and (not (v42._updateSnapshot ~= "new") or v42._updateSnapshot == "all") then
        if v42._updateSnapshot == "all" then
            if v52 then
                v42.matched = v42.matched + 1;
            else
                if not v53 then
                    v42.added = v42.added + 1;
                else
                    v42.updated = v42.updated + 1;
                end;
                v42:_addSnapshot(v49, v50, {
                    error = l_error__0, 
                    isInline = l_isInline_0
                });
            end;
        else
            v42:_addSnapshot(v49, v50, {
                error = l_error__0, 
                isInline = l_isInline_0
            });
            v42.added = v42.added + 1;
        end;
        return {
            actual = "", 
            count = v48, 
            expected = "", 
            key = v49, 
            pass = true
        };
    elseif v52 then
        v42.matched = v42.matched + 1;
        return {
            actual = "", 
            count = v48, 
            expected = "", 
            key = v49, 
            pass = true
        };
    else
        v42.unmatched = v42.unmatched + 1;
        return {
            actual = l_removeExtraLineBreaks_0(v50), 
            count = v48, 
            expected = if not v51 then nil else l_removeExtraLineBreaks_0(v51), 
            key = v49, 
            pass = false
        };
    end;
end;
v18.fail = function(v58, v59, _, v61)
    v58._counters[v59] = (v58._counters[v59] or 0) + 1;
    v61 = v61 or l_testNameToKey_0(v59, v58._counters[v59]);
    v58._uncheckedKeys:delete(v61);
    v58.unmatched = v58.unmatched + 1;
    return v61;
end;
return {
    default = v18
};
