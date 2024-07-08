local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.DataStoresUpdateSearchFilter);
return function(v2, v3)
    local v4 = v2 or {
        storesSearchTerm = ""
    };
    if v3.type == v1.name then
        return (v0.Set(v4, "storesSearchTerm", v3.searchTerm));
    else
        return v4;
    end;
end;
