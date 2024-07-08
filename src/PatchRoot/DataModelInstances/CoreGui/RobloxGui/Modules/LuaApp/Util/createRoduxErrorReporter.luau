local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_inspect_0 = require(l_Modules_0.LuaApp.Util.inspect).inspect;
local v2 = require(l_Modules_0.LuaApp.Util.tableDiff);
local function v8(v3, v4, v5, v6)
    if type(v6.thrownValue) ~= "string" then
        return nil;
    else
        local v7 = v6.thrownValue:find("\n");
        if v7 then
            return {
                message = v6.message .. "\n" .. v6.thrownValue:sub(1, v7 - 1), 
                stacks = v6.thrownValue:sub(v7 + 1):split("\n\n"), 
                annotations = {
                    rodux_actions = v5, 
                    rodux_diff = v2(v3, v4) or {}
                }
            };
        else
            return nil;
        end;
    end;
end;
return function(v9)
    return {
        reportReducerError = function(_, v11, v12)
            v9(string.format("%s\n\nAction:\n%s\n\nError contents:\n%s", v12.message, l_inspect_0(v11), (tostring(v12.thrownValue))), (v8({}, {}, {
                v11
            }, v12)));
        end, 
        reportUpdateError = function(v13, v14, v15, v16)
            v9(string.format("%s\n\n" .. "Store changes in the last flush:\n%s\n\n" .. "Most recent actions (starting with the oldest):\n%s\n\n" .. "Error contents:\n%s", v16.message, l_inspect_0(v2(v13, v14)), l_inspect_0(v15), (tostring(v16.thrownValue))), (v8(v13, v14, v15, v16)));
        end
    };
end;
