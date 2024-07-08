local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.UIBlox);
local l_ContextualMenu_0 = v5.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v5.App.Menu.MenuDirection;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v15 = require(l_Modules_0.LuaApp.Constants);
local l_Focusable_0 = v3.Focusable;
return (v11(function(v17)
    local v18 = l_useNavigation_0();
    local v19, v20 = v2.createBinding(UDim2.fromScale(1, 1));
    local function v22(v21)
        if v21.AbsoluteSize.X > 640 then
            v20((UDim2.new(0, 300, 1, 0)));
            return ;
        else
            v20(UDim2.fromScale(1, 1));
            return ;
        end;
    end;
    local function v23()
        v10.closeOverlay(v18);
        if v17.onOverlayClosed ~= nil then
            v17.onOverlayClosed();
        end;
    end;
    local v25 = l_useSelector_0(function(v24)
        return v24.ScreenSize;
    end);
    local v27 = l_useSelector_0(function(v26)
        return v26.GamepadBottomBar.boundInputs;
    end);
    local v28 = l_useSelector_0(v13);
    local v29 = if not v28 then v12.LandscapeNavWidth else 0;
    local v30 = if not v28 then v12.LandscapeSceneWidth else 1;
    local v31 = -76;
    if v14.getNumElementsWithKeyField(v27) > 0 then
        v31 = -76 - v15.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v32 = nil;
    local v33 = nil;
    if not v17.centered or v28 then
        v32 = UDim2.fromScale(v29, 0);
        v33 = UDim2.fromScale(v30, 1);
    else
        local v34 = math.min(v25.X, 640);
        v32 = UDim2.fromOffset((v25.X - v34) / 2, 0);
        v33 = UDim2.new(0, v34, 1, 0);
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Position = v32, 
        Size = v33, 
        [v2.Change.AbsoluteSize] = v22
    }, {
        SizeFrame = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0), 
            Size = v19
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v2.useMemo(function()
                    return v4.List.map(v17.contextButtons, function(v35)
                        if v35.onActivated then
                            return v4.Dictionary.join(v35, {
                                onActivated = function()
                                    v35.onActivated(v18);
                                end
                            });
                        else
                            return v35;
                        end;
                    end);
                end, {
                    v17.contextButtons, 
                    v18
                }), 
                closeBackgroundVisible = true, 
                menuDirection = l_MenuDirection_0.Up, 
                onDismiss = v23, 
                open = true, 
                openPositionY = UDim.new(1, v31), 
                screenSize = v25
            })
        })
    });
end));
