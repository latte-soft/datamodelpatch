local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v6 = require(l_Modules_0.LuaApp.Util.HandleWebViewAction);
local _ = require(l_Modules_0.LuaApp.Navigation.NavigationTypes);
local _ = require(l_Modules_0.LuaApp.WebViewProperties);
local v9 = v3.Component:extend("WebViewEventHandler");
v9.validateProps = v2.strictInterface({
    webView = v2.table, 
    localization = v2.table, 
    currentPage = v2.table, 
    navigateBack = v2.callback
});
v9.didMount = function(v10)
    v10.props.webView:listenForWindowClose(function()
        v10.props.navigateBack();
    end);
end;
v9.render = function(v11)
    return v3.oneChild(v11.props[v3.Children]);
end;
v9.didUpdate = function(v12, v13)
    v6(v13.currentPage, v12.props.currentPage, v12.props.localization, v12.props.webView);
end;
v9.willUnmount = function(v14)
    v14.props.webView:stopListening();
end;
return (v4.connect(function(v15, _)
    local l_history_0 = v15.Navigation.history;
    local v18 = l_history_0[#l_history_0];
    return {
        currentPage = v18[#v18]
    };
end, function(v19)
    return {
        navigateBack = function()
            return v19(v5());
        end
    };
end)(v9));
