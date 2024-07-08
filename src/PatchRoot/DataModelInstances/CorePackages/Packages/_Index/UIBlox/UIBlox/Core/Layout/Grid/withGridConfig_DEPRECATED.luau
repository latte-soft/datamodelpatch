local l_Parent_0 = script.Parent;
local l_Responsive_0 = l_Parent_0.Parent.Responsive;
local v2 = require(l_Parent_0.Parent.Parent.Parent.Parent.Roact);
local v3 = require(l_Responsive_0.ResponsiveLayoutContext);
local v4 = require(l_Responsive_0.ResponsiveLayoutConfigReader);
return function(v5, v6)
    return function(v7)
        return v2.createElement(v3.Consumer, {
            render = function(v8)
                local v9 = {};
                for v10, v11 in pairs(v5) do
                    v9[v10] = v4.getValue({
                        config = v8.config, 
                        breakpoint = v8.breakpoint, 
                        kind = v6 or v8.kind
                    }, v10);
                    if v9[v10] == nil then
                        v9[v10] = v11;
                    end;
                end;
                return v7(v9);
            end
        });
    end;
end;
