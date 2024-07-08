local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_AssertionError_0 = v2.AssertionError;
local v5 = require(l_Parent_0.JestMatcherUtils);
local v6 = require(l_script_0.asymmetricMatchers);
local l_any_0 = v6.any;
local l_anything_0 = v6.anything;
local l_arrayContaining_0 = v6.arrayContaining;
local l_arrayNotContaining_0 = v6.arrayNotContaining;
local l_objectContaining_0 = v6.objectContaining;
local l_objectNotContaining_0 = v6.objectNotContaining;
local l_stringContaining_0 = v6.stringContaining;
local l_stringNotContaining_0 = v6.stringNotContaining;
local l_stringMatching_0 = v6.stringMatching;
local l_stringNotMatching_0 = v6.stringNotMatching;
local l_equals_0 = require(l_script_0.jasmineUtils).equals;
local v18 = require(l_script_0.jestMatchersObject);
local l_getMatchers_0 = v18.getMatchers;
local l_getState_0 = v18.getState;
local l_setMatchers_0 = v18.setMatchers;
local l_setState_0 = v18.setState;
local v23 = require(l_script_0.matchers);
local v24 = require(l_script_0.spyMatchers);
local l_matchers_0 = require(l_script_0.toThrowMatchers).matchers;
local _ = require(l_script_0.types);
local v27 = require(l_script_0.utils);
local l_iterableEquality_0 = v27.iterableEquality;
local l_subsetEquality_0 = v27.subsetEquality;
local v30 = nil;
local v31 = nil;
local function v38(_, v33, ...)
    if #{
        ...
    } ~= 0 then
        error("Expect takes at most one argument.");
    end;
    local v34 = l_getMatchers_0();
    local v35 = {
        never = {}, 
        rejects = {
            never = {}
        }, 
        resolves = {
            never = {}
        }
    };
    for v36, v37 in pairs(v34) do
        v35[v36] = v30(v37, false, "", v33);
        v35.never[v36] = v30(v37, true, "", v33);
    end;
    return v35;
end;
local function _(v39)
    if not v39 then
        return (v5.RECEIVED_COLOR("No message was specified for this matcher."));
    else
        return (v39());
    end;
end;
v30 = function(v41, v42, v43, v44, v45)
    return function(...)
        local v46 = true;
        local v47 = {
            dontThrow = function()
                v46 = false;
            end, 
            equals = l_equals_0, 
            error = v45, 
            isNot = v42, 
            promise = v43, 
            utils = l_Object_0.assign({
                iterableEquality = l_iterableEquality_0, 
                subsetEquality = l_subsetEquality_0
            }, v5)
        };
        l_Object_0.assign(v47, l_getState_0());
        local function v52(v48, v49)
            v31(v48);
            l_getState_0().assertionCalls = l_getState_0().assertionCalls + 1;
            if not (not (v48.pass and v42) and (v48.pass or v42)) then
                local l_message_0 = v48.message;
                local v51 = if not l_message_0 then v5.RECEIVED_COLOR("No message was specified for this matcher.") else l_message_0();
                l_message_0 = nil;
                if not v45 then
                    if not v49 then
                        l_message_0 = {
                            message = v51
                        };
                    else
                        error("Currently async is not implemented");
                    end;
                else
                    l_message_0 = v45;
                    l_message_0.message = v51;
                end;
                l_message_0.matcherResult = l_Object_0.assign({}, v48, {
                    message = v51
                });
                if not v46 then
                    table.insert(l_getState_0().suppressedErrors, error);
                else
                    error(l_AssertionError_0.new({
                        message = v51
                    }));
                    return ;
                end;
            end;
        end;
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        if not xpcall(function(...)
            v53 = v41(v47, v44, ...);
            return v52(v53);
        end, function(v56)
            v54 = debug.traceback(nil, 7);
            v55 = v56;
        end, ...) then
            if typeof(v55) == "table" and typeof(v55.message) == "string" then
                local v57 = l_AssertionError_0.new({
                    message = v55.message
                });
                v57.stack = v54;
                error(v57);
            else
                local v58 = l_AssertionError_0.new({
                    message = v55
                });
                v58.stack = v54;
                error(v58);
            end;
        end;
    end;
end;
v31 = function(v59)
    if not (typeof(v59) == "table" and typeof(v59.pass) == "boolean") or (v59.message and typeof(v59.message) ~= "string") and typeof(v59.message) ~= "function" then
        error("Unexpected return from a matcher function.\n" .. "Matcher functions should " .. "return an object in the following format:\n" .. "  {message?: string | function, pass: boolean}\n" .. v5.stringify(v59) .. " was returned");
    end;
end;
local v60 = {};
v60.extend = function(v61)
    l_setMatchers_0(v61, false, v60);
end;
v60.anything = l_anything_0;
v60.any = l_any_0;
v60.never = {
    arrayContaining = l_arrayNotContaining_0, 
    objectContaining = l_objectNotContaining_0, 
    stringContaining = l_stringNotContaining_0, 
    stringMatching = l_stringNotMatching_0
};
v60.objectContaining = l_objectContaining_0;
v60.arrayContaining = l_arrayContaining_0;
v60.stringContaining = l_stringContaining_0;
v60.stringMatching = l_stringMatching_0;
l_setMatchers_0(v23, true, v60);
l_setMatchers_0(v24, true, v60);
l_setMatchers_0(l_matchers_0, true, v60);
local l_plugins_0 = require(l_Parent_0.JestSnapshot).plugins;
v60.addSnapshotSerializer = l_plugins_0.addSerializer;
v60.resetSnapshotSerializers = l_plugins_0.resetSerializers;
v60.getState = l_getState_0;
v60.setState = l_setState_0;
local v63 = require(l_Parent_0.JestSnapshot);
l_setMatchers_0({
    toMatchSnapshot = v63.toMatchSnapshot, 
    toThrowErrorMatchingSnapshot = v63.toThrowErrorMatchingSnapshot
}, false, v60);
setmetatable(v60, {
    __call = v38
});
return v60;
