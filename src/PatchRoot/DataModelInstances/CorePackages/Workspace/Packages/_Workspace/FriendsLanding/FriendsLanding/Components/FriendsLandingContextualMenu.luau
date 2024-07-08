local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withLocalization_0 = v1.withLocalization;
local l_ContextualMenu_0 = l_UIBlox_0.App.Menu.ContextualMenu;
local l_MenuDirection_0 = l_UIBlox_0.App.Menu.MenuDirection;
local v8 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v10 = require(l_script_FirstAncestor_0.Components.FriendsLandingContainer.mapStateToProps);
local l_RoactRodux_0 = v1.RoactRodux;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
local v14 = require(l_script_FirstAncestor_0.EnumScreens);
local l_memoize_0 = v1.memoize;
local l_Otter_0 = v1.Otter;
local v17 = l_Roact_0.PureComponent:extend("FriendsLandingContextualMenu");
local v18 = {
    motorCallback = l_Otter_0.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
v17.init = function(v19)
    v19.onClose = function()
        if v19.props.navigation then
            v19.props.navigation.goBack();
        end;
    end;
    v19.onUnfriend = l_memoize_0(function(v20, v21)
        v19.props.navigation.navigate(v14.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v20, 
                    iconImage = v21
                }
            }
        });
    end);
    v19.onActivated = l_memoize_0(function(v22, v23)
        return function()
            local l_userId_0 = v19.props.navigation.state.params.userId;
            if l_userId_0 ~= nil then
                v19.props.unfriendTargetUserId({
                    targetUserId = l_userId_0, 
                    currentUserId = v19.props.localUserId
                }):andThen(function()
                    v19.onUnfriend(v22, l_Images_0["icons/actions/friends/friendRemove"]);
                end):catch(function()
                    v19.onUnfriend(v23);
                end);
            end;
            v19.onClose();
        end;
    end);
end;
v17.render = function(v25)
    return l_withStyle_0(function(_)
        return l_withLocalization_0({
            unfriend = "Feature.Friends.Action.Unfriend", 
            error = "Feature.Toast.NetworkingError.SomethingIsWrong", 
            success = "Feature.Friends.Action.FriendRemoved"
        })(function(v27)
            return l_Roact_0.createElement(l_ContextualMenu_0, {
                buttonProps = {
                    {
                        icon = l_Images_0["icons/actions/friends/friendRemove"], 
                        text = v27.unfriend, 
                        onActivated = v25.onActivated(v27.success, v27.error)
                    }
                }, 
                open = true, 
                menuDirection = l_MenuDirection_0.Up, 
                openPositionY = UDim.new(1, -24), 
                screenSize = v25.props.screenSize, 
                onDismiss = v25.onClose, 
                closeBackgroundVisible = false, 
                motorOverrideOptions = v18
            });
        end);
    end);
end;
return l_compose_0(l_RoactRodux_0.connect(v10, function(v28)
    return {
        unfriendTargetUserId = function(v29)
            return v28(l_FriendsNetworking_0.UnfriendTargetUserId.API(v29));
        end
    };
end), v8.connect(function(v30, _)
    return {
        screenSize = v30.screenSize
    };
end))(v17);
