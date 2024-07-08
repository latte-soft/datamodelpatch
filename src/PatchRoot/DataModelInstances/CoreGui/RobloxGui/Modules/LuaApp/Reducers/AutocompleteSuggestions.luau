local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.AddAutocompleteSuggestion);
local v4 = require(l_Modules_0.LuaApp.Actions.AddAutocompleteSuggestionTable);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixAutocompleteEntryDups);
local function v8(v6, v7)
    return v6.position < v7.position;
end;
local function v19(v9, v10)
    local v11 = {};
    local v12 = {};
    for _, v14 in ipairs(v9) do
        v11[v14.hash] = v14;
    end;
    for _, v16 in ipairs(v10) do
        v11[v16.hash] = v16;
    end;
    for _, v18 in pairs(v11) do
        table.insert(v12, v18);
    end;
    return v12;
end;
return function(v20, v21)
    v20 = v20 or {};
    if v21.type == v3.name then
        return (v2.Dictionary.join(v20, {
            [v21.prefix] = v21.autocompleteSuggestion
        }));
    else
        if v21.type == v4.name then
            local v22 = {};
            for v23, v24 in pairs(v21.suggestionTable) do
                local v25 = v20[v23];
                if not v25 then
                    table.sort(v24.entries, v8);
                    v22[v23] = v24;
                elseif v25.preloadedCache then
                    local v26 = nil;
                    v26 = if not v5() then v2.List.join(v25.entries, v24.entries) else v19(v25.entries, v24.entries);
                    table.sort(v26, v8);
                    v25.entries = v26;
                    v22[v23] = v25;
                end;
            end;
            v20 = v2.Dictionary.join(v20, v22);
        end;
        return v20;
    end;
end;
