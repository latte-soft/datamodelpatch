local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Symbol_0 = v2.Symbol;
local l_Object_0 = v2.Object;
local l_Error_0 = v2.Error;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local l_AsymmetricMatcher_0 = require(l_Parent_0.asymmetricMatchers).AsymmetricMatcher;
local _ = require(l_Parent_0.types);
local v9 = require(l_Parent_0.jestMatchersObject_extracted);
local l_JEST_MATCHERS_OBJECT_0 = v9.JEST_MATCHERS_OBJECT;
local v11 = l_Symbol_0.for_("$$jest-internal-matcher");
if not _G[l_JEST_MATCHERS_OBJECT_0] then
    _G[l_JEST_MATCHERS_OBJECT_0] = {
        matchers = {}, 
        state = {
            assertionCalls = 0, 
            expectedAssertionsNumber = nil, 
            isExpectingAssertions = false, 
            suppressedErrors = {}
        }
    };
end;
return {
    INTERNAL_MATCHER_FLAG = v11, 
    getState = v9.getState, 
    setState = function(v12)
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].state, v12);
    end, 
    getMatchers = function()
        return _G[l_JEST_MATCHERS_OBJECT_0].matchers;
    end, 
    setMatchers = function(v13, v14, v15)
        for v16, v17 in pairs(v13) do
            if not v14 then
                if typeof(v17) ~= "function" then
                    error(l_Error_0.new(("expect.extend: `%s` is not a valid matcher. Must be a function, is \"%s\""):format(tostring(v16), (tostring(l_getType_0(v17))))));
                end;
                local v18 = {};
                v18.__index = v18;
                setmetatable(v18, l_AsymmetricMatcher_0);
                v18.new = function(v19, ...)
                    if not (v19 ~= nil) then
                        v19 = false;
                    end;
                    local v20 = l_AsymmetricMatcher_0.new({
                        ...
                    }, v19);
                    setmetatable(v20, v18);
                    return v20;
                end;
                v18.asymmetricMatch = function(v21, v22)
                    local l_pass_0 = v17(v21:getMatcherContext(), v22, unpack(v21.sample)).pass;
                    if not v21.inverse then
                        return l_pass_0;
                    else
                        return not l_pass_0;
                    end;
                end;
                v18.toString = function(v24)
                    if not v24.inverse then
                        return (tostring(v16));
                    else
                        return string.format("never.%s", v16);
                    end;
                end;
                v18.getExpectedType = function(_)
                    return "any";
                end;
                v18.toAsymmetricMatcher = function(v26)
                    local l_sample_0 = v26.sample;
                    local v28 = 1;
                    local v29 = "";
                    while v28 < #l_sample_0 do
                        v29 = v29 .. tostring(l_sample_0[v28]) .. ", ";
                        v28 = v28 + 1;
                    end;
                    return string.format("%s<%s>", v26:toString(), v29 .. tostring(l_sample_0[v28]));
                end;
                v15[v16] = function(...)
                    return v18.new(false, ...);
                end;
                if not v15.never then
                    v15.never = {};
                end;
                v15.never[v16] = function(...)
                    return v18.new(true, ...);
                end;
            end;
        end;
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].matchers, v13);
    end
};
