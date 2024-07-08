local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.Logger);
local v4 = require(script.Parent.AppPolicyContext);
local function v10(v5, v6)
    local v7 = {};
    for _, v9 in ipairs(v6) do
        v7 = v2.Dictionary.join(v7, v9(v5));
    end;
    return v7;
end;
return function(v11)
    assert(v11, "expected getPolicyImpl");
    return function(v12)
        assert(type(v12) == "function", "connect expects mapper to be a function");
        return function(v13)
            local v14 = ("AppPolicy(%s)"):format((tostring(v13)));
            local v15 = v3:new(v14);
            v15:setContext({
                prefix = string.format("%s: ", v14)
            });
            local v16 = string.format("%s: Not a descendent of PolicyProvider", v14);
            local v17 = v1.PureComponent:extend(v14);
            v15:trace("Connected to component: {}", (tostring(v13)));
            v17.init = function(v18, v19)
                v18.policyContext = v19.policy;
                assert(v18.policyContext, v16);
                v18.setWithEmptyPolicy = function()
                    v18.state = {
                        policy = v10({}, v18.policyContext.presentationPolicy)
                    };
                end;
                if not v18.policyContext.staticExternalPolicy then
                    local v20 = v11.read();
                    if not v20 then
                        v18.setWithEmptyPolicy();
                        v15:trace("No app policy data available");
                    else
                        v18.state = {
                            policy = v10(v20, v18.policyContext.presentationPolicy)
                        };
                    end;
                    v18.onPolicyChanged = function(v21)
                        v18:setState({
                            policy = v10(v21, v18.policyContext.presentationPolicy)
                        });
                    end;
                    return ;
                else
                    v18.state = {
                        policy = v10(v18.policyContext.staticExternalPolicy, v18.policyContext.presentationPolicy)
                    };
                    return ;
                end;
            end;
            v17.didMount = function(v22)
                if not v22.policyContext.staticExternalPolicy then
                    v22.connection = v11.onPolicyChanged(function(v23)
                        v15:trace("Received policy update from MemStorageService");
                        v22.onPolicyChanged(v23);
                    end);
                    return ;
                else
                    return ;
                end;
            end;
            v17.render = function(v24)
                return v1.createElement(v13, (v2.Dictionary.join(v24.props.innerProps, (v12(v24.state.policy, v24.props.innerProps)))));
            end;
            v17.willUnmount = function(v25)
                if v25.connection then
                    v25.connection:Disconnect();
                end;
                v25.onPolicyChange = nil;
            end;
            return function(v26)
                return v1.createElement(v4.Consumer, {
                    render = function(v27)
                        return v1.createElement(v17, {
                            innerProps = v26, 
                            policy = v27
                        });
                    end
                });
            end;
        end;
    end;
end;
