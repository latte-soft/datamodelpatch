local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Dash_0 = v1.Dash;
local l_withLocalization_0 = v1.withLocalization;
local v5 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v6 = require(script.Parent.AddFriendsContainer);
local v7 = require(script.Parent.AddFriendsLayerExposure);
local v8 = l_Roact_0.PureComponent:extend("AddFriendsScreen");
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAddIgnoreAllFriendRequestsModal);
v8.render = function(v10)
    return l_withLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friendAddedText = "Feature.AddFriends.Action.FriendAdded", 
        requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored", 
        allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored", 
        allRequestsIgnoredBackgroundedText = if not v9 then nil else "Feature.AddFriends.Label.DeclineAllBackgrounded", 
        requestSentText = "Feature.Friends.Action.FriendRequestSent"
    })(function(v11)
        return v5.with(function(v12)
            return l_Roact_0.createElement(v7, {
                renderChild = function(v13)
                    return l_Roact_0.createElement(v6, l_Dash_0.join(v13 or {}, {
                        navigation = v10.props.navigation, 
                        navigateToLuaAppPages = v12.navigateToLuaAppPages, 
                        localized = v11, 
                        wideMode = v12.wideMode, 
                        contactImporterAndPYMKEnabled = v12.contactImporterAndPYMKEnabled, 
                        contactImporterExperimentVariant = v12.contactImporterExperimentVariant, 
                        diagService = v12.diagService, 
                        eventIngestService = v12.eventIngestService, 
                        openProfilePeekView = v12.openProfilePeekView
                    }));
                end
            });
        end);
    end);
end;
return v8;
