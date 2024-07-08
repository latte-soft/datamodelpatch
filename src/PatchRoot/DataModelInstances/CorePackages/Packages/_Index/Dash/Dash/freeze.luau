local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Error);
local v3 = require(l_Parent_0.assertEqual);
local v4 = require(l_Parent_0.format);
local v5 = v2.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}");
local v6 = v2.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}");
return function(v7, v8, v9)
    v3(typeof(v7), "string", "Attempted to call Dash.freeze with argument #1 of type {left:?} not {right:?}");
    v3(typeof(v8), "table", "Attempted to call Dash.freeze with argument #2 of type {left:?} not {right:?}");
    local v10 = {};
    setmetatable(v10, {
        __index = function(_, v12)
            local v13 = v8[v12];
            if not (not (v13 == nil) or not v9) then
                v6:throw({
                    key = v12, 
                    objectName = v7
                });
            end;
            return v13;
        end, 
        __newindex = function(_, v15)
            v5:throw({
                key = v15, 
                objectName = v7
            });
        end, 
        __len = function()
            return #v8;
        end, 
        __tostring = function()
            return v4("Frozen({})", v7);
        end, 
        __call = function(_, ...)
            return v8(...);
        end
    });
    return v10;
end;
