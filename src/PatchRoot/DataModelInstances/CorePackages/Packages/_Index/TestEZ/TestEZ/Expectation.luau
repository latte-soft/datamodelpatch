local v0 = {};
local v1 = {
    to = true, 
    be = true, 
    been = true, 
    have = true, 
    was = true, 
    at = true
};
local v2 = {
    never = true
};
local function _(v3, v4, v5)
    v4 = v4 or "Assertion failed";
    v5 = v5 or 1;
    if not v3 then
        error(v4, v5 + 1);
    end;
end;
local function _(v7, v8)
    return function(v9, ...)
        if v9 == v7 then
            return v8(v7, ...);
        else
            return v8(v7, v9, ...);
        end;
    end;
end;
local function _(v11, v12, v13)
    if not v11 then
        return v13;
    else
        return v12;
    end;
end;
v0.new = function(v15)
    local v16 = {
        value = v15, 
        successCondition = true, 
        condition = false, 
        matchers = {}, 
        _boundMatchers = {}
    };
    setmetatable(v16, v0);
    local l_a_0 = v16.a;
    local l_l_a_0_0 = l_a_0 --[[ copy: 3 -> 4 ]];
    v16.a = function(v19, ...)
        if v19 == v16 then
            return l_l_a_0_0(v16, ...);
        else
            return l_l_a_0_0(v16, v19, ...);
        end;
    end;
    v16.an = v16.a;
    l_a_0 = v16.ok;
    local l_l_a_0_1 = l_a_0 --[[ copy: 3 -> 5 ]];
    v16.ok = function(v21, ...)
        if v21 == v16 then
            return l_l_a_0_1(v16, ...);
        else
            return l_l_a_0_1(v16, v21, ...);
        end;
    end;
    l_a_0 = v16.equal;
    local l_l_a_0_2 = l_a_0 --[[ copy: 3 -> 6 ]];
    v16.equal = function(v23, ...)
        if v23 == v16 then
            return l_l_a_0_2(v16, ...);
        else
            return l_l_a_0_2(v16, v23, ...);
        end;
    end;
    l_a_0 = v16.throw;
    local l_l_a_0_3 = l_a_0 --[[ copy: 3 -> 7 ]];
    v16.throw = function(v25, ...)
        if v25 == v16 then
            return l_l_a_0_3(v16, ...);
        else
            return l_l_a_0_3(v16, v25, ...);
        end;
    end;
    l_a_0 = v16.near;
    v16.near = function(v26, ...)
        if v26 == v16 then
            return l_a_0(v16, ...);
        else
            return l_a_0(v16, v26, ...);
        end;
    end;
    return v16;
end;
v0.checkMatcherNameCollisions = function(v27)
    if not (v1[v27] or v2[v27]) and not v0[v27] then
        return true;
    else
        return false;
    end;
end;
v0.extend = function(v28, v29)
    v28.matchers = v29 or {};
    for v30, v31 in pairs(v28.matchers) do
        local l__boundMatchers_0 = v28._boundMatchers;
        local function v38(_, ...)
            local v34 = v31(v28.value, ...);
            local v35 = v34.pass == v28.successCondition;
            local l_message_0 = v34.message;
            local v37 = 3;
            l_message_0 = l_message_0 or "Assertion failed";
            v37 = v37 or 1;
            if not v35 then
                error(l_message_0, v37 + 1);
            end;
            v28:_resetModifiers();
            return v28;
        end;
        l__boundMatchers_0[v30] = function(v39, ...)
            if v39 == v28 then
                return v38(v28, ...);
            else
                return v38(v28, v39, ...);
            end;
        end;
    end;
    return v28;
end;
v0.__index = function(v40, v41)
    if not v1[v41] then
        if not v2[v41] then
            if not v40._boundMatchers[v41] then
                return v0[v41];
            else
                return v40._boundMatchers[v41];
            end;
        else
            local v42 = v0.new(v40.value):extend(v40.matchers);
            v42.successCondition = not v40.successCondition;
            return v42;
        end;
    else
        return v40;
    end;
