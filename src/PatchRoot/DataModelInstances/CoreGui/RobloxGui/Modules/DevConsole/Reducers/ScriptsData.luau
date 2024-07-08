local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.ClientScriptsUpdateSearchFilter);
local v2 = require(script.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter);
return function(v3, v4)
    local v5 = v3 or {
        clientSearchTerm = "", 
        clientTypeFilters = {}, 
        serverSearchTerm = "", 
        serverTypeFilters = {}
    };
    if v4.type == v1.name then
        return (v0.JoinDictionaries(v5, {
            clientSearchTerm = v4.searchTerm, 
            clientTypeFilters = v0.JoinDictionaries(v5.clientTypeFilters, v4.filterTypes)
        }));
    elseif v4.type == v2.name then
        return (v0.JoinDictionaries(v5, {
            serverSearchTerm = v4.searchTerm, 
            serverTypeFilters = v0.JoinDictionaries(v5.serverTypeFilters, v4.filterTypes)
        }));
    else
        return v5;
    end;
end;
