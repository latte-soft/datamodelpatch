local v0 = require(game:GetService("CorePackages").Cryo);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v3 = require(l_Actions_0.AddGameStat);
local v4 = require(l_Actions_0.RemoveGameStat);
local v5 = require(l_Actions_0.SetGameStatText);
local v6 = require(l_Actions_0.SetGameStatAddId);
local v7 = require(l_Parent_0.Flags.FFlagLeaderstatsWithASideOfClient);
local v8 = require(l_Parent_0.FormatStatString);
local function v13(v9, v10)
    if v9.isPrimary ~= v10.isPrimary then
        return v9.isPrimary;
    elseif v9.priority == v10.priority then
        if v7 then
            local l_serverAddId_0 = v9.serverAddId;
            local l_serverAddId_1 = v10.serverAddId;
            if not (not l_serverAddId_0 or not l_serverAddId_1) then
                return l_serverAddId_0 < l_serverAddId_1;
            end;
        end;
        return v9.addId < v10.addId;
    else
        return v10.priority < v9.priority;
    end;
end;
local v14 = 0;
return function(v15, v16)
    v15 = v15 or {};
    if v16.type == v3.name then
        local v17 = nil;
        local v18 = nil;
        local v19 = v8(nil);
        local v20 = {};
        for _, v22 in ipairs(v15) do
            if v22.name == v16.statName then
                v17 = v22.addId;
                v19 = v22.text;
                if v7 then
                    v18 = v22.serverAddId;
                end;
            else
                table.insert(v20, v22);
            end;
        end;
        v14 = v14 + 1;
        v20 = v0.List.join(v20, {
            {
                name = v16.statName, 
                text = v19, 
                addId = v17 or v14, 
                isPrimary = v16.isPrimary, 
                priority = v16.priority, 
                serverAddId = v18
            }
        });
        table.sort(v20, v13);
        return v20;
    elseif v16.type == v4.name then
        return v0.List.filter(v15, function(v23)
            return v23.name ~= v16.statName;
        end);
    elseif v16.type == v5.name then
        return v0.List.map(v15, function(v24)
            return v24.name == v16.statName and v0.Dictionary.join(v24, {
                text = v16.text
            }) or v24;
        end);
    elseif v7 and v16.type == v6.name then
        local v26 = v0.List.map(v15, function(v25)
            return v25.name == v16.statName and v0.Dictionary.join(v25, {
                serverAddId = v16.serverAddId
            }) or v25;
        end);
        table.sort(v26, v13);
        return v26;
    else
        return v15;
    end;
end;
