local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_instanceof_0 = v1.instanceof;
local v4 = nil;
local l_Set_0 = v1.Set;
local l_Map_0 = v1.Map;
return {
    getType = function(v7)
        if v7 == nil then
            return "nil";
        elseif typeof(v7) == "boolean" then
            return "boolean";
        elseif typeof(v7) == "function" then
            return "function";
        elseif typeof(v7) == "number" then
            return "number";
        elseif typeof(v7) == "string" then
            return "string";
        elseif typeof(v7) == "DateTime" then
            return "DateTime";
        elseif not (typeof(v7) == "userdata") or not tostring(v7):match("Symbol%(.*%)") then
            if typeof(v7) == "table" then
                local l_status_0, l_result_0 = pcall(function()
                    local v8 = false;
                    if typeof(v7.test) == "function" then
                        v8 = typeof(v7.exec) == "function";
                    end;
                    return v8;
                end);
                if not (not l_status_0 or not l_result_0) then
                    v4 = require(l_Parent_0.RegExp);
                    if l_instanceof_0(v7, v4) then
                        return "regexp";
                    end;
                end;
            end;
            if not l_instanceof_0(v7, l_Error_0) then
                if not l_instanceof_0(v7, l_Map_0) then
                    if not l_instanceof_0(v7, l_Set_0) then
                        if typeof(v7) == "table" then
                            return "table";
                        elseif not (type(v7) ~= typeof(v7)) then
                            if type(v7) == "userdata" then
                                return "userdata";
                            elseif typeof(v7) == "thread" then
                                return "thread";
                            else
                                error(string.format("value of unknown type: %s (%s)", typeof(v7), (tostring(v7))));
                                return ;
                            end;
                        else
                            return (typeof(v7));
                        end;
                    else
                        return "set";
                    end;
                else
                    return "map";
                end;
            else
                return "error";
            end;
        else
            return "symbol";
        end;
    end, 
    isPrimitive = function(v11)
        local v12 = false;
        if typeof(v11) ~= "table" then
            v12 = false;
            if typeof(v11) ~= "function" then
                v12 = not (type(v11) ~= typeof(v11));
            end;
        end;
        return v12;
    end, 
    isRobloxBuiltin = function(v13)
        return type(v13) ~= typeof(v13);
    end
};
