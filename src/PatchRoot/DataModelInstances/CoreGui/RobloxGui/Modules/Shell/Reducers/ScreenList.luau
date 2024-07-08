local l_CoreGui_0 = game:GetService("CoreGui");
local l_Actions_0 = l_CoreGui_0.RobloxGui.Modules.Shell.Actions;
local l_Common_0 = l_CoreGui_0.RobloxGui.Modules.Common;
local v3 = require(l_Actions_0.InsertScreen);
local v4 = require(l_Actions_0.RemoveScreen);
local v5 = require(l_Common_0.Immutable);
return function(v6, v7)
    v6 = v6 or {};
    assert(v6, "");
    if v7.type == v3.name then
        local v8 = v5.Append(v6, v7.item);
        table.sort(v8, function(v9, v10)
            if v9.priority == v10.priority then
                return v10.createdAt < v9.createdAt;
            else
                return v10.priority < v9.priority;
            end;
        end);
        return v8;
    elseif v7.type == v4.name then
        return v5.RemoveValueFromList(v6, v7.item);
    else
        return v6;
    end;
end;
