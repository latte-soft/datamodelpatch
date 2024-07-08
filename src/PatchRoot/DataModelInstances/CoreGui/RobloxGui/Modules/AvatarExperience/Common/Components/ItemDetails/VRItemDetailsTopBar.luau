local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v1.App.ImageSet.Images;
local l_IconButton_0 = v1.App.Button.IconButton;
local v4 = require(l_CorePackages_0.Packages.React);
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local v6 = l_Images_0["icons/navigation/pushBack"];
local function v8(v7)
    return v4.createElement(l_IconButton_0, {
        anchorPoint = Vector2.new(0, 0), 
        icon = v6, 
        onActivated = function()
            v7.closeFocusedScreen(v7.navigation);
        end
    });
end;
return function(v9)
    return v4.createElement(l_HeaderBar_0, {
        backgroundTransparency = 1, 
        barHeight = v9.topBarHeight, 
        renderLeft = function()
            return v4.createElement(v8, {
                navigation = v9.navigation, 
                closeFocusedScreen = v9.closeFocusedScreen
            });
        end, 
        title = v9.title
    });
end;
