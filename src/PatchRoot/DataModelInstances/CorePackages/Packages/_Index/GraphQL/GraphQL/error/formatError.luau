local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Parent.LuauPolyfill);
local l_devAssert_0 = require(l_Parent_0.jsutils.devAssert).devAssert;
local _ = require(l_Parent_0.language.location);
local _ = require(script.Parent.GraphQLError);
return {
    formatError = function(v5)
        l_devAssert_0(v5, "Received nil error.");
        local v6 = if not not v5.message and string.len(v5.message) > 0 then v5.message else "An unknown error occurred.";
        local l_locations_0 = v5.locations;
        local l_path_0 = v5.path;
        local l_extensions_0 = v5.extensions;
        return not not l_extensions_0 and {
            message = v6, 
            locations = l_locations_0, 
            path = l_path_0, 
            extensions = l_extensions_0
        } or {
            message = v6, 
            locations = l_locations_0, 
            path = l_path_0
        };
    end
};
