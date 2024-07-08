local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v6 = {};
local l_path_0 = require(l_Parent_1.Path).path;
local v8 = require(l_Parent_1.ChalkLua);
local function v10(v9)
    return v9:gsub("\\", "/");
end;
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local v13 = require(l_Parent_1.JestUtil);
local l_formatTime_0 = v13.formatTime;
local l_pluralize_0 = v13.pluralize;
local _ = require(l_Parent_0.types);
local v17 = nil;
local v18 = nil;
v6.printDisplayName = function(v19)
    local l_displayName_0 = v19.displayName;
    local function v21(...)
        return v8.reset(v8.inverse(v8.white(...)));
    end;
    if l_Boolean_0.toJSBoolean(l_displayName_0) then
        local v22 = nil;
        local v23 = nil;
        if l_displayName_0 ~= nil then
            v22 = l_displayName_0.name;
            v23 = l_displayName_0.color;
        end;
        return if not (v8.supportsColor ~= nil) or v8.supportsColor == true then (function(...)
            if l_Boolean_0.toJSBoolean(v23) and v8[v23] ~= nil then
                return v8.reset(v8.inverse(v8[v23](...)));
            else
                return v21(...);
            end;
        end)((" %s "):format(v22)) else v22;
    else
        return "";
    end;
end;
v6.trimAndFormatPath = function(v24, v25, v26, v27)
    local v28 = v27 - v24;
    local v29 = v17(v25, v26);
    local l_basename_0 = v29.basename;
    local l_dirname_0 = v29.dirname;
    local v32 = utf8.len(l_dirname_0 .. l_path_0.sep .. l_basename_0);
    assert(v32 ~= nil);
    if v32 <= v28 then
        return v10(v8.dim(l_dirname_0 .. l_path_0.sep) .. v8.bold(l_basename_0));
    else
        local v33 = utf8.len(l_basename_0);
        assert(v33);
        if v33 + 4 < v28 then
            return v10(v8.dim("..." .. l_String_0.slice(l_dirname_0, (utf8.len(l_dirname_0) - ((v28 - 4) - v33)) + 1, utf8.len(l_dirname_0) + 1) .. l_path_0.sep) .. v8.bold(l_basename_0));
        elseif v33 + 4 == v28 then
            return v10(v8.dim("..." .. l_path_0.sep) .. v8.bold(l_basename_0));
        else
            return v10(v8.bold("..." .. l_String_0.slice(l_basename_0, (v33 - v28) - 4, v33 + 1)));
        end;
    end;
end;
v6.formatTestPath = function(v34, v35)
    local v36 = v17(v34, v35);
    return v10(v8.dim(v36.dirname .. l_path_0.sep) .. v8.bold(v36.basename));
end;
v17 = function(_, v38)
    return {
        basename = l_path_0:basename(v38), 
        dirname = l_path_0:dirname(v38)
    };
end;
v6.relativePath = v17;
local function v47(v39)
    if v39 == nil then
        v39 = {};
    end;
    local v40 = 0;
    local v41 = 0;
    local v42 = 0;
    local v43 = 0;
    local v44 = 0;
    l_Array_0.forEach(v39, function(v45)
        local l_status_0 = v45.testCaseResult.status;
        if l_status_0 == "failed" then
            v40 = v40 + 1;
        elseif l_status_0 == "passed" then
            v41 = v41 + 1;
        elseif l_status_0 == "skipped" then
            v42 = v42 + 1;
        elseif l_status_0 == "todo" then
            v43 = v43 + 1;
        end;
        v44 = v44 + 1;
    end);
    return {
        numFailingTests = v40, 
        numPassingTests = v41, 
        numPendingTests = v42, 
        numTodoTests = v43, 
        numTotalTests = v44
    };
