local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Navigation.AndroidBackButtonConnection);
local v4 = v2.PureComponent:extend("AndroidBackButtonNavigationHandler");
v4.defaultProps = {
    androidBackButtonConnection = function()
        return v3();
    end
};
v4.init = function(v5)
    v5.androidBackButtonConnection = v5.props.androidBackButtonConnection();
    v5.onBackButtonPressed = function()
        if not v5.props.disabled then
            if not v5.props.canGoBackInRN or not v5.props.navigateBackInRN then
                if not v5.props.canGoBackInAppRoute then
                    v5.androidBackButtonConnection.showExitDialog();
                    return ;
                else
                    v5.props.navigateBackInAppRoute();
                    return ;
                end;
            else
                v5.props.navigateBackInRN();
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v4.didMount = function(v6)
    v6.androidBackButtonConnection.connect(v6.onBackButtonPressed);
end;
v4.didUpdate = function(v7, v8)
    if v8.isVisible or not v7.props.isVisible then
        if not (not v8.isVisible or v7.props.isVisible) then
            v7.androidBackButtonConnection.disconnect();
        end;
        return ;
    else
        v7.androidBackButtonConnection.connect(v7.onBackButtonPressed);
        return ;
    end;
end;
v4.willUnmount = function(v9)
    v9.androidBackButtonConnection.disconnect();
end;
v4.render = function(_)
    return nil;
end;
return v4;
