local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Error_0 = v0.Error;
local l_Object_0 = v0.Object;
local v4 = require(script.Parent.jsHelpers.dispatchEvent);
local v5 = {};
local l_getConfig_0 = require(script.Parent.config).getConfig;
local _ = require(script.Parent.helpers).getWindowFromNode;
local v8 = require(script.Parent["event-map"]);
local l_eventMap_0 = v8.eventMap;
local _ = v8.eventAliasMap;
local v15 = setmetatable({}, {
    __call = function(_, v12, v13, v14)
        return l_getConfig_0().eventWrapper(function()
            if not v13 then
                error(l_Error_0.new("Unable to fire an event - please provide an event object."));
            end;
            if not v12 then
                error(l_Error_0.new(("Unable to fire a \"%s\" event - please provide an Instance."):format(v13)));
            end;
            return v4(v12, v13, v14);
        end);
    end
});
l_Array_0.forEach(l_Object_0.keys(l_eventMap_0), function(v16)
    v15[v16] = function(v17, v18)
        return v15(v17, v16, v18);
    end;
end);
v5.fireEvent = v15;
return v5;
