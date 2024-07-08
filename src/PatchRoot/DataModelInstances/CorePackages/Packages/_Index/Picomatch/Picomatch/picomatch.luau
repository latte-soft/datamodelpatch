local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local v7 = require(l_Parent_1.RegExp);
local v8 = require(l_Parent_0.scan);
local v9 = require(l_Parent_0.parse);
local v10 = require(l_Parent_0.utils);
local v11 = require(l_Parent_0.constants);
local function _(v12)
    local v13 = false;
    if typeof(v12) == "table" then
        v13 = not l_Array_0.isArray(v12);
    end;
    return v13;
end;
local v15 = nil;
local v20 = setmetatable({}, {
    __call = function(_, v17, v18, v19)
        return v15(v17, v18, v19);
    end
});
v15 = function(v21, v22, v23)
    local v24 = v23 or false;
    if not l_Array_0.isArray(v21) then
        local v25 = false;
        if typeof(v21) == "table" then
            v25 = not l_Array_0.isArray(v21);
        end;
        if v25 then
            v25 = l_Boolean_0.toJSBoolean(v21.tokens) and l_Boolean_0.toJSBoolean(v21.input);
        end;
        if not (v21 ~= "" and (not (typeof(v21) ~= "string") or v25)) then
            error(l_Error_0.new("TypeError: Expected pattern to be a non-empty string"));
        end;
        local v26 = v22 or {};
        local v27 = v10.isWindows(v22);
        local v28 = if not v25 then v20.makeRe(v21, v22, false, true) else v20.compileRe(v21, v22);
        local l_state_0 = v28.state;
        v28.state = nil;
        local v30 = nil;
        v30 = function(_)
            return false;
        end;
        if l_Boolean_0.toJSBoolean(v26.ignore) then
            v30 = v20(v26.ignore, l_Object_0.assign({}, v22, {
                ignore = l_Object_0.None, 
                onMatch = l_Object_0.None, 
                onResult = l_Object_0.None
            }), v24);
        end;
        local v32 = nil;
        local v36 = setmetatable({}, {
            __call = function(_, v34, v35)
                return v32(v34, v35);
            end
        });
        v32 = function(v37, v38)
            local v39 = v38 or false;
            local v40 = v20.test(v37, v28, v22, {
                glob = v21, 
                posix = v27
            });
            local l_isMatch_0 = v40.isMatch;
            local v42 = {
                glob = v21, 
                state = l_state_0, 
                regex = v28, 
                posix = v27, 
                input = v37, 
                output = v40.output, 
                match = v40.match, 
                isMatch = l_isMatch_0
            };
            if typeof(v26.onResult) == "function" then
                v26.onResult(v42);
            end;
            if l_isMatch_0 == false then
                v42.isMatch = false;
                if not v39 then
                    return false;
                else
                    return v42;
                end;
            elseif not v30(v37) then
                if typeof(v26.onMatch) == "function" then
                    v26.onMatch(v42);
                end;
                if not v39 then
                    return true;
                else
                    return v42;
                end;
            else
                if typeof(v26.onIgnore) == "function" then
                    v26.onIgnore(v42);
                end;
                v42.isMatch = false;
                if not v39 then
                    return false;
                else
                    return v42;
                end;
            end;
        end;
        if l_Boolean_0.toJSBoolean(v24) then
            v36.state = l_state_0;
        end;
        return v36;
    else
        local v44 = l_Array_0.map(v21, function(v43)
            return v20(v43, v22, v24);
        end);
        local v45 = nil;
        local v48 = setmetatable({}, {
            __call = function(_, v47)
                return v45(v47);
            end
        });
        v45 = function(v49)
            for _, v51 in ipairs(v44) do
                local v52 = v51(v49);
                if v52 then
                    return v52;
                end;
            end;
            return false;
        end;
        return v48;
    end;
