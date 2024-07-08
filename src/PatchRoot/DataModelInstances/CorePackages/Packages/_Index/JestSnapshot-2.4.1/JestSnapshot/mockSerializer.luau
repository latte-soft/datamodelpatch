local _ = require(script.Parent.Parent.PrettyFormat);
return {
    serialize = function(v1, v2, v3, v4, v5, v6)
        local v7 = v1.getMockName();
        local v8 = "";
        v8 = v7 == "jest.fn()" and "" or " " .. v7;
        local v9 = "";
        if #v1.mock.calls ~= 0 then
            local v10 = v3 .. v2.indent;
            v9 = " {" .. v2.spacingOuter .. v10 .. "\"calls\": " .. v6(v1.mock.calls, v2, v10, v4, v5);
            v9 = if not v2.min then v9 .. "," else v9 .. ", " .. v2.spacingOuter .. v10 .. "\"results\": " .. v6(v1.mock.results, v2, v10, v4, v5);
            if not v2.min then
                v9 = v9 .. ",";
            end;
            v9 = v9 .. v2.spacingOuter .. v3 .. "}";
        end;
        return "[MockFunction" .. v8 .. "]" .. v9;
    end, 
    test = function(v11)
        local l_v11_0 = v11;
        if l_v11_0 then
            l_v11_0 = false;
            if typeof(v11) == "table" then
                l_v11_0 = v11._isMockFunction;
            end;
        end;
        return l_v11_0;
    end
};
