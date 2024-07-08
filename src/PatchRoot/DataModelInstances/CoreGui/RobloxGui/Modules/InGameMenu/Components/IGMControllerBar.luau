local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.InGameMenuDependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_ControllerBar_0 = require(l_CorePackages_0.UIBlox).App.Bar.ControllerBar;
local v6 = require(script.Parent.Parent.Actions.SetControllerBarHeight);
local v7 = require(script.Parent.Parent.Localization.withLocalization);
local v8 = require(script.Parent.Parent.Resources.Constants);
local v9 = l_Roact_0.PureComponent:extend("IGMControllerBar");
local v10 = {
    cancel = "CoreScripts.InGameMenu.ControllerBar.Cancel", 
    respawn = "CoreScripts.InGameMenu.ControllerBar.Respawn", 
    openMoreMenu = "CoreScripts.InGameMenu.ControllerBar.OpenMoreMenu", 
    closeMoreMenu = "CoreScripts.InGameMenu.ControllerBar.CloseMoreMenu", 
    back = "CoreScripts.InGameMenu.ControllerBar.Back", 
    respawnCharacter = "CoreScripts.InGameMenu.ControllerBar.RespawnCharacter", 
    leave = "CoreScripts.InGameMenu.ControllerBar.Leave"
};
v9.validateProps = l_t_0.strictInterface({
    isMenuOpen = l_t_0.boolean, 
    isMainPageMoreMenuOpen = l_t_0.boolean, 
    currentPage = l_t_0.string, 
    respawnDialogOpen = l_t_0.boolean, 
    inputType = l_t_0.string, 
    screenSize = l_t_0.Vector2, 
    setControllerBarHeight = l_t_0.callback
});
v9.didMount = function(v11)
    if not v11:getHints(v10) then
        v11.props.setControllerBarHeight(0);
        return ;
    else
        v11.props.setControllerBarHeight(v8.ControllerBarHeight);
        return ;
    end;
end;
v9.didUpdate = function(v12)
    if not v12:getHints(v10) then
        v12.props.setControllerBarHeight(0);
        return ;
    else
        v12.props.setControllerBarHeight(v8.ControllerBarHeight);
        return ;
    end;
end;
v9.willUnmount = function(v13)
    v13.props.setControllerBarHeight(0);
end;
v9.getHints = function(v14, v15)
    if v14.props.inputType == v8.InputType.Gamepad then
        if not v14.props.respawnDialogOpen then
            if v14.props.isMenuOpen and v14.props.currentPage == "MainPage" then
                local _ = nil;
                return {
                    leftHint = {
                        text = v15.back, 
                        keyCode = Enum.KeyCode.ButtonB
                    }, 
                    rightHints = {
                        {
                            text = if v14.props.isMainPageMoreMenuOpen then v15.closeMoreMenu else v15.openMoreMenu, 
                            keyCode = Enum.KeyCode.ButtonL3
                        }, 
                        {
                            text = v15.respawnCharacter, 
                            keyCode = Enum.KeyCode.ButtonY
                        }, 
                        {
                            text = v15.leave, 
                            keyCode = Enum.KeyCode.ButtonX
                        }
                    }
                };
            end;
        else
            return {
                leftHint = {
                    text = v15.cancel, 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = {
                    {
                        text = v15.respawn, 
                        keyCode = Enum.KeyCode.ButtonA
                    }
                }
            };
        end;
    end;
    return nil;
end;
v9.render = function(v17)
    return v7(v10)(function(v18)
        local v19 = v17:getHints(v18);
        if not v19 then
            return nil;
        else
            return l_Roact_0.createElement(l_ControllerBar_0, v19);
        end;
    end);
end;
return l_RoactRodux_0.connect(function(v20, _)
    return {
        isMenuOpen = v20.isMenuOpen, 
        isMainPageMoreMenuOpen = v20.isMainPageMoreMenuOpen, 
        currentPage = v20.menuPage, 
        respawnDialogOpen = v20.respawn.dialogOpen, 
        inputType = v20.displayOptions.inputType, 
        screenSize = v20.screenSize
    };
end, function(v22)
    return {
        setControllerBarHeight = function(v23)
            v22(v6(v23));
        end
    };
end)(v9);
