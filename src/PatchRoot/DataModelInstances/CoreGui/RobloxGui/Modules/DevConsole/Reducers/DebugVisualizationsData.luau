local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.DebugVisualizationsUpdateSearchFilter);
return function(v2, v3)
    local v4 = v2 or {
        debugVisualizationsSearchTerm = "", 
        debugVisualizationsTypeFilters = {}
    };
    local v5 = nil;
    v5 = if v3.filterTypes == nil then v4.debugVisualizationsTypeFilters else v0.JoinDictionaries(v4.debugVisualizationsTypeFilters, v3.filterTypes);
    if v3.type == v1.name then
        return v0.JoinDictionaries(v4, {
            debugVisualizationsSearchTerm = v3.searchTerm, 
            debugVisualizationsTypeFilters = v5
        });
    else
        return v4;
    end;
end;
