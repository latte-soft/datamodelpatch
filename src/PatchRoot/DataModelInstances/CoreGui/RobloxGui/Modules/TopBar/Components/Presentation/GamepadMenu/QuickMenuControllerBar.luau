local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_ControllerBar_0 = v4.App.Bar.ControllerBar;
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v8 = {
    back = "CoreScripts.TopBar.Back", 
    leave = "CoreScripts.TopBar.Leave", 
    respawn = "CoreScripts.TopBar.Respawn"
};
return function()
    return v3.createElement(v3.Portal, {
        target = l_CoreGui_0
    }, {
        QuickMenuControllerBar = v3.createElement("ScreenGui", {
            DisplayOrder = v5.DisplayOrder.ControllerBar
        }, {
            ControllerBar = v3.createElement(l_ControllerBar_0, {
                leftHint = {
                    text = v7:FormatByKey(v8.back), 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = {
                    {
                        text = v7:FormatByKey(v8.respawn), 
                        keyCode = Enum.KeyCode.ButtonY
                    }, 
                    {
                        text = v7:FormatByKey(v8.leave), 
                        keyCode = Enum.KeyCode.ButtonX
                    }
                }
            })
        })
    });
end;
