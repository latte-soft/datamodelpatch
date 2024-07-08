local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v6 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v7 = require(l_Modules_0.LuaApp.Components.GenericIconButtonUIBlox);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local v14 = UDim2.new(0, 44, 0, 44);
local v15 = UDim2.new(0, 37, 0, 37);
local v16 = v3.PureComponent:extend("GameDetailsShareButton");
v16.defaultProps = {
    externalContentSharingProtocol = l_ExternalContentSharingProtocol_0.default
};
v16.init = function(v17)
    v17.onActivated = function()
        if not v17.props.shouldShareToAccountProvider then
            v17.props.externalContentSharingProtocol:shareUrl({
                url = v11.game.info.webpage({
                    placeId = v17.props.placeId
                }), 
                context = v17.props.context
            });
            return ;
        else
            v17.props.navigateDown({
                name = v10.SdkShare, 
                extraProps = {
                    context = v17.props.context, 
                    universeId = v17.props.universeId
                }
            });
            return ;
        end;
    end;
end;
v16.render = function(v18)
    return v3.createElement(v7, {
        Size = v14, 
        iconImage = l_Images_0["icons/actions/share"], 
        iconSize = v15, 
        isLoading = v18.props.isLoading, 
        isDisabled = v18.props.isDisabled, 
        onActivated = v18.onActivated, 
        withNewThemeProvider = v18.props.withNewThemeProvider
    });
end;
local _ = function(v19, _)
    local v21 = true;
    if v19 ~= v6.NotStarted then
        v21 = v19 == v6.Fetching;
    end;
    return v21;
end;
local function _(v23, v24)
    local v25 = true;
    if v23 ~= v6.Failed then
        v25 = v24 == v5.GameDetailMore;
    end;
    return v25;
end;
return v4.connect(function(v27, v28)
    local v29 = l_ApiFetchGameDetails_0.GetFetchingStatus(v27, v28.universeId);
    local l_OverlayType_0 = v27.CentralOverlay.OverlayType;
    local v31 = v27.GameDetails[v28.universeId];
    local v32 = {
        screenWidth = v27.ScreenSize.X
    };
    local v33 = true;
    if v29 ~= v6.NotStarted then
        v33 = v29 == v6.Fetching;
    end;
    v32.isLoading = v33;
    v33 = true;
    if v29 ~= v6.Failed then
        v33 = l_OverlayType_0 == v5.GameDetailMore;
    end;
    v32.isDisabled = v33;
    v32.placeId = v31 and v31.rootPlaceId;
    return v32;
end, function(v34)
    return {
        navigateDown = function(v35)
            v34(v9(v35));
        end
    };
end)((l_RoactAppPolicy_0.connect(function(v36, _)
    return {
        shouldShareToAccountProvider = v36.shouldShareToAccountProvider()
    };
end)(v16)));
