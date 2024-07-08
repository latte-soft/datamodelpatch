local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local v6 = require(l_Parent_0.jsutils.invariant);
local l_InvariantError_0 = v6.InvariantError;
local l_invariant_0 = v6.invariant;
local l_Observable_0 = require(l_Parent_0.utilities).Observable;
local _ = require(script.Parent.types);
local v11 = require(script.Parent.Parent.utils);
local l_validateOperation_0 = v11.validateOperation;
local l_createOperation_0 = v11.createOperation;
local l_transformOperation_0 = v11.transformOperation;
local v15 = {};
v15.__index = v15;
local function v19(_, v17, v18)
    if not l_Boolean_0.toJSBoolean(v18) then
        return l_Observable_0.of();
    else
        return (v18(v17));
    end;
end;
local function v21(v20)
    if typeof(v20) == "function" then
        return v15.new(v20);
    else
        return v20;
    end;
end;
local _ = function(v22)
    local v23, _ = debug.info(v22.request, "a");
    return v23 <= 2;
end;
local v26 = setmetatable({}, {
    __index = l_Error_0
});
v26.__index = v26;
v26.new = function(v27, v28)
    local v29 = l_Error_0.new(v27);
    v29.link = v28;
    return (setmetatable(v29, v26));
end;
v15.empty = function()
    return v15.new(function(_)
        return l_Observable_0.of();
    end);
end;
v15.from = function(v31)
    if #v31 == 0 then
        return v15.empty();
    else
        return (l_Array_0.reduce(l_Array_0.map(v31, v21, nil), function(v32, v33)
            return v32:concat(v33);
        end));
    end;
end;
v15.split_ = function(v34, v35, v36)
    local v37 = if typeof(v35) == "function" then v15.new(v35) else v35;
    local v38 = nil;
    if l_Boolean_0.toJSBoolean(v36) and v36 ~= nil then
        v38 = if typeof(v36) == "function" then v15.new(v36) else v36;
    else
        local v39 = v15.new(v19);
        v38 = if typeof(v39) == "function" then v15.new(v39) else v39;
    end;
    local v40, v41 = debug.info(v37.request, "a");
    if v40 <= 2 then
        local v42;
        v41, v42 = debug.info(v38.request, "a");
        if v41 <= 2 then
            return v15.new(function(_, v44)
                if not v34(v44) then
                    local v45 = v38:request(v44);
                    return not not l_Boolean_0.toJSBoolean(v45) and v45 or l_Observable_0.of();
                else
                    local v46 = v37:request(v44);
                    return not not l_Boolean_0.toJSBoolean(v46) and v46 or l_Observable_0.of();
                end;
            end);
        end;
    end;
    return v15.new(function(_, v48, v49)
        if not v34(v48) then
            local v50 = v38:request(v48, v49);
            return not not l_Boolean_0.toJSBoolean(v50) and v50 or l_Observable_0.of();
        else
            local v51 = v37:request(v48, v49);
            return not not l_Boolean_0.toJSBoolean(v51) and v51 or l_Observable_0.of();
        end;
    end);
end;
v15.execute = function(v52, v53)
    local v54 = v52:request(l_createOperation_0(v53.context, l_transformOperation_0(l_validateOperation_0(v53))));
    return not not l_Boolean_0.toJSBoolean(v54) and v54 or l_Observable_0.of();
end;
v15.concat_ = function(v55, v56)
    local v57 = if typeof(v55) == "function" then v15.new(v55) else v55;
    local v58, v59 = debug.info(v57.request, "a");
    if not (v58 <= 2) then
        local v60 = if typeof(v56) == "function" then v15.new(v56) else v56;
        local v61;
        v59, v61 = debug.info(v60.request, "a");
        if not (v59 <= 2) then
            return v15.new(function(_, v63, v64)
                local v67 = v57:request(v63, function(v65)
                    local v66 = v60:request(v65, v64);
                    return not not l_Boolean_0.toJSBoolean(v66) and v66 or l_Observable_0.of();
                end);
                return not not l_Boolean_0.toJSBoolean(v67) and v67 or l_Observable_0.of();
            end);
        else
            return v15.new(function(_, v69)
                local v72 = v57:request(v69, function(v70)
                    local v71 = v60:request(v70);
                    return not not l_Boolean_0.toJSBoolean(v71) and v71 or l_Observable_0.of();
                end);
                return not not l_Boolean_0.toJSBoolean(v72) and v72 or l_Observable_0.of();
            end);
        end;
    else
        l_invariant_0.warn(v26.new("You are calling concat on a terminating link, which will have no effect", v57));
        return v57;
    end;
end;
v15.new = function(v73)
    local v74 = {};
    if l_Boolean_0.toJSBoolean(v73) then
        v74.request = v73;
    end;
    return (setmetatable(v74, v15));
end;
v15.split = function(v75, v76, v77, v78)
    return v75:concat(v15.split_(v76, v77, not not l_Boolean_0.toJSBoolean(v78) and v78 or v15.new(v19)));
end;
v15.concat = function(v79, v80)
    return v15.concat_(v79, v80);
end;
v15.request = function(_, _, _)
    error(l_InvariantError_0.new("request is not implemented"));
end;
v15.onError = function(_, v85, v86)
    if not (l_Boolean_0.toJSBoolean(v86) and v86 ~= nil) or not l_Boolean_0.toJSBoolean(v86.error) then
        error(v85);
        return ;
    else
        v86:error(v85);
        return false;
    end;
end;
v15.setOnError = function(v87, v88)
    v87.onError = v88;
    return v87;
end;
v0.ApolloLink = v15;
return v0;
