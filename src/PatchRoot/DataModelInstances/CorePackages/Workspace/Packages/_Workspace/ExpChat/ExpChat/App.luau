local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(script.Parent.Localization);
local v4 = require(script.Parent.AppContainer);
local v5 = require(script.Parent.createStore);
local v6 = v1.Component:extend("App");
v6.defaultProps = {
    isChatWindowVisible = true, 
    isChatInputBarVisible = true, 
    isDefaultChatEnabled = true, 
    store = v5(), 
    translator = {
        FormatByKey = function(_, v8)
            return (tostring(v8));
        end
    }
};
v6.render = function(v9)
    return v9.props.isDefaultChatEnabled and v1.createElement(v2.StoreProvider, {
        store = v9.props.store
    }, {
        localization = v1.createElement(v3.Provider, {
            value = v9.props.translator
        }, {
            container = v1.createElement(v4, {
                isChatInputBarVisible = v9.props.isChatInputBarVisible, 
                isChatWindowVisible = v9.props.isChatWindowVisible, 
                getIconVoiceIndicator = v9.props.getIconVoiceIndicator, 
                onClickedVoiceIndicator = v9.props.onClickedVoiceIndicator, 
                onClickedCameraIndicator = v9.props.onClickedCameraIndicator, 
                selfViewListenerChanged = v9.props.selfViewListenerChanged, 
                getPermissions = v9.props.getPermissions, 
                displayCameraDeniedToast = v9.props.displayCameraDeniedToast, 
                isCamEnabledForUserAndPlace = v9.props.isCamEnabledForUserAndPlace, 
                isCameraOnlyUser = v9.props.isCameraOnlyUser, 
                isVoiceServiceInitialized = v9.props.isVoiceServiceInitialized
            })
        })
    });
end;
return v6;
