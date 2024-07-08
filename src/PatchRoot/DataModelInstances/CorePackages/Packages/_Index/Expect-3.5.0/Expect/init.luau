local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.JestMatcherUtils);
local v8 = require(l_script_0.asymmetricMatchers);
local l_any_0 = v8.any;
local l_anything_0 = v8.anything;
local l_arrayContaining_0 = v8.arrayContaining;
local l_arrayNotContaining_0 = v8.arrayNotContaining;
local l_closeTo_0 = v8.closeTo;
local l_notCloseTo_0 = v8.notCloseTo;
local l_nothing_0 = v8.nothing;
local l_objectContaining_0 = v8.objectContaining;
local l_objectNotContaining_0 = v8.objectNotContaining;
local l_stringContaining_0 = v8.stringContaining;
local l_stringMatching_0 = v8.stringMatching;
local l_stringNotContaining_0 = v8.stringNotContaining;
local l_stringNotMatching_0 = v8.stringNotMatching;
local l_default_0 = require(l_script_0.extractExpectedAssertionsErrors).default;
local l_equals_0 = require(l_script_0.jasmineUtils).equals;
local v24 = require(l_script_0.jestMatchersObject);
local l_getMatchers_0 = v24.getMatchers;
local l_getState_0 = v24.getState;
local l_setMatchers_0 = v24.setMatchers;
local l_setState_0 = v24.setState;
local v29 = require(l_script_0.matchers);
local v30 = require(l_script_0.spyMatchers);
local v31 = require(l_script_0.toThrowMatchers);
local l_matchers_0 = v31.matchers;
local l_createMatcher_0 = v31.createMatcher;
local _ = require(l_script_0.types);
local v35 = require(l_script_0.utils);
local l_iterableEquality_0 = v35.iterableEquality;
local l_subsetEquality_0 = v35.subsetEquality;
local v38 = nil;
local v39 = nil;
local v40 = setmetatable({}, {
    __index = l_Error_0
});
v40.__index = v40;
v40.new = function(v41)
    return (setmetatable(l_Error_0.new(v41), v40));
end;
local function _(v42)
    local v43 = not not l_Boolean_0.toJSBoolean(v42);
    if v43 then
        if typeof(v42) ~= "table" then
            v43 = false;
            if not (typeof(v42) == "function") then
                goto label0;
            end;
        end;
        v43 = typeof(v42.andThen) == "function";
    end;
    ::label0::;
    return v43;
end;
local function _(v45)
    return function(v46, v47, v48)
        return v45(v46, table.unpack({
            v47, 
            v48, 
            true
        }));
    end;
end;
local function _(v50, v51)
    if not (v50 ~= "toThrow") or v50 == "toThrowError" then
        return l_createMatcher_0(v50, true);
    elseif not (v50 ~= "toThrowErrorMatchingSnapshot") or v50 == "toThrowErrorMatchingInlineSnapshot" then
        return function(v52, v53, v54)
            return v51(v52, table.unpack({
                v53, 
                v54, 
                true
            }));
        end;
    else
        return nil;
    end;
end;
local v56 = nil;
local v57 = nil;
local function v70(_, v59, ...)
    if #{
        ...
    } ~= 0 then
        error("Expect takes at most one argument.");
    end;
    local v60 = l_getMatchers_0();
    local v61 = {
        never = {}, 
        rejects = {
            never = {}
        }, 
        resolves = {
            never = {}
        }
    };
    local v62 = v40.new();
    for v63, v64 in pairs(v60) do
        local v68 = if not (v63 ~= "toThrow") or v63 == "toThrowError" then l_createMatcher_0(v63, true) else (not (v63 ~= "toThrowErrorMatchingSnapshot") or v63 == "toThrowErrorMatchingInlineSnapshot") and function(v65, v66, v67)
            return v64(v65, table.unpack({
                v66, 
                v67, 
                true
            }));
        end or nil;
        local v69 = not not l_Boolean_0.toJSBoolean(v68) and v68 or v64;
        v61[v63] = v38(v64, false, "", v59);
        v61.never[v63] = v38(v64, true, "", v59);
        v61.resolves[v63] = v56(v63, v69, false, v59, v62);
        v61.resolves.never[v63] = v56(v63, v69, true, v59, v62);
        v61.rejects[v63] = v57(v63, v69, false, v59, v62);
        v61.rejects.never[v63] = v57(v63, v69, true, v59, v62);
    end;
    return v61;
