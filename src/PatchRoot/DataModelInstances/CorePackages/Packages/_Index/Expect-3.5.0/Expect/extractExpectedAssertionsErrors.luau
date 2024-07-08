local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.JestMatcherUtils);
local l_EXPECTED_COLOR_0 = v6.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v6.RECEIVED_COLOR;
local l_matcherHint_0 = v6.matcherHint;
local l_pluralize_0 = v6.pluralize;
local v11 = require(script.Parent.jestMatchersObject);
local l_getState_0 = v11.getState;
local l_setState_0 = v11.setState;
local _ = require(script.Parent.types);
local function _()
    l_setState_0({
        assertionCalls = 0, 
        expectedAssertionsNumber = l_Object_0.None, 
        isExpectingAssertions = false
    });
end;
local _ = nil;
v5.default = function()
    local v17 = {};
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local v23 = l_getState_0();
    v18 = v23.assertionCalls;
    v19 = v23.expectedAssertionsNumber;
    v20 = v23.expectedAssertionsNumberError;
    v21 = v23.isExpectingAssertions;
    v22 = v23.isExpectingAssertionsError;
    l_setState_0({
        assertionCalls = 0, 
        expectedAssertionsNumber = l_Object_0.None, 
        isExpectingAssertions = false
    });
    if typeof(v19) == "number" and v18 ~= v19 then
        v20.message = l_matcherHint_0(".assertions", "", tostring(v19), {
            isDirectExpectCall = true
        }) .. "\n\n" .. ("Expected %s to be called but received "):format((tostring((l_EXPECTED_COLOR_0(l_pluralize_0("assertion", v19)))))) .. tostring(l_RECEIVED_COLOR_0(l_pluralize_0("assertion call", not not l_Boolean_0.toJSBoolean(v18) and v18 or 0))) .. ".";
        if typeof(l_Error_0.__recalculateStacktrace) == "function" then
            l_Error_0.__recalculateStacktrace(v20);
        end;
        table.insert(v17, {
            actual = tostring(v18), 
            error = v20, 
            expected = tostring(v19)
        });
    end;
    if v21 and v18 == 0 then
        v22.message = tostring(l_matcherHint_0(".hasAssertions", "", "", {
            isDirectExpectCall = true
        })) .. "\n\n" .. ("Expected %s to be called but %s."):format(tostring((l_EXPECTED_COLOR_0("at least one assertion"))), (tostring((l_RECEIVED_COLOR_0("received none")))));
        if typeof(l_Error_0.__recalculateStacktrace) == "function" then
            l_Error_0.__recalculateStacktrace(v22);
        end;
        table.insert(v17, {
            actual = "none", 
            error = v22, 
            expected = "at least one"
        });
    end;
    return v17;
end;
return v5;
