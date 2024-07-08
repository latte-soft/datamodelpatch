local l_CorePackages_0 = game:GetService("CorePackages");
local l_Components_0 = script.Parent.Parent.Components;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Immutable);
local v4 = require(l_Components_0.DataContext);
return function(v5, ...)
    if not v5 then
        error("Expected component to be passed to connection, got nil.");
    end;
    local v6 = {};
    for v7 = 1, select("#", ...) do
        v6[v7] = select(v7, ...);
    end;
    local v8 = v2.Component:extend((string.format("Consumer(%s)_DependsOn_%s", tostring(v5), v6[1])));
    v8.init = function(v9)
        local v10 = {};
        for _, v12 in pairs(v6) do
            local v13 = v9.props.DevConsoleData[v12];
            if v13 then
                v10[v12] = v13;
            else
                error((string.format("%s %s", tostring(v12), "could not be found. Make sure DataProvider is above this consumer")));
                return ;
            end;
        end;
        v9:setState(v10);
    end;
    v8.render = function(v14)
        return v2.createElement(v5, (v3.JoinDictionaries(v14.props.componentProps, v14.state)));
    end;
    return function(v15)
        return v2.createElement(v4.Consumer, {
            render = function(v16)
                return v2.createElement(v8, {
                    componentProps = v15, 
                    DevConsoleData = v16
                });
            end
        });
    end;
end;