end;
local function _(v71)
    if not v71 then
        return (v7.RECEIVED_COLOR("No message was specified for this matcher."));
    else
        return (v71());
    end;
end;
v56 = function(v73, v74, v75, v76, v77)
    return function(...)
        local v78 = {
            ...
        };
        local v79 = {
            isNot = v75, 
            promise = "resolves"
        };
        local l_v76_0 = v76;
        local v81 = not not l_Boolean_0.toJSBoolean(l_v76_0);
        if v81 then
            if typeof(l_v76_0) ~= "table" then
                v81 = false;
                if not (typeof(l_v76_0) == "function") then
                    goto label1;
                end;
            end;
            v81 = typeof(l_v76_0.andThen) == "function";
        end;
        ::label1::;
        if not v81 then
            error(v40.new(v7.matcherErrorMessage(v7.matcherHint(v73, nil, "", v79), ("%s value must be a promise"):format((tostring(v7.RECEIVED_COLOR("received")))), v7.printWithType("Received", v76, v7.printReceived))));
        end;
        v81 = v40.new();
        return v76:andThen(function(v82)
            return v38(v74, v75, "resolves", v82, v81)(table.unpack(v78));
        end, function(v83)
            v77.message = tostring(v7.matcherHint(v73, nil, "", v79)) .. "\n\n" .. "Received promise rejected instead of resolved\n" .. ("Rejected to value: %s"):format(v7.printReceived(v83));
            return v6.reject(v77);
        end);
    end;
end;
v57 = function(v84, v85, v86, v87, v88)
    return function(...)
        local v89 = {
            ...
        };
        local v90 = {
            isNot = v86, 
            promise = "rejects"
        };
        local v91 = if typeof(v87) == "function" then v87() else v87;
        local v92 = not not l_Boolean_0.toJSBoolean(v91);
        if v92 then
            if typeof(v91) ~= "table" then
                v92 = false;
                if not (typeof(v91) == "function") then
                    goto label2;
                end;
            end;
            v92 = typeof(v91.andThen) == "function";
        end;
        ::label2::;
        if not v92 then
            error(v40.new(v7.matcherErrorMessage(v7.matcherHint(v84, nil, "", v90), ("%s value must be a promise or a function returning a promise"):format((tostring(v7.RECEIVED_COLOR("received")))), v7.printWithType("Received", v87, v7.printReceived))));
        end;
        v92 = v40.new();
        return v91:andThen(function(v93)
            v88.message = tostring(v7.matcherHint(v84, nil, "", v90)) .. "\n\n" .. "Received promise resolved instead of rejected\n" .. ("Resolved to value: %s"):format(v7.printReceived(v93));
            return v6.reject(v88);
        end, function(v94)
            return v38(v85, v86, "rejects", v94, v92)(table.unpack(v89));
        end);
    end;