end;
v0._resetModifiers = function(v43)
    v43.successCondition = true;
end;
v0.a = function(v44, v45)
    local v46 = (type(v44.value) == v45) == v44.successCondition;
    local v47 = if not v44.successCondition then ("Expected value not of type %q, got value %q of type %s"):format(v45, tostring(v44.value), (type(v44.value))) else ("Expected value of type %q, got value %q of type %s"):format(v45, tostring(v44.value), (type(v44.value)));
    local v48 = 3;
    v47 = v47 or "Assertion failed";
    v48 = v48 or 1;
    if not v46 then
        error(v47, v48 + 1);
    end;
    v44:_resetModifiers();
    return v44;
end;
v0.an = v0.a;
v0.ok = function(v49)
    local v50 = (v49.value ~= nil) == v49.successCondition;
    local v51 = if not v49.successCondition then ("Expected value %q to be nil"):format((tostring(v49.value))) else ("Expected value %q to be non-nil"):format((tostring(v49.value)));
    local v52 = 3;
    v51 = v51 or "Assertion failed";
    v52 = v52 or 1;
    if not v50 then
        error(v51, v52 + 1);
    end;
    v49:_resetModifiers();
    return v49;
end;
v0.equal = function(v53, v54)
    local v55 = (v53.value == v54) == v53.successCondition;
    local v56 = if not v53.successCondition then ("Expected anything but value %q (%s)"):format(tostring(v54), (type(v54))) else ("Expected value %q (%s), got %q (%s) instead"):format(tostring(v54), type(v54), tostring(v53.value), (type(v53.value)));
    local v57 = 3;
    v56 = v56 or "Assertion failed";
    v57 = v57 or 1;
    if not v55 then
        error(v56, v57 + 1);
    end;
    v53:_resetModifiers();
    return v53;
end;
v0.near = function(v58, v59, v60)
    assert(type(v58.value) == "number", "Expectation value must be a number to use 'near'");
    assert(type(v59) == "number", "otherValue must be a number");
    local v61 = true;
    if type(v60) ~= "number" then
        v61 = v60 == nil;
    end;
    assert(v61, "limit must be a number or nil");
    v60 = v60 or 1.0E-7;
    local v62 = (math.abs(v58.value - v59) <= v60) == v58.successCondition;
    local v63 = if not v58.successCondition then ("Expected value to not be near %f (within %f) but got %f instead"):format(v59, v60, v58.value) else ("Expected value to be near %f (within %f) but got %f instead"):format(v59, v60, v58.value);
    local v64 = 3;
    v63 = v63 or "Assertion failed";
    v64 = v64 or 1;
    if not v62 then
        error(v63, v64 + 1);
    end;
    v58:_resetModifiers();
    return v58;
end;
v0.throw = function(v65, v66)
    local l_status_0, l_result_0 = pcall(v65.value);
    local v69 = l_status_0 ~= v65.successCondition;
    if not (not v66 or l_status_0) then
        v69 = if not v65.successCondition then l_result_0:find(v66, 1, true) == nil else l_result_0:find(v66, 1, true) ~= nil;
    end;
    local v70 = nil;
    v70 = if not v66 then if not v65.successCondition then ("Expected function to succeed, but it threw an error: %s"):format((tostring(l_result_0))) else "Expected function to throw an error, but it did not throw." else if not v65.successCondition then ("Expected function to never throw an error containing %q, but it threw: %s"):format(v66, (tostring(l_result_0))) else ("Expected function to throw an error containing %q, but it %s"):format(v66, not not l_result_0 and ("threw: %s"):format(l_result_0) or "did not throw.");
    local l_v69_0 = v69;
    local l_v70_0 = v70;
    local v73 = 3;
    l_v70_0 = l_v70_0 or "Assertion failed";
    v73 = v73 or 1;
    if not l_v69_0 then
        error(l_v70_0, v73 + 1);
    end;
    v65:_resetModifiers();
    return v65;
end;
return v0;
