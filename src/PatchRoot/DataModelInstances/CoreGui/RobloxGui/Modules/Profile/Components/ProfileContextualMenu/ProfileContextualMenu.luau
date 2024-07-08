local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Dash_0 = v1.Dash;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_ContextualMenu_0 = l_UIBlox_0.App.Menu.ContextualMenu;
local l_MenuDirection_0 = l_UIBlox_0.App.Menu.MenuDirection;
local l_withLocalization_0 = v1.withLocalization;
local v8 = require(l_Parent_0.Common.TextKeys);
local v9 = require(script.Parent.contextualMenuRows);
local v10 = require(l_Parent_0.Common.ContextualMenuRowsEnums);
local l_memoize_0 = v1.memoize;
local l_t_0 = v1.t;
local l_Otter_0 = v1.Otter;
local v14 = require(l_Parent_0.Common.ProfileTypes);
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_AppUserLayers_0 = v1.AppUserLayers;
local l_UplevelAliasIXP_0 = v1.UserProfiles.Flags.UplevelAliasIXP;
local v18 = l_Roact_0.PureComponent:extend("ProfileContextualMenu");
local v19 = {
    motorCallback = l_Otter_0.instant, 
    open = {
        targetValue = 1
    }, 
    close = {
        targetValue = 0
    }
};
v18.validateProps = l_t_0.strictInterface({
    friendStatus = l_t_0.enum(Enum.FriendStatus), 
    isInExperience = l_t_0.boolean, 
    screenSize = l_t_0.Vector2, 
    onDismiss = l_t_0.callback, 
    onClickWithToast = l_t_0.callback, 
    isBlocked = l_t_0.optional(l_t_0.boolean), 
    rowActions = v9.validateRowActions, 
    disableWebViewSupport = l_t_0.optional(l_t_0.boolean), 
    useLuafiedReportFlow = l_t_0.optional(l_t_0.boolean), 
    profileType = v14.validateProfileType, 
    navigation = l_t_0.optional(l_t_0.table), 
    uplevelAliasEnabled = l_t_0.optional(l_t_0.boolean)
});
v18.init = function(v20)
    v20.newLocalized = {};
    v20.getButtons = l_memoize_0(function(v21, v22, v23, v24, v25, v26)
        local v27 = {
            friendStatus = v21, 
            isInExperience = v22, 
            isBlocked = v23, 
            disableWebViewSupport = v26, 
            profileType = v25
        };
        return l_Dash_0.map(l_Dash_0.filter(v9.contextualMenuSettings, function(v28)
            return v28.validator(v27);
        end), function(v29)
            local v30 = v20.newLocalized[v29.name];
            return l_Dash_0.join(v29.props, {
                text = v30.text, 
                onActivated = v20.props.onClickWithToast({
                    actionCallback = v20.props.rowActions[v29.name](v29.showToast), 
                    showToast = v29.showToast, 
                    errorTitle = v24, 
                    successTitle = v30.successMessage, 
                    successIcon = v29.props.icon, 
                    replaceScreen = v29.showToast
                })
            });
        end);
    end);
end;
v18.render = function(v31)
    return l_withLocalization_0({
        chatText = v8.Chat, 
        unfriendText = v8.Unfriend, 
        unfriendSuccess = v8.FriendRemoved, 
        errorText = v8.SomethingIsWrong, 
        reportText = v8.Report, 
        ignoreFriendRequestText = v8.IgnoreFriendRequest, 
        blockUserText = v8.Block, 
        ignoreFriendRequestSuccess = v8.RequestIgnored, 
        blockUserSuccess = v8.UserBlocked, 
        setAliasText = if not v31.props.uplevelAliasEnabled then v8.SetAlias else v8.CustomizeName
    })(function(v32)
        local l_props_0 = v31.props;
        v31.newLocalized = {
            [v10.CHAT] = {
                text = v32.chatText, 
                successMessage = ""
            }, 
            [v10.UNFRIEND] = {
                text = v32.unfriendText, 
                successMessage = v32.unfriendSuccess
            }, 
            [v10.REPORT] = {
                text = v32.reportText, 
                successMessage = ""
            }, 
            [v10.IGNORE_FRIEND_REQUEST] = {
                text = v32.ignoreFriendRequestText, 
                successMessage = v32.ignoreFriendRequestSuccess
            }, 
            [v10.BLOCK] = {
                text = v32.blockUserText, 
                successMessage = v32.blockUserSuccess
            }, 
            [v10.SET_ALIAS] = {
                text = v32.setAliasText, 
                successMessage = ""
            }
        };
        return l_Roact_0.createElement(l_ContextualMenu_0, {
            buttonProps = v31.getButtons(l_props_0.friendStatus, l_props_0.isInExperience, l_props_0.isBlocked, v32.errorText, l_props_0.profileType, l_props_0.disableWebViewSupport), 
            open = true, 
            onDismiss = l_props_0.onDismiss, 
            menuDirection = l_MenuDirection_0.Up, 
            openPositionX = UDim.new(0, -135), 
            openPositionY = UDim.new(1, -88), 
            screenSize = l_props_0.screenSize, 
            closeBackgroundVisible = false, 
            motorOverrideOptions = v19
        });
    end);
end;
if l_UplevelAliasIXP_0.isSetupEnabled() then
    v18 = l_RoactAppExperiment_0.connectUserLayer({
        l_AppUserLayers_0.SocialFriendsLayer
    }, function(v34, _)
        return {
            uplevelAliasEnabled = l_UplevelAliasIXP_0.isExperimentEnabled(v34)
        };
    end)(v18);
end;
return v18;
