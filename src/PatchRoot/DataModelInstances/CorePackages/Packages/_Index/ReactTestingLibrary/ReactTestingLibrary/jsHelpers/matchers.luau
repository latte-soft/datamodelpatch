local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
return {
    toMatchInlineSnapshot = function(_, v2, v3)
        local function v4(v5)
            if typeof(v5) == "string" then
                return v5;
            elseif not l_Array_0.isArray(v5) then
                error("toMatchInlineSnapshot does not support " .. typeof(v5) .. ", please implement it yourself");
                return ;
            else
                return (("Array [\n%s\n]"):format(l_Array_0.join(l_Array_0.map(v5, function(v6)
                    return v4(v6);
                end), ",")));
            end;
        end;
        local function _(v7, v8)
            return v4(v7) == v8;
        end;
        return {
            pass = v4(v2) == v3, 
            message = function()
                return "expected " .. v3 .. " to equal " .. v4(v2);
            end
        };
    end
};
