local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
local v1 = {};
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local _ = require(script.Parent.Parent.types);
local v5 = require(script.Parent["all-utils"]);
local l_queryAllByAttribute_0 = v5.queryAllByAttribute;
local l_getConfig_0 = v5.getConfig;
local l_buildQueries_0 = v5.buildQueries;
local function _()
    return l_getConfig_0().testIdAttribute;
end;
local v10 = nil;
v10 = function(...)
    l_checkContainerType_0(({
        ...
    })[1]);
    return l_queryAllByAttribute_0(l_getConfig_0().testIdAttribute, ...);
end;
local v11 = nil;
v11 = function(_, v13)
    return ("Found multiple elements by: [%s=\"%s\"]"):format(l_getConfig_0().testIdAttribute, (tostring(v13)));
end;
local v14 = nil;
v14 = function(_, v16)
    return ("Unable to find an element by: [%s=\"%s\"]"):format(l_getConfig_0().testIdAttribute, (tostring(v16)));
end;
local v17 = l_wrapAllByQueryWithSuggestion_0(v10, debug.info(v10, "n"), "queryAll");
local v18, v19, v20, v21, v22 = l_buildQueries_0(v10, v11, v14);
v1.queryByTestId = v18;
v1.queryAllByTestId = v17;
v1.getByTestId = v20;
v1.getAllByTestId = v19;
v1.findAllByTestId = v21;
v1.findByTestId = v22;
return v1;
