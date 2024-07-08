return function()
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.LuauPolyfill);
    local l_Array_0 = v1.Array;
    local l_Object_0 = v1.Object;
    local l_String_0 = v1.String;
    local l_Symbol_0 = v1.Symbol;
    local v6 = require(l_Parent_0.Promise);
    local v7 = {};
    local _ = require(l_Parent_0.JestTypes);
    local l_default_0 = require(script.Parent.createProcessObject).default;
    local l_default_1 = require(script.Parent.deepCyclicCopy).default;
    local v13 = l_Array_0.filter(l_Object_0.keys(_G), function(v11)
        local v12 = false;
        if typeof(v11) == "string" then
            v12 = l_String_0.startsWith(v11, "DTRACE");
        end;
        return v12;
    end);
    v7.default = function(v14, v15)
        v14.process = l_default_0();
        l_Object_0.assign(v14, {
            [l_Symbol_0.for_("jest-native-promise")] = v6, 
            [l_Symbol_0.for_("jest-native-now")] = DateTime.now, 
            ["jest-symbol-do-not-touch"] = l_Symbol_0
        });
        l_Array_0.forEach(v13, function(v16)
            v14[v16] = function(_, ...)
                return _G[v16](v14, table.unpack({
                    ...
                }));
            end;
        end);
        return l_Object_0.assign(v14, l_default_1(v15));
    end;
    return v7;
end;
