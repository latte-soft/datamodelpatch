local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.ClientMemoryUpdateSearchFilter);
local v2 = require(script.Parent.Parent.Actions.ServerMemoryUpdateSearchFilter);
return function(v3, v4)
    local v5 = v3 or {
        clientSearchTerm = "", 
        serverSearchTerm = ""
    };
    if v4.type == v1.name then
        return (v0.Set(v5, "clientSearchTerm", v4.searchTerm));
    elseif v4.type == v2.name then
        return (v0.Set(v5, "serverSearchTerm", v4.searchTerm));
    else
        return v5;
    end;
end;
