local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local l_GamesProductInfoReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameProductInfoRodux).GamesProductInfoReducer;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton);
local l_useOnPlayButtonCallback_0 = v7.useOnPlayButtonCallback;
local l_usePlayButtonState_0 = v7.usePlayButtonState;
local v10 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v12 = require(l_Modules_0.LuaApp.Components.Games.PlayButton);
local v13 = v4.PureComponent:extend("PlayButtonContainer");
v13.defaultProps = {
    smallPlayButton = false
};
v13.init = function(v14)
    v14.isMounted = false;
    v14.onActivated = function()
        if v14.isMounted then
            v14.props.onPlayButtonCallback(v14.props.playButtonState);
            return ;
        else
            return ;
        end;
    end;
end;
v13.didMount = function(v15)
    v15.isMounted = true;
end;
v13.willUnmount = function(v16)
    v16.isMounted = false;
end;
v13.render = function(v17)
    local l_Size_0 = v17.props.Size;
    local l_Position_0 = v17.props.Position;
    local l_LayoutOrder_0 = v17.props.LayoutOrder;
    local l_Font_0 = v17.props.Font;
    local l_playButtonState_0 = v17.props.playButtonState;
    local l_gameProductInfo_0 = v17.props.gameProductInfo;
    return v4.createElement(v12, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Font = l_Font_0, 
        playButtonState = l_playButtonState_0, 
        price = not not l_gameProductInfo_0 and l_gameProductInfo_0.price or 0, 
        onActivated = v17.onActivated, 
        smallPlayButton = v17.props.smallPlayButton
    });
end;
local l_v13_0 = v13;
return (v5.connect(function(v25, v26)
    return {
        gameProductInfo = v25[l_GamesProductInfoReducer_0.key][v26.universeId]
    };
end)((v10(function(v27)
    local v28 = l_usePlayButtonState_0(l_useRoactService_0(v6), v27.universeId);
    return v4.createElement(l_v13_0, (v2.Dictionary.join(v27, {
        onPlayButtonCallback = l_useOnPlayButtonCallback_0(v27.universeId, v27.referralSource, "PlayButton", v27.appTheme, "LuaGameCard"), 
        playButtonState = v28.playButtonState, 
        playabilityStatus = v28.playabilityStatus
    })));
end))));
