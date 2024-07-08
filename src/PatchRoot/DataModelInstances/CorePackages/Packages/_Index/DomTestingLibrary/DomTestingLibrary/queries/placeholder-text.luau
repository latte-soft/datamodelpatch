local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
local v1 = {};
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local _ = require(script.Parent.Parent.types);
local v5 = require(script.Parent["all-utils"]);
local l_queryAllByAttribute_0 = v5.queryAllByAttribute;
local l_buildQueries_0 = v5.buildQueries;
local v8 = nil;
v8 = function(...)
    l_checkContainerType_0(({
        ...
    })[1]);
    return l_queryAllByAttribute_0("PlaceholderText", ...);
end;
local v9 = nil;
v9 = function(_, v11)
    return ("Found multiple elements with the placeholder text of: %s"):format((tostring(v11)));
end;
local v12 = nil;
v12 = function(_, v14)
    return ("Unable to find an element with the placeholder text of: %s"):format((tostring(v14)));
end;
local v15 = l_wrapAllByQueryWithSuggestion_0(v8, debug.info(v8, "n"), "queryAll");
local v16, v17, v18, v19, v20 = l_buildQueries_0(v8, v9, v12);
v1.queryByPlaceholderText = v16;
v1.queryAllByPlaceholderText = v15;
v1.getByPlaceholderText = v18;
v1.getAllByPlaceholderText = v17;
v1.findAllByPlaceholderText = v19;
v1.findByPlaceholderText = v20;
return v1;
