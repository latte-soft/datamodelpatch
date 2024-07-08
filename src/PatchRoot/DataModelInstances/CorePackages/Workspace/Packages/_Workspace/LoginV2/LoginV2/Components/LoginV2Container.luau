local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactNavigation);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local l_useEffect_0 = v5.useEffect;
local v9 = require(l_script_FirstAncestor_0.Context.LoginContextProvider);
local v10 = require(l_script_FirstAncestor_0.Navigators.LoginSwitchNavigator);
local v11 = {
    SET_STATUS_BAR_STYLE = 22
};
local v12 = {
    LIGHT = "lightcontent", 
    DEFAULT = "default"
};
local function v14(v13)
    if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
        l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
            style = v13
        }), v11.SET_STATUS_BAR_STYLE);
    end;
end;
return function(_)
    local v16 = l_useNavigation_0();
    local v17 = v6.createAppContainer(v10);
    l_useEffect_0(function()
        v14(v12.LIGHT);
        return function()
            v14(v12.DEFAULT);
        end;
    end, {});
    return v5.createElement(v9, {
        parentNavigation = v16
    }, {
        NavigationAppContainer = v5.createElement(v17)
    });
end;
