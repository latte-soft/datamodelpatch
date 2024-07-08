local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local function _()
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("CoreScriptSyncService");
    end);
    return not not l_status_0 and l_result_0 or nil;
end;
local v5 = nil;
local v6 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Error_0 = v6.Error;
local l_Object_0 = v6.Object;
local l_Set_0 = v6.Set;
local _ = require(l_Parent_0.PrettyFormat);
local v12 = require(l_Parent_0.utils);
local l_addExtraLineBreaks_0 = v12.addExtraLineBreaks;
local l_getSnapshotData_0 = v12.getSnapshotData;
local l_keyToTestName_0 = v12.keyToTestName;
local l_removeExtraLineBreaks_0 = v12.removeExtraLineBreaks;
local l_saveSnapshotFile_0 = v12.saveSnapshotFile;
local l_serialize_0 = v12.serialize;
local l_testNameToKey_0 = v12.testNameToKey;
local l_robloxGetParent_0 = v12.robloxGetParent;
local _ = require(l_Parent_0.types);
local v22 = {};
v22.__index = v22;
v22.new = function(v23, v24)
    local v25 = l_getSnapshotData_0(v23, v24.updateSnapshot);
    local l_data_0 = v25.data;
    return (setmetatable({
        _snapshotPath = v23, 
        _initialData = l_data_0, 
        _snapshotData = l_data_0, 
        _dirty = v25.dirty, 
        _inlineSnapshots = {}, 
        _uncheckedKeys = l_Set_0.new(l_Object_0.keys(l_data_0)), 
        _counters = {}, 
        _index = 0, 
        expand = v24.expand or false, 
        added = 0, 
        matched = 0, 
        unmatched = 0, 
        _updateSnapshot = v24.updateSnapshot, 
        updated = 0, 
        _snapshotFormat = v24.snapshotFormat
    }, v22));
end;
v22.markSnapshotsAsCheckedForTest = function(v27, v28)
    for _, v30 in v27._uncheckedKeys:ipairs() do
        if l_keyToTestName_0(v30) == v28 then
            v27._uncheckedKeys:delete(v30);
        end;
    end;
end;
v22._addSnapshot = function(v31, v32, v33, v34)
    v31._dirty = true;
    if not v34.isInline then
        v31._snapshotData[v32] = v33;
        return ;
    else
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        return ;
    end;
end;
v22.clear = function(v35)
    v35._snapshotData = v35._initialData;
    v35._inlineSnapshots = {};
    v35._counters = {};
    v35._index = 0;
    v35.added = 0;
    v35.matched = 0;
    v35.unmatched = 0;
    v35.updated = 0;
end;
v22.save = function(v36)
    local v37 = #l_Object_0.keys(v36._snapshotData);
    local v38 = #v36._inlineSnapshots > 0;
    local v39 = not v37 and not v38;
    local v40 = {
        deleted = false, 
        saved = false
    };
    if v5 == nil then
        local l_status_1, l_result_1 = pcall(function()
            return game:GetService("CoreScriptSyncService");
        end);
        v5 = (not not l_status_1 and l_result_1 or nil) or false;
    end;
    if not v5 then
        error(l_Error_0("Attempting to save snapshots in an environment where CoreScriptSyncService is inaccessible.\n" .. "You may need to pass in --load.asRobloxScript."));
    end;
    local v43 = l_robloxGetParent_0(v5:GetScriptFilePath(_G.__JEST_TEST_CONTEXT__.instance), 1) .. "/__snapshots__/" .. _G.__JEST_TEST_CONTEXT__.instance.Name:match("(.*)%.spec") .. ".snap.lua";
    if not v36._dirty and not v36._uncheckedKeys.size or v39 then
        if not (v37 or not require(v43)) then
            if v36._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox or in #jest-roblox");
            end;
            v40.deleted = true;
        end;
        return v40;
    else
        if v37 then
            l_saveSnapshotFile_0(v36._snapshotData, v43);
        end;
        if v38 then
            error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        end;
        v40.saved = true;
        return v40;
    end;
end;
v22.getUncheckedCount = function(v44)
    return v44._uncheckedKeys.size or 0;
end;
v22.getUncheckedKeys = function(v45)
    return l_Array_0.from(v45._uncheckedKeys);
end;
v22.removeUncheckedKeys = function(v46)
    if v46._updateSnapshot == "all" and v46._uncheckedKeys.size > 0 then
        v46._dirty = true;
        for _, v48 in v46._uncheckedKeys:ipairs() do
            v46._snapshotData[v48] = nil;
        end;
        v46._uncheckedKeys:clear();
    end;
end;
v22.match = function(v49, v50)
    local l_testName_0 = v50.testName;
    local l_received_0 = v50.received;
    local l_isInline_0 = v50.isInline;
    local l_error__0 = v50.error_;
    v49._counters[l_testName_0] = (v49._counters[l_testName_0] or 0) + 1;
    local v55 = v49._counters[l_testName_0];
    local v56 = if not v50.key then l_testNameToKey_0(l_testName_0, v55) else v50.key;
    if not l_isInline_0 or v49._snapshotData[v56] == nil then
        v49._uncheckedKeys:delete(v56);
    end;
    local v57 = l_addExtraLineBreaks_0(l_serialize_0(l_received_0, nil, v49._snapshotFormat));
    local v58 = nil;
    if not l_isInline_0 then
        v58 = v49._snapshotData[v56];
    else
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
    end;
    local v59 = v58 == v57;
    local v60 = v58 ~= nil;
    local l_status_2, _ = pcall(function()
        local _ = require(v49._snapshotPath);
    end);
    local v64 = l_isInline_0 or l_status_2;
    if not (not v59 or l_isInline_0) then
        v49._snapshotData[v56] = v57;
    end;
    if not (not v60 or v49._updateSnapshot ~= "all") or not (v60 and v64) and (not (v49._updateSnapshot ~= "new") or v49._updateSnapshot == "all") then
        if v49._updateSnapshot == "all" then
            if v59 then
                v49.matched = v49.matched + 1;
            else
                if not v60 then
                    v49.added = v49.added + 1;
                else
                    v49.updated = v49.updated + 1;
                end;
                v49:_addSnapshot(v56, v57, {
                    error = l_error__0, 
                    isInline = l_isInline_0
                });
            end;
        else
            v49:_addSnapshot(v56, v57, {
                error = l_error__0, 
                isInline = l_isInline_0
            });
            v49.added = v49.added + 1;
        end;
        return {
            actual = "", 
            count = v55, 
            expected = "", 
            key = v56, 
            pass = true
        };
    elseif v59 then
        v49.matched = v49.matched + 1;
        return {
            actual = "", 
            count = v55, 
            expected = "", 
            key = v56, 
            pass = true
        };
    else
        v49.unmatched = v49.unmatched + 1;
        return {
            actual = l_removeExtraLineBreaks_0(v57), 
            count = v55, 
            expected = if not v58 then nil else l_removeExtraLineBreaks_0(v58), 
            key = v56, 
            pass = false
        };
    end;
end;
v22.fail = function(v65, v66, _, v68)
    v65._counters[v66] = (v65._counters[v66] or 0) + 1;
    v68 = v68 or l_testNameToKey_0(v66, v65._counters[v66]);
    v65._uncheckedKeys:delete(v68);
    v65.unmatched = v65.unmatched + 1;
    return v68;
end;
return v22;
