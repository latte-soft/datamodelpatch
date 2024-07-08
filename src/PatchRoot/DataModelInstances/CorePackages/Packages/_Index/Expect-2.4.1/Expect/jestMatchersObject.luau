local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Symbol_0 = v1.Symbol;
local l_Object_0 = v1.Object;
local l_AsymmetricMatcher_0 = require(l_Parent_0.asymmetricMatchers).AsymmetricMatcher;
local _ = require(l_Parent_0.types);
local v6 = require(l_Parent_0.jestMatchersObject_extracted);
local l_JEST_MATCHERS_OBJECT_0 = v6.JEST_MATCHERS_OBJECT;
local v8 = l_Symbol_0.for_("$$jest-internal-matcher");
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
    INTERNAL_MATCHER_FLAG = v8, 
    getState = v6.getState, 
    setState = function(v9)
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].state, v9);
    end, 
    getMatchers = function()
        return _G[l_JEST_MATCHERS_OBJECT_0].matchers;
    end, 
    setMatchers = function(v10, v11, v12)
        for v13, v14 in pairs(v10) do
            if not v11 then
                local v15 = {};
                v15.__index = v15;
                setmetatable(v15, l_AsymmetricMatcher_0);
                v15.new = function(v16, ...)
                    if not (v16 ~= nil) then
                        v16 = false;
                    end;
                    local v17 = l_AsymmetricMatcher_0.new({
                        ...
                    }, v16);
                    setmetatable(v17, v15);
                    return v17;
                end;
                v15.asymmetricMatch = function(v18, v19)
                    local l_pass_0 = v14(v18:getMatcherContext(), v19, unpack(v18.sample)).pass;
                    if not v18.inverse then
                        return l_pass_0;
                    else
                        return not l_pass_0;
                    end;
                end;
                v15.toString = function(v21)
                    if not v21.inverse then
                        return (tostring(v13));
                    else
                        return string.format("never.%s", v13);
                    end;
                end;
                v15.getExpectedType = function(_)
                    return "any";
                end;
                v15.toAsymmetricMatcher = function(v23)
                    local l_sample_0 = v23.sample;
                    local v25 = 1;
                    local v26 = "";
                    while v25 < #l_sample_0 do
                        v26 = v26 .. tostring(l_sample_0[v25]) .. ", ";
                        v25 = v25 + 1;
                    end;
                    return string.format("%s<%s>", v23:toString(), v26 .. tostring(l_sample_0[v25]));
                end;
                v12[v13] = function(...)
                    return v15.new(false, ...);
                end;
                if not v12.never then
                    v12.never = {};
                end;
                v12.never[v13] = function(...)
                    return v15.new(true, ...);
                end;
            end;
        end;
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].matchers, v10);
    end
};
