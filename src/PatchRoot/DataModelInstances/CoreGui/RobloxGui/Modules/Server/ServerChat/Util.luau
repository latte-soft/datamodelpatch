local l_StandardPriority_0 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants")).StandardPriority;
if l_StandardPriority_0 == nil then
    l_StandardPriority_0 = 10;
end;
local v1 = {};
v1.__index = v1;
local v2 = {};
local v3 = {};
v3.__index = v3;
v3.RebuildProcessCommandsPriorities = function(v4)
    v4.RegisteredPriorites = {};
    for v5, v6 in pairs(v4.FunctionMap) do
        local v7 = true;
        for _, _ in pairs(v6) do
            v7 = false;
            break;
        end;
        if not v7 then
            table.insert(v4.RegisteredPriorites, v5);
        end;
    end;
    table.sort(v4.RegisteredPriorites, function(v10, v11)
        return v11 < v10;
    end);
end;
v3.HasFunction = function(v12, v13)
    if v12.RegisteredFunctions[v13] == nil then
        return false;
    else
        return true;
    end;
end;
v3.RemoveFunction = function(v14, v15)
    local v16 = v14.RegisteredFunctions[v15];
    v14.RegisteredFunctions[v15] = nil;
    v14.FunctionMap[v16][v15] = nil;
    v14:RebuildProcessCommandsPriorities();
end;
v3.AddFunction = function(v17, v18, v19, v20)
    if v20 == nil then
        v20 = l_StandardPriority_0;
    end;
    if v17.RegisteredFunctions[v18] then
        error(v18 .. " is already in use");
    end;
    v17.RegisteredFunctions[v18] = v20;
    if v17.FunctionMap[v20] == nil then
        v17.FunctionMap[v20] = {};
    end;
    v17.FunctionMap[v20][v18] = v19;
    v17:RebuildProcessCommandsPriorities();
end;
v3.GetIterator = function(v21)
    local v22 = 1;
    local v23 = nil;
    local v24 = nil;
    return function()
        while true do
            if #v21.RegisteredPriorites < v22 then
                return ;
            else
                local v25 = v21.RegisteredPriorites[v22];
                local v26, v27 = next(v21.FunctionMap[v25], v23);
                v23 = v26;
                v24 = v27;
                if v23 == nil then
                    v22 = v22 + 1;
                else
                    return v23, v24, v25;
                end;
            end;
        end;
    end;
end;
v2.new = function()
    local v28 = setmetatable({}, v3);
    v28.RegisteredFunctions = {};
    v28.RegisteredPriorites = {};
    v28.FunctionMap = {};
    return v28;
end;
v1.NewSortedFunctionContainer = function(_)
    return v2.new();
end;
return v1;
