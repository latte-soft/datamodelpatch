local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_llama_0 = v1.llama;
local v5 = require(script.Parent.userTileMapStateToProps);
local v6 = require(script.Parent.userTileMapDispatchToProps);
local v7 = require(script.Parent.CarouselUserTile);
local v8 = require(l_Parent_0.Analytics);
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local _ = require(l_Parent_0.Common.LocalTypes);
local v11 = l_Roact_0.PureComponent:extend("UserTileContainer");
v11.render = function(v12)
    return l_Roact_0.createElement(v7, l_llama_0.Dictionary.join(v12.props, {
        fireEvent = l_llama_0.None, 
        userSeen = l_llama_0.None
    }));
end;
v11.didMount = function(v13)
    local l_props_0 = v13.props;
    l_props_0.userSeen(l_props_0.user, {
        absolutePosition = l_props_0.absoluteIndex
    });
end;
return l_compose_0(l_RoactRodux_0.connect(v5, v6), v8.connect(function(v15)
    return {
        fireEvent = v15.fireEvent
    };
end))(v11);
