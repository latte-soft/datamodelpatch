local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_getFStringSocialAddFriendsPageLayer_0 = v1.getFStringSocialAddFriendsPageLayer;
local v5 = require(l_script_FirstAncestor_0.Utils.getAddFriendsPagePYMKVariant);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAddPYMKToConsoleAddFriends);
local v7 = game:DefineFastString("FriendRequestSortingIXPVariant", "treatment");
local v8 = l_Roact_0.PureComponent:extend("AddFriendsLayerExposure");
v8.init = function(v9)
    v9.state = {
        layerExposedOnMount = false
    };
end;
v8.didMount = function(v10)
    v10:setState({
        layerExposedOnMount = true
    });
end;
v8.render = function(v11)
    if not v11.state.layerExposedOnMount then
        return nil;
    else
        return (v11.props.renderChild({
            shouldShowPYMKSection = v11.props.shouldShowPYMKSection, 
            initialRequestsRows = v11.props.initialRequestsRows, 
            addFriendsPageSearchbarEnabled = v11.props.addFriendsPageSearchbarEnabled, 
            friendRequestScoringVariant = v11.props.friendRequestScoringVariant, 
            pymkEnabledForConsole = if not v6 then nil else v11.props.pymkEnabledForConsole
        }));
    end;
end;
return l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialAddFriendsPageLayer_0()
}, function(v12, _)
    local v14 = v12[l_getFStringSocialAddFriendsPageLayer_0()] or {};
    local v15, v16 = v5(v14);
    local v17 = v14[v7];
    if v17 == "largerWindow" then
        v16 = 5;
    end;
    return {
        shouldShowPYMKSection = v15, 
        initialRequestsRows = v16, 
        addFriendsPageSearchbarEnabled = v14.show_add_friends_page_search_bar, 
        friendRequestScoringVariant = v17, 
        pymkEnabledForConsole = if not v6 then nil else v14.enable_pymk_for_console
    };
end)(v8);