end;
v20.test = function(v53, v54, v55, v56)
    local v57 = v56 or {};
    local l_glob_0 = v57.glob;
    local l_posix_0 = v57.posix;
    if typeof(v53) ~= "string" then
        error(l_Error_0.new("TypeError: Expected input to be a string"));
    end;
    if v53 == "" then
        return {
            isMatch = false, 
            output = ""
        };
    else
        local v60 = v55 or {};
        local v61 = if not l_Boolean_0.toJSBoolean(v60.format) then if l_Boolean_0.toJSBoolean(l_posix_0) then v10.toPosixSlashes else nil else v60.format;
        local v62 = v53 == l_glob_0;
        local v63 = if not not v62 and l_Boolean_0.toJSBoolean(v61) then v61(v53) else v53;
        if v62 == false then
            v63 = if not l_Boolean_0.toJSBoolean(v61) then v53 else v61(v53);
            v62 = v63 == l_glob_0;
        end;
        if not (v62 ~= false) or v60.capture == true then
            v62 = if not (v60.matchBase ~= true) or v60.basename == true then v20.matchBase(v53, v54, v55, l_posix_0) else v54:exec(v63);
        end;
        return {
            isMatch = l_Boolean_0.toJSBoolean(v62), 
            match = v62, 
            output = v63
        };
    end;
end;
v20.matchBase = function(_, _, _, _)
    error("matchBase not implemented");
end;
v20.isMatch = function(v68, v69, v70)
    return v20(v69, v70)(v68);
end;
v20.parse = function(v71, v72)
    if not l_Array_0.isArray(v71) then
        return v9(v71, l_Object_0.assign({}, v72, {
            fastpaths = false
        }));
    else
        return l_Array_0.map(v71, function(v73)
            return v20.parse(v73, v72);
        end);
    end;
end;
v20.scan = function(v74, v75)
    return v8(v74, v75);
end;
v20.compileRe = function(v76, v77, v78, v79)
    local v80 = v78 or false;
    local v81 = v79 or false;
    if v80 == true then
        return v76.output;
    else
        local v82 = v77 or {};
        local v83 = ("%s(?:%s)%s"):format(not l_Boolean_0.toJSBoolean(v82.contains) and "^" or "", tostring(v76.output), not l_Boolean_0.toJSBoolean(v82.contains) and "$" or "");
        if typeof(v76) == "table" and v76.negated == true then
            v83 = ("(?format(v83);
        end;
        local v84 = v20.toRegex(v83, v77);
        if v81 == true then
            v84.state = v76;
        end;
        return v84;
    end;
end;
v20.makeRe = function(v85, v86, v87, v88)
    local v89 = v86 or {};
    local v90 = v87 or false;
    local v91 = v88 or false;
    if not l_Boolean_0.toJSBoolean(v85) or typeof(v85) ~= "string" then
        error(l_Error_0.new("TypeError: Expected a non-empty string"));
    end;
    local v92 = {
        negated = false, 
        fastpaths = true
    };
    if v89.fastpaths ~= false and (not (string.sub(v85, 1, 1) ~= ".") or string.sub(v85, 1, 1) == "*") then
        v92.output = v9.fastpaths(v85, v89);
    end;
    if not l_Boolean_0.toJSBoolean(v92.output) then
        v92 = v9(v85, v89);
    end;
    return v20.compileRe(v92, v89, v90, v91);
end;
v20.toRegex = function(v93, v94)
    local l_status_0, l_result_0 = pcall(function()
        local v95 = v94 or {};
        return v7(v93, not not l_Boolean_0.toJSBoolean(v95.flags) and v95.flags or (l_Boolean_0.toJSBoolean(v95.nocase) and "i" or ""));
    end);
    if l_status_0 then
        return l_result_0;
    else
        if v94 ~= nil and v94.debug == true then
            error(l_result_0);
        end;
        return v7("$^");
    end;
end;
v20.constants = v11;
return v20;
