local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Error_0 = v0.Error;
local l_inspect_0 = v0.util.inspect;
return {
    describeError = function(v3)
        if typeof(v3) == "string" then
            local _, v5 = string.find(v3, ":[%d]+: ");
            local v6 = v0.Error.new(if not v5 then v3 else string.sub(v3, v5 + 1));
            v6.stack = debug.traceback(nil, 2);
            return v6;
        else
            return v3;
        end;
    end, 
    errorToString = function(v7)
        local _ = nil;
        if typeof(v7) == "table" then
            if not v7.message or not v7.stack then
                return (l_inspect_0(v7));
            else
                return "\n------ Error caught by React ------\n" .. v7.message .. "\n------ Error caught by React ------\n" .. tostring(v7.stack);
            end;
        else
            return (l_inspect_0(v7));
        end;
    end, 
    parseReactError = function(v9)
        local v10 = string.split(v9, "\n------ Error caught by React ------\n");
        if #v10 == 3 then
            local v11, v12, v13 = table.unpack(v10);
            local v14 = l_Error_0.new(v12);
            v14.stack = v13;
            return v14, v11;
        else
            local v15 = l_Error_0.new(v9);
            v15.stack = nil;
            return v15, "";
        end;
    end, 
    __ERROR_DIVIDER = "\n------ Error caught by React ------\n"
};
