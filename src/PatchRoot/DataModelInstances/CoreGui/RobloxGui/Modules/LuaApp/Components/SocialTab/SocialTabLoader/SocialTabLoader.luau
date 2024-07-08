local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0.RobloxGui.Modules;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Cryo);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v7 = require(script:FindFirstAncestor("SocialTab").SocialTab);
local l_SocialTabEntryPoint_0 = v7.Components.SocialTabEntryPoint;
local l_Context_0 = v7.Context;
local v10 = v4.PureComponent:extend("SocialTabLoader");
v10.defaultProps = {
    receivedCanShowUserAlias = nil, 
    showUserAlias = nil, 
    renderSocialTab = function(v11)
        return v4.createElement(l_SocialTabEntryPoint_0, {
            isVisible = v11.isVisible, 
            parameters = v11.parameters, 
            logger = l_Logger_0, 
            setTabBarVisible = v11.setTabBarVisible, 
            signal = v11.signal, 
            rnBypassActionSignalSocialTab = v11.rnBypassActionSignalSocialTab, 
            androidBackButtonConnection = v11.androidBackButtonConnection, 
            closeDrawer = v11.closeDrawer, 
            initialRouteName = v11.initialRouteName
        });
    end
};
v10.init = function(v12)
    v12.renderSocialTab = l_memoize_0(function(v13)
        return v4.createFragment({
            content = v4.createElement(v12.props.renderSocialTab, v5.Dictionary.join(v13 or {}, {
                closeDrawer = v12.props.closeDrawer
            }))
        });
    end);
end;
v10.render = function(v14)
    return v4.createElement(l_Context_0.Consumer, {
        render = v14.renderSocialTab
    });
end;
v10.didMount = function(v15)
    v15.props.receivedCanShowUserAlias(v15.props.showUserAlias);
end;
v10.didUpdate = function(v16, v17)
    if v17.showUserAlias ~= v16.props.showUserAlias then
        v16.props.receivedCanShowUserAlias(v16.props.showUserAlias);
    end;
end;
return v10;
