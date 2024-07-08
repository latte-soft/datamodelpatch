local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v4 = require(script.Parent.RoactServicesContext);
local _ = require(script.Parent.RoactServicesTypes);
local v6 = v1.PureComponent:extend("ServiceProvider");
local v7 = {
    ServiceProvider = v6
};
v6.init = function(v8, v9)
    local v10 = {};
    if not (not v9 or not v9.services) then
        assert(v9.services, "Expected some services to connect, found none");
        assert(type(v9.services) == "table", "Expected the provided services to be a map");
        for v11, v12 in pairs(v9.services) do
            if type(v11) == "table" then
                v11.set(v10, v12);
            end;
        end;
    end;
    v8:setState({
        services = v10
    });
end;
v6.render = function(v13)
    return v1.createElement(v4.Provider, {
        value = v13.state.services
    }, v1.oneChild(v13.props[v1.Children]));
end;
v7.createService = function(v14)
    assert(type(v14) == "string", "Expected serviceName to be a string");
    local v15 = l_Symbol_0.named(v14);
    return {
        get = function(v16)
            if not v16 then
                return nil;
            else
                return v16[v15];
            end;
        end, 
        set = function(v17, v18)
            v17[v15] = v18;
        end
    };
end;
v7.connect = function(v19)
    assert(v19 ~= nil, "Expected some services to connect, found none.");
    return function(v20)
        assert(v20 ~= nil, "Expected a component to connect, found none.");
        local v21 = {};
        local v22 = v1.PureComponent:extend((("Services(%s)"):format((tostring(v20)))));
        v22.init = function(_, v24)
            for v25, v26 in pairs(v19) do
                assert(type(v25) == "string", string.format("serviceMap must be indexed by strings, not %s", (type(v25))));
                assert(type(v26) == "table", "serviceMap must have a service created by createService()");
                assert(type(v26.get) == "function", "serviceMap must have a service created by createService()");
                assert(v24.innerProps[v25] == nil, "Naming conflict with prop : " .. v25);
                v21[v25] = v26.get(v24.services);
            end;
        end;
        v22.render = function(v27)
            return v1.createElement(v20, (l_Immutable_0.JoinDictionaries(v27.props.innerProps, v21)));
        end;
        local v28 = v1.PureComponent:extend("ConnectionWrapper");
        v28.render = function(v29)
            return v1.createElement(v4.Consumer, {
                render = function(v30)
                    return v1.createElement(v22, {
                        innerProps = v29.props, 
                        services = v30
                    });
                end
            });
        end;
        return v28;
    end;
end;
return v7;
