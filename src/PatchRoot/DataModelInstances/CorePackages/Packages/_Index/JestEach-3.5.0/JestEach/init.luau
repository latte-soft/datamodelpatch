local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = require(script.nilPlaceholder);
local v7 = {};
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.bind).default;
local function v33(v10, v11, ...)
    local v12 = if select("#", ...) > 0 then {
        ...
    } else {};
    local v13 = #v12 == 0;
    local v14 = l_Array_0.isArray(v11) and l_Boolean_0.toJSBoolean(v11.raw);
    if not (v13 or v14) then
        error(l_Error_0.new("`.each` must only be called with an Array or Tagged Template Literal."));
    end;
    local v19 = setmetatable({}, {
        __call = function(_, v16, v17, v18)
            return l_default_0(v10.test)(v11, table.unpack(v12))(v16, v17, v18);
        end
    });
    v19.skip = l_default_0(if not v10.test then nil else v10.test.skip)(v11, table.unpack(v12));
    v19.only = l_default_0(if not v10.test then nil else v10.test.only)(v11, table.unpack(v12));
    local v24 = setmetatable({}, {
        __call = function(_, v21, v22, v23)
            return l_default_0(v10.it)(v11, table.unpack(v12))(v21, v22, v23);
        end
    });
    v24.skip = l_default_0(if not v10.it then nil else v10.it.skip)(v11, table.unpack(v12));
    v24.only = l_default_0(if not v10.it then nil else v10.it.only)(v11, table.unpack(v12));
    local v25 = l_default_0(v10.xit)(v11, table.unpack(v12));
    local v26 = l_default_0(v10.fit)(v11, table.unpack(v12));
    local v27 = l_default_0(v10.xtest)(v11, table.unpack(v12));
    local v32 = setmetatable({}, {
        __call = function(_, v29, v30, v31)
            return l_default_0(v10.describe, false)(v11, table.unpack(v12))(v29, v30, v31);
        end
    });
    v32.skip = l_default_0(if not v10.describe then nil else v10.describe.skip, false)(v11, table.unpack(v12));
    v32.only = l_default_0(if not v10.describe then nil else v10.describe.only, false)(v11, table.unpack(v12));
    return {
        describe = v32, 
        fdescribe = l_default_0(v10.fdescribe, false)(v11, table.unpack(v12)), 
        fit = v26, 
        it = v24, 
        test = v19, 
        xdescribe = l_default_0(v10.xdescribe, false)(v11, table.unpack(v12)), 
        xit = v25, 
        xtest = v27, 
        describeSKIP = l_default_0(v10.describeSKIP, false)(v11, table.unpack(v12)), 
        describeFOCUS = l_default_0(v10.describeFOCUS, false)(v11, table.unpack(v12)), 
        itSKIP = l_default_0(v10.itSKIP)(v11, table.unpack(v12)), 
        itFOCUS = l_default_0(v10.itFOCUS)(v11, table.unpack(v12)), 
        testSKIP = l_default_0(v10.testSKIP)(v11, table.unpack(v12)), 
        testFOCUS = l_default_0(v10.testFOCUS)(v11, table.unpack(v12))
    };
end;
local function v45(v34)
    if typeof(v34) == "string" then
        local v35 = {};
        local v36 = {};
        local v37 = 1;
        local v38 = 1;
        local v39 = false;
        for v40 = 1, #v34 do
            local v41 = string.sub(v34, v40, v40);
            local v42 = if v40 < #v34 then string.sub(v34, v40 + 1, v40 + 1) else nil;
            if v40 == #v34 then
                if v39 then
                    error("expression not closed");
                end;
                table.insert(v35, (string.sub(v34, v37)));
            elseif not v39 and v41 == "$" then
                if v42 == "{" then
                    v39 = true;
                    v38 = v40 - 1;
                end;
            elseif v39 and v41 == "}" then
                local v43 = string.sub(v34, v37, v38);
                local v44 = string.sub(v34, v38 + 3, v40 - 1);
                table.insert(v35, v43);
                table.insert(v36, v44);
                v37 = v40 + 1;
                v39 = false;
            end;
        end;
        return (setmetatable(v35, {
            __index = {
                raw = v34
            }
        }));
    else
        return v34;
    end;
end;
local function v55(v46)
    local v47 = if v46 ~= nil then v46 else {};
    l_Array_0.forEach(l_Object_0.keys(v47), function(v48)
        local v49 = v47[v48];
        v47[v48] = if typeof(v49) == "function" then setmetatable({}, {
            __call = function(_, ...)
                return v49(...);
            end
        }) else v49;
    end);
    return (setmetatable({
        withGlobal = function(v51)
            return function(v52, ...)
                return v33(v51, v45(v52), ...);
            end;
        end
    }, {
        __call = function(_, v54, ...)
            return v33(v47, v45(v54), ...);
        end
    }));
end;
v7.bind = l_default_0;
v7.default = v55;
v7.NIL = v6;
return v7;
