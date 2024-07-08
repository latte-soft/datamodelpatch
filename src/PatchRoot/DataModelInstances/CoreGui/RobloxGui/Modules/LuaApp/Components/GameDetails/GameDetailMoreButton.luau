local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v5 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore);
local v8 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ShimmerPanel_0 = v8.App.Loading.ShimmerPanel;
local v14 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v15 = UDim2.new(0, 44, 0, 44);
local v16 = UDim2.new(0, 37, 0, 37);
local v17 = l_Images_0["component_assets/circle_17"];
local v18 = Rect.new(8, 8, 9, 9);
local v19 = l_Images_0["icons/menu/more_on"];
local v20 = l_Images_0["icons/menu/more_off"];
local v21 = v2.PureComponent:extend("GameDetailMoreButton");
v21.getMoreMenuPosition = function(v22)
    local l_screenWidth_0 = v22.props.screenWidth;
    local l_leftPadding_0 = v22.props.leftPadding;
    local l_current_0 = v22.moreButtonRef.current;
    if l_current_0 == nil then
        return UDim2.new(0, 0, 0, 0);
    else
        local v26 = l_current_0.AbsolutePosition.x + l_current_0.AbsoluteSize.x / 2;
        local l_Y_0 = l_current_0.AbsolutePosition.Y;
        local v28 = (l_screenWidth_0 - 300) / 2;
        local _ = nil;
        return UDim2.new(0, l_screenWidth_0 < 600 and 0 or if v26 < l_leftPadding_0 + 150 then l_leftPadding_0 - v28 else (v26 - 150) - v28, 0, l_Y_0 - 15);
    end;
end;
v21.getMoreMenuWidth = function(v30)
    local l_leftPadding_1 = v30.props.leftPadding;
    local l_rightPadding_0 = v30.props.rightPadding;
    local l_screenWidth_1 = v30.props.screenWidth;
    local v34 = (v30.props.containerWidth - l_leftPadding_1) - l_rightPadding_0;
    if l_screenWidth_1 < 600 then
        return v34;
    else
        return 300;
    end;
end;
v21.init = function(v35)
    v35.moreButtonRef = v2.createRef();
    v35.deselectMoreButton = function()
        v35:setState({
            isMoreButtonSelected = false
        });
    end;
    v35.deselectMoreButton();
    local l_openContextualMenu_0 = v35.props.openContextualMenu;
    v35.onActivated = function()
        local l_appTheme_0 = v35.props.appTheme;
        local l_universeId_0 = v35.props.universeId;
        if not v35.props.isDisabled then
            v35:setState({
                isMoreButtonSelected = true
            });
            l_openContextualMenu_0(l_universeId_0, l_appTheme_0, v35:getMoreMenuPosition(), v35:getMoreMenuWidth(), v35.deselectMoreButton);
            return ;
        else
            return ;
        end;
    end;
end;
v21.render = function(v39)
    return l_withStyle_0(function(v40)
        return v39:renderWithStyle(v40);
    end);
end;
v21.renderWithStyle = function(v41, v42)
    local l_isLoading_0 = v41.props.isLoading;
    local l_isDisabled_0 = v41.props.isDisabled;
    local l_Theme_0 = v42.Theme;
    local v46 = (l_isLoading_0 or l_isDisabled_0) and 0.5 or l_Theme_0.BackgroundDefault.Transparency;
    local _ = nil;
    return v2.createElement(l_ImageSetButton_0, {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v15, 
        Image = v17, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v18, 
        ImageTransparency = v46, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 1, 
        ClipsDescendants = false, 
        [v2.Event.Activated] = v41.onActivated, 
        [v2.Ref] = v41.moreButtonRef
    }, {
        if not l_isLoading_0 then v2.createElement(l_ImageSetLabel_0, {
            Size = v16, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = if not v41.state.isMoreButtonSelected then v20 else v19, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color
        }) else v2.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            shimmerSpeed = 1.5
        })
    });
end;
v21 = v14(v21);
local _ = function(v48, _)
    local v50 = true;
    if v48 ~= v5.NotStarted then
        v50 = v48 == v5.Fetching;
    end;
    return v50;
end;
local function _(v52, v53, v54)
    local v55;
    if v52 == v5.Failed then
        v55 = not v54;
        if v55 then
            goto label0;
        end;
    end;
    v55 = true;
    if v53 ~= v4.GameDetailMore then
        v55 = v53 == v4.GameDetailsPlayWithFriends;
    end;
    ::label0::;
    return v55;
end;
return v3.connect(function(v57, v58)
    local v59 = l_ApiFetchGameDetails_0.GetFetchingStatus(v57, v58.universeId);
    local v60 = v57.Games[v58.universeId];
    local l_OverlayType_0 = v57.CentralOverlay.OverlayType;
    local v62 = {
        screenWidth = v57.ScreenSize.X
    };
    local _ = v57.GameDetails[v58.universeId];
    local v64 = true;
    if v59 ~= v5.NotStarted then
        v64 = v59 == v5.Fetching;
    end;
    v62.isLoading = v64;
    if v59 == v5.Failed then
        v64 = not v60;
        if v64 then
            goto label1;
        end;
    end;
    v64 = true;
    if l_OverlayType_0 ~= v4.GameDetailMore then
        v64 = l_OverlayType_0 == v4.GameDetailsPlayWithFriends;
    end;
    ::label1::;
    v62.isDisabled = v64;
    return v62;
end, function(v65)
    return {
        openContextualMenu = function(v66, v67, v68, v69, v70)
            v65(v7(v66, v67, v68, v69, v70));
        end
    };
end)(v21);
