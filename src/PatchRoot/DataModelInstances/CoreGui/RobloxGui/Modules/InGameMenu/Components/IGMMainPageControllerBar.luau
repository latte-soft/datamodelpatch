local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(script.Parent.IGMControllerBar2);
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = l_Roact_0.PureComponent:extend("IGMMainPageControllerBar");
v8.validateProps = l_t_0.strictInterface({
    canCaptureFocus = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.boolean
});
v8.render = function(v9)
    if not v9.props.canCaptureFocus then
        return nil;
    else
        return v7({
            openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu", 
            closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu", 
            back = "CoreScripts.InGameMenu.ControllerBar.Back", 
            respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter", 
            leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
        })(function(v10)
            local _ = nil;
            return l_Roact_0.createElement(v6, {
                leftHint = {
                    text = v10.back, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = if l_VRService_0.VREnabled then {
                    {
                        text = v10.respawnCharacter, 
                        keyCode = Enum.KeyCode.ButtonY
                    }, 
                    {
                        text = v10.leave, 
                        keyCode = Enum.KeyCode.ButtonX
                    }
                } else {
                    {
                        text = not not v9.props.isMainPageMoreMenuOpen and v10.closeMoreMenu or v10.openMoreMenu, 
                        keyCode = Enum.KeyCode.ButtonL3
                    }, 
                    {
                        text = v10.respawnCharacter, 
                        keyCode = Enum.KeyCode.ButtonY
                    }, 
                    {
                        text = v10.leave, 
                        keyCode = Enum.KeyCode.ButtonX
                    }
                }
            });
        end);
    end;
end;
return v8;