end;
v38 = function(v95, v96, v97, v98, v99)
    local function v100(...)
        local v101 = true;
        local v102 = {
            dontThrow = function()
                v101 = false;
            end, 
            equals = l_equals_0, 
            error = v99, 
            isNot = v96, 
            promise = v97, 
            utils = l_Object_0.assign({
                iterableEquality = l_iterableEquality_0, 
                subsetEquality = l_subsetEquality_0
            }, v7)
        };
        l_Object_0.assign(v102, l_getState_0());
        local function v107(v103, v104)
            v39(v103);
            l_getState_0().assertionCalls = l_getState_0().assertionCalls + 1;
            if not (not (v103.pass and v96) and (v103.pass or v96)) then
                local l_message_0 = v103.message;
                local v106 = if not l_message_0 then v7.RECEIVED_COLOR("No message was specified for this matcher.") else l_message_0();
                l_message_0 = nil;
                if not v99 then
                    if not v104 then
                        l_message_0 = v40.new(v106);
                    else
                        error("Currently async is not implemented");
                    end;
                else
                    l_message_0 = v99;
                    l_message_0.message = v106;
                end;
                l_message_0.matcherResult = l_Object_0.assign({}, v103, {
                    message = v106
                });
                if not v101 then
                    table.insert(l_getState_0().suppressedErrors, l_message_0);
                else
                    error(l_message_0);
                    return ;
                end;
            end;
        end;
        local function _(v108)
            if l_Error_0.captureStackTrace and typeof(v108) == "table" then
                l_Error_0.captureStackTrace(v108, v100);
            end;
            error(v108);
        end;
        local l_status_0, l_result_0 = pcall(function(...)
            v107((v95(v102, v98, ...)));
        end, ...);
        if not l_status_0 then
            if l_Error_0.captureStackTrace and typeof(l_result_0) == "table" then
                l_Error_0.captureStackTrace(l_result_0, v100);
            end;
            error(l_result_0);
        end;
    end;
    return v100;
end;
v39 = function(v112)
    if not (typeof(v112) == "table" and typeof(v112.pass) == "boolean") or (v112.message and typeof(v112.message) ~= "string") and typeof(v112.message) ~= "function" then
        error("Unexpected return from a matcher function.\n" .. "Matcher functions should " .. "return an object in the following format:\n" .. "  {message?: string | function, pass: boolean}\n" .. v7.stringify(v112) .. " was returned");
    end;
end;
local v113 = {};
v113.extend = function(v114)
    l_setMatchers_0(v114, false, v113);
end;
v113.anything = l_anything_0;
v113.any = l_any_0;
v113.nothing = l_nothing_0;
v113.never = {
    arrayContaining = l_arrayNotContaining_0, 
    closeTo = l_notCloseTo_0, 
    objectContaining = l_objectNotContaining_0, 
    stringContaining = l_stringNotContaining_0, 
    stringMatching = l_stringNotMatching_0
};
v113.objectContaining = l_objectContaining_0;
v113.arrayContaining = l_arrayContaining_0;
v113.closeTo = l_closeTo_0;
v113.stringContaining = l_stringContaining_0;
v113.stringMatching = l_stringMatching_0;
local function v115(v116)
    local v117 = l_Error_0.new();
    if l_Error_0.captureStackTrace then
        l_Error_0.captureStackTrace(v117, v115);
    end;
    l_setState_0({
        expectedAssertionsNumber = v116, 
        expectedAssertionsNumberError = v117
    });
end;
local function v118(...)
    local v119 = {
        ...
    };
    local v120 = l_Error_0.new();
    if l_Error_0.captureStackTrace then
        l_Error_0.captureStackTrace(v120, v118);
    end;
    v7.ensureNoExpected(v119[1], ".hasAssertions");
    l_setState_0({
        isExpectingAssertions = true, 
        isExpectingAssertionsError = v120
    });
end;
l_setMatchers_0(v29, true, v113);
l_setMatchers_0(v30, true, v113);
l_setMatchers_0(l_matchers_0, true, v113);
v113.addSnapshotSerializer = require(l_Parent_0.JestSnapshot).plugins.addSerializer;
v113.assertions = v115;
v113.hasAssertions = v118;
v113.getState = l_getState_0;
v113.setState = l_setState_0;
v113.extractExpectedAssertionsErrors = l_default_0;
local v121 = require(l_Parent_0.JestSnapshot);
l_setMatchers_0({
    toMatchSnapshot = v121.toMatchSnapshot, 
    toThrowErrorMatchingSnapshot = v121.toThrowErrorMatchingSnapshot
}, false, v113);
setmetatable(v113, {
    __call = v70
});
return v113;
