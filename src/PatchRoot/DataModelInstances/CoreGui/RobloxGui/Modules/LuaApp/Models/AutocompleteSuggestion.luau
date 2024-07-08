local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Result);
local v2 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteCacheValidityHours);
local v3 = {
    EntryType = {
        Rich = 0, 
        Keyword = 1
    }, 
    new = function()
        return {
            expirationTime = 0
        };
    end
};
v3.fromJsonData = function(v4)
    if type(v4.prefix) ~= "string" then
        return v1.error("AutocompleteSuggestion.fromJsonData expects prefix to be a string");
    elseif type(v4.algorithmName) ~= "string" then
        return v1.error("AutocompleteSuggestion.fromJsonData expects algorithmName to be a string");
    else
        local v5 = v3.new();
        v5.prefix = v4.prefix;
        v5.algorithmName = v4.algorithmName;
        v5.entries = {};
        for v6 = 1, #v4.entries do
            local v7 = v4.entries[v6];
            if type(v7.type) ~= "number" then
                return v1.error("AutocompleteSuggestion.entries expects entry.type to be a number");
            elseif v7.type == v3.EntryType.Keyword then
                if type(v7.searchQuery) ~= "string" then
                    return v1.error("AutocompleteSuggestion.entries expects entry.searchQuery to be a string");
                else
                    table.insert(v5.entries, {
                        type = v7.type, 
                        searchQuery = v7.searchQuery
                    });
                end;
            elseif v7.type == v3.EntryType.Rich then
                if type(v7.universeId) ~= "number" and type(v7.universeId) ~= "string" then
                    return v1.error("AutocompleteSuggestion.entries expects entry.universeId to be a number or string");
                elseif type(v7.canonicalTitle) ~= "string" then
                    return v1.error("AutocompleteSuggestion.entries expects entry.canonicalTitle to be a string");
                else
                    table.insert(v5.entries, {
                        type = v7.type, 
                        universeId = tostring(v7.universeId), 
                        canonicalTitle = v7.canonicalTitle
                    });
                end;
            end;
        end;
        v5.expirationTime = tick() + (v2() * 60) * 60;
        return v1.success(v5);
    end;
end;
v3.fromJsonDataAvatar = function(v8)
    if type(v8.Args.Prefix) ~= "string" then
        return v1.error("AutocompleteSuggestion.fromJsonDataAvatar expects prefix to be a string");
    elseif v8.Args.Algo ~= nil and type(v8.Args.Algo) ~= "string" then
        return v1.error("AutocompleteSuggestion.fromJsonDataAvatar expects algorithmName to be a string");
    else
        local v9 = v3.new();
        v9.prefix = v8.Args.Prefix;
        v9.algorithmName = v8.Args.Algo;
        v9.entries = {};
        for v10 = 1, #v8.Data do
            local v11 = v8.Data[v10];
            if type(v11.Query) ~= "string" then
                return v1.error("AutocompleteSuggestion.fromJsonDataAvatar expects entry.Query to be a string");
            else
                table.insert(v9.entries, {
                    type = v3.EntryType.Keyword, 
                    searchQuery = v11.Query
                });
            end;
        end;
        v9.expirationTime = tick() + (v2() * 60) * 60;
        return v1.success(v9);
    end;
end;
return v3;
