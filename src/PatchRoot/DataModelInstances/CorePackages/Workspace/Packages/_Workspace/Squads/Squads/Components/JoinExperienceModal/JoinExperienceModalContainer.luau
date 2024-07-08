local v0 = require(script:FindFirstAncestor("Squads").dependencies);
local l_Roact_0 = v0.Roact;
local l_RoactNavigation_0 = v0.RoactNavigation;
local l_RoactRodux_0 = v0.RoactRodux;
local l_Dash_0 = v0.Dash;
local l_NetworkingGames_0 = v0.NetworkingGames;
local l_t_0 = v0.t;
local v7 = require(script.Parent.JoinExperienceModal);
local v8 = require(script.Parent.joinExperienceMapStateToProps);
local v9 = l_Roact_0.Component:extend("JoinExperienceModalContainer");
v9.validateProps = l_t_0.interface({
    closeModal = l_t_0.callback, 
    universeId = l_t_0.string, 
    users = l_t_0.table, 
    experienceName = l_t_0.string, 
    experienceServerSize = l_t_0.number, 
    screenSize = l_t_0.Vector2, 
    getExperiencesDetails = l_t_0.callback, 
    getExperienceMedia = l_t_0.callback, 
    navigation = l_t_0.table
});
v9.init = function(v10)
    v10.closeModal = function(v11)
        local l_props_0 = v10.props;
        l_props_0.closeModal(v11);
        l_props_0.navigation.pop();
    end;
end;
v9.didMount = function(v13)
    if #v13.props.universeId > 0 then
        v13.props.getExperiencesDetails(v13.props.universeId);
        v13.props.getExperienceMedia(v13.props.universeId);
    end;
end;
v9.render = function(v14)
    return l_Roact_0.createElement(v7, l_Dash_0.join(v14.props, {
        closeModal = v14.closeModal
    }));
end;
return l_RoactNavigation_0.withNavigation((l_RoactRodux_0.connect(v8, function(v15)
    return {
        getExperiencesDetails = function(v16)
            return v15(l_NetworkingGames_0.GetExperiencesDetails.API({
                v16
            }));
        end, 
        getExperienceMedia = function(v17)
            return v15(l_NetworkingGames_0.GetExperienceMedia.API(v17));
        end
    };
end)(v9)));
