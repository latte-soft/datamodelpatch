local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v12 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local l_GetFFlagEDPContextRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEDPContextRedesign;
local l_GetFFlagPeekViewScrimEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPeekViewScrimEnabled;
local v15 = not l_GetFFlagEDPContextRedesign_0() and 36 or 40;
local v16 = not l_GetFFlagEDPContextRedesign_0() and 36 or 24;
local v17 = if not l_GetFFlagEDPContextRedesign_0() then nil else 0.3;
local v18 = v2.PureComponent:extend("GameDetailsTopBar");
local function v23(v19)
    local v20 = v19[#v19];
    local v21 = 0;
    for v22 = 1, #v20 do
        if v20[v22].name == v4.GameDetail then
            v21 = v21 + 1;
            if not (v21 <= 1) then
                break;
            end;
        end;
    end;
    return v21;
end;
v18.init = function(v24)
    v24.onNavigationButtonActivated = function()
        if v24.isMounted then
            if v23(v24.props.history) <= 1 and v24.props.onCloseButtonActivated ~= nil then
                v24.props.onCloseButtonActivated({
                    backButtonNavigation = true
                });
                return ;
            else
                v24.props.navigateBack();
            end;
        end;
    end;
    v24.onCloseButtonActivated = function()
        if v24.isMounted and v24.props.onCloseButtonActivated ~= nil then
            v24.props.onCloseButtonActivated();
        end;
    end;
end;
v18.didMount = function(v25)
    v25.isMounted = true;
end;
v18.willUnmount = function(v26)
    v26.isMounted = false;
end;
v18.render = function(v27)
    local l_appTheme_0 = v27.props.appTheme;
    local l_statusBarHeight_0 = v27.props.statusBarHeight;
    local v30 = l_statusBarHeight_0 + v5.NAV_BAR_SIZE;
    local l_showCloseIcon_0 = v27.props.showCloseIcon;
    local l_withNewThemeProvider_0 = v27.props.withNewThemeProvider;
    return l_withStyle_0(function(v33)
        return v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v30), 
            BackgroundTransparency = (not not l_GetFFlagEDPContextRedesign_0() and (l_GetFFlagPeekViewScrimEnabled_0() or v27.props.scrimEnabled)) and 1 or (v12() and 0 or 1), 
            Active = if not l_GetFFlagEDPContextRedesign_0() then v12() else false, 
            BackgroundColor3 = not not l_withNewThemeProvider_0 and v33.Theme.BackgroundDefault.Color or l_appTheme_0.Color.Background, 
            BorderSizePixel = 0
        }, {
            LeftNavigationButton = v2.createElement("TextButton", {
                Position = UDim2.new(0, 15, 0, l_statusBarHeight_0), 
                Size = UDim2.new(0, v15, 0, v15), 
                BorderSizePixel = if not l_GetFFlagEDPContextRedesign_0() then nil else 0, 
                BackgroundColor3 = if not l_GetFFlagEDPContextRedesign_0() then nil else v33.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = not l_GetFFlagEDPContextRedesign_0() and 1 or v17, 
                Text = "", 
                [v2.Event.Activated] = v27.onNavigationButtonActivated
            }, {
                UICorner = if not l_GetFFlagEDPContextRedesign_0() then nil else v2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                LeftCloseButton = not not l_showCloseIcon_0 and v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, v16, 0, v16), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_GetImageData_0("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close", 
                    ImageColor3 = not not l_withNewThemeProvider_0 and v33.Theme.SystemPrimaryDefault.Color or l_appTheme_0.GameDetails.TopBar.Icon.Color, 
                    ImageTransparency = not not l_withNewThemeProvider_0 and v33.Theme.SystemPrimaryDefault.Transparency or 0, 
                    BackgroundTransparency = 1
                }) or nil, 
                LeftNavigationButton = not l_showCloseIcon_0 and v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, v16, 0, v16), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_GetImageData_0("LuaApp/icons/navigation/pushBack") or "LuaApp/icons/navigation/pushBack", 
                    ImageColor3 = not not l_withNewThemeProvider_0 and v33.Theme.SystemPrimaryDefault.Color or l_appTheme_0.GameDetails.TopBar.Icon.Color, 
                    ImageTransparency = not not l_withNewThemeProvider_0 and v33.Theme.SystemPrimaryDefault.Transparency or 0, 
                    BackgroundTransparency = 1
                }) or nil
            })
        });
    end);
end;
v18 = v9(v18);
local function _(v34)
    return v23(v34) <= 1;
end;
return (v3.connect(function(v36, v37)
    local v38 = v23(v36.Navigation.history) <= 1;
    if v37.luaProfileEnabled and v37.showCloseIcon ~= nil then
        v38 = v37.showCloseIcon;
    end;
    return {
        statusBarHeight = v36.TopBar.statusBarHeight, 
        showCloseIcon = v38, 
        history = v36.Navigation.history
    };
end, function(v39)
    return {
        navigateBack = function()
            return v39(v6());
        end
    };
end)(v18));
