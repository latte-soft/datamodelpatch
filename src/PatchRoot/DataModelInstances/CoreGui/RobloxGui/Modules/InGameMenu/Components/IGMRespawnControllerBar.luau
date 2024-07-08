local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(script.Parent.IGMControllerBar2);
local v5 = require(l_Parent_0.Resources.Constants);
local v6 = require(l_Parent_0.Localization.withLocalization);
local v7 = l_Roact_0.PureComponent:extend("IGMRespawnControllerBar");
v7.validateProps = l_t_0.strictInterface({
    inputType = l_t_0.string
});
v7.render = function(v8)
    if v8.props.inputType == v5.InputType.Gamepad then
        return v6({
            cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel", 
            respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn"
        })(function(v9)
            return l_Roact_0.createElement(v4, {
                leftHint = {
                    text = v9.cancel, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = {
                    {
                        text = v9.respawn, 
                        keyCode = Enum.KeyCode.ButtonA
                    }
                }
            });
        end);
    else
        return nil;
    end;
end;
return v7;
