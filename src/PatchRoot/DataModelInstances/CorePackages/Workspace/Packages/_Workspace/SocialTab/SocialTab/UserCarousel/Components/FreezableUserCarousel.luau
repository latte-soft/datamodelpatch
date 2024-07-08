local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Roact_0 = v0.Roact;
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
local v4 = require(script.Parent.UserCarousel);
local v5 = l_Roact_0.PureComponent:extend("FreezableUserCarousel");
v5.defaultProps = {
    isFrozen = false, 
    analytics = {}
};
v5.validateProps = l_t_0.interface({
    isFrozen = l_t_0.optional(l_t_0.boolean)
});
v5.init = function(v6)
    v6.isMounted = false;
    v6.state = {
        peopleListFrozen = v6.props.isFrozen or false
    };
    v6.setPeopleListFrozen = function(v7)
        if v6.isMounted then
            v6:setState({
                peopleListFrozen = v7
            });
        end;
    end;
end;
v5.render = function(v8)
    return l_Roact_0.createElement(v4, l_llama_0.Dictionary.join(v8.props, {
        peopleListFrozen = v8.state.peopleListFrozen, 
        setPeopleListFrozen = v8.setPeopleListFrozen
    }));
end;
v5.didMount = function(v9)
    v9.isMounted = true;
end;
v5.willUnmount = function(v10)
    v10.isMounted = false;
end;
return v5;