end;
v6.getSummary = function(v48, v49)
    local v50 = (DateTime.now().UnixTimestampMillis - v48.startTime) / 1000;
    if not (not (v49 ~= nil) or not v49.roundTime) then
        v50 = math.floor(v50);
    end;
    local v51 = v47(if v49 ~= nil then v49.currentTestCases else nil);
    local v52 = v49 ~= nil and v49.estimatedTime or 0;
    local l_snapshot_0 = v48.snapshot;
    local l_added_0 = l_snapshot_0.added;
    local l_unmatched_0 = l_snapshot_0.unmatched;
    local l_unchecked_0 = l_snapshot_0.unchecked;
    local l_filesRemoved_0 = l_snapshot_0.filesRemoved;
    local l_didUpdate_0 = l_snapshot_0.didUpdate;
    local l_matched_0 = l_snapshot_0.matched;
    local l_total_0 = l_snapshot_0.total;
    local l_updated_0 = l_snapshot_0.updated;
    local v62 = v48.numFailedTestSuites or 0;
    local v63 = v48.numPassedTestSuites or 0;
    local v64 = v48.numPendingTestSuites or 0;
    local v65 = v62 + v63;
    local v66 = v48.numTotalTestSuites or 0;
    local v67 = v48.numFailedTests or 0;
    local v68 = v48.numPassedTests or 0;
    local v69 = v48.numPendingTests or 0;
    local v70 = v48.numTodoTests or 0;
    local v71 = v48.numTotalTests or 0;
    local v72 = v49 ~= nil and v49.width or 0;
    local v73 = v8.bold("Test Suites: ") .. if v62 > 0 then v8.bold(v8.red(("%d failed"):format(v62))) .. ", " else "" .. if v64 > 0 then v8.bold(v8.yellow(("%d skipped"):format(v64))) .. ", " else "" .. if v63 > 0 then v8.bold(v8.green(("%d passed"):format(v63))) .. ", " else "" .. if v65 ~= v66 then tostring(v65) .. " of " .. tostring(v66) else tostring(v66) .. " total";
    local v74 = v67 + v51.numFailingTests;
    local v75 = v69 + v51.numPendingTests;
    local v76 = v70 + v51.numTodoTests;
    local v77 = v68 + v51.numPassingTests;
    return l_Array_0.join({
        v73, 
        v8.bold("Tests:       ") .. if v74 > 0 then v8.bold(v8.red(("%d failed"):format(v74))) .. ", " else "" .. if v75 > 0 then v8.bold(v8.yellow(("%d skipped"):format(v75))) .. ", " else "" .. if v76 > 0 then v8.bold(v8.magenta(("%d todo"):format(v76))) .. ", " else "" .. if v77 > 0 then v8.bold(v8.green(("%d passed"):format(v77))) .. ", " else "" .. ("%d total"):format(v71 + v51.numTotalTests), 
        v8.bold("Snapshots:   ") .. if l_unmatched_0 > 0 then v8.bold(v8.red(("%d failed"):format(l_unmatched_0))) .. ", " else "" .. ((not l_Boolean_0.toJSBoolean(l_unchecked_0) or l_didUpdate_0) and "" or v8.bold(v8.yellow(("%d obsolete"):format(l_unchecked_0))) .. ", ") .. if not not l_Boolean_0.toJSBoolean(l_unchecked_0) and l_didUpdate_0 then v8.bold(v8.green(("%d removed"):format(l_unchecked_0))) .. ", " else "" .. ((not l_Boolean_0.toJSBoolean(l_filesRemoved_0) or l_didUpdate_0) and "" or v8.bold(v8.yellow(l_pluralize_0("file", l_filesRemoved_0) .. " obsolete")) .. ", ") .. if not not l_Boolean_0.toJSBoolean(l_filesRemoved_0) and l_didUpdate_0 then v8.bold(v8.green(l_pluralize_0("file", l_filesRemoved_0) .. " removed")) .. ", " else "" .. (not l_Boolean_0.toJSBoolean(l_updated_0) and "" or v8.bold(v8.green(("%d updated"):format(l_updated_0))) .. ", ") .. (not l_Boolean_0.toJSBoolean(l_added_0) and "" or v8.bold(v8.green(("%d written"):format(l_added_0))) .. ", ") .. (not l_Boolean_0.toJSBoolean(l_matched_0) and "" or v8.bold(v8.green(("%d passed"):format(l_matched_0))) .. ", ") .. ("%d total"):format(l_total_0), 
        (v18(v50, v52, v72))
    }, "\n");
end;
v18 = function(v78, v79, v80)
    local v81 = v8.bold("Time:") .. ("        %s"):format(if not not l_Boolean_0.toJSBoolean(v79) and v79 + 1 <= v78 then v8.bold(v8.yellow(l_formatTime_0(v78, 0))) else l_formatTime_0(v78, 0));
    if v78 < v79 then
        v81 = v81 .. (", estimated %s"):format(l_formatTime_0(v79, 0));
    end;
    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
    local v83 = false;
    if v79 > 2 then
        v83 = false;
        if v78 < v79 then
            v83 = v80;
        end;
    end;
    if l_toJSBoolean_0(v83) then
        l_toJSBoolean_0 = math.min(40, v80);
        v83 = math.min(math.floor((v78 / v79) * l_toJSBoolean_0), l_toJSBoolean_0);
        if l_toJSBoolean_0 >= 2 then
            v81 = v81 .. "\n" .. v8.green("\226\150\136"):rep(v83) .. tostring(v8.white("\226\150\136"):rep(l_toJSBoolean_0 - v83));
        end;
    end;
    return v81;
end;
v6.wrapAnsiString = function(v84, _)
    return v84;
end;
return v6;
