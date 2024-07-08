local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local l_ControllerBar_0 = v3.App.Bar.ControllerBar;
local v6 = require(script.Parent.Common.ControllerShortcutKeycodes);
local l_Favorite_0 = v6.Favorite;
local l_TryOn_0 = v6.TryOn;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = {
    back = "CoreScripts.TopBar.Back", 
    confirm = "InGame.InspectMenu.Action.Confirm", 
    favorite = "InGame.InspectMenu.Action.Favorite", 
    unfavorite = "InGame.InspectMenu.Action.Unfavorite", 
    tryOn = "InGame.InspectMenu.Action.TryOn", 
    takeOff = "InGame.InspectMenu.Action.TakeOff"
};
local v11 = v2.PureComponent:extend("InspectAndBuyControllerBar");
v11.validateProps = v9.strictInterface({
    showTryOn = v9.boolean, 
    showFavorite = v9.boolean, 
    isFavorited = v9.boolean
});
v11.render = function(v12)
    local v13 = {
        {
            text = v4:FormatByKey(v10.confirm), 
            keyCode = Enum.KeyCode.ButtonA
        }
    };
    if v12.props.showTryOn then
        table.insert(v13, 1, {
            text = not not v12.props.tryingOn and v4:FormatByKey(v10.takeOff) or v4:FormatByKey(v10.tryOn), 
            keyCode = l_TryOn_0
        });
    end;
    if v12.props.showFavorite then
        table.insert(v13, 1, {
            text = not not v12.props.isFavorited and v4:FormatByKey(v10.unfavorite) or v4:FormatByKey(v10.favorite), 
            keyCode = l_Favorite_0
        });
    end;
    return v2.createElement(v2.Portal, {
        target = l_CoreGui_0
    }, {
        InspectAndBuyControllerBar = v2.createElement("ScreenGui", {
            DisplayOrder = 1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            ControllerBar = v2.createElement(l_ControllerBar_0, {
                leftHint = {
                    text = v4:FormatByKey(v10.back), 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = v13
            })
        })
    });
end;
return v11;
