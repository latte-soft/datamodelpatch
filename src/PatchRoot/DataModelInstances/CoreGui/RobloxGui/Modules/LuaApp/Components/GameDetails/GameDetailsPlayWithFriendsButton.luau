local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v5 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends);
local v8 = require(l_CorePackages_0.UIBlox);
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v8.Style.withStyle;
local l_Images_0 = v8.App.ImageSet.Images;
local v13 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v14 = UDim2.new(0, 44, 0, 44);
local v15 = UDim2.new(0, 37, 0, 37);
local v16 = Rect.new(8, 8, 9, 9);
local v17 = v2.PureComponent:extend("GameDetailsPlayWithFriendsButton");
v17.getMoreMenuPosition = function(v18)
    local l_screenWidth_0 = v18.props.screenWidth;
    local l_leftPadding_0 = v18.props.leftPadding;
    local l_current_0 = v18.moreButtonRef.current;
    if l_current_0 == nil then
        return UDim2.new(0, 0, 0, 0);
    else
        local v22 = l_current_0.AbsolutePosition.X + l_current_0.AbsoluteSize.X / 2;
        local l_Y_0 = l_current_0.AbsolutePosition.Y;
        local v24 = (l_screenWidth_0 - 300) / 2;
        local _ = nil;
        return UDim2.new(0, l_screenWidth_0 < 600 and 0 or if v22 < l_leftPadding_0 + 150 then l_leftPadding_0 - v24 else (v22 - 150) - v24, 0, l_Y_0 - 15);
    end;
end;
v17.getMoreMenuWidth = function(v26)
    local l_leftPadding_1 = v26.props.leftPadding;
    local l_rightPadding_0 = v26.props.rightPadding;
    local l_screenWidth_1 = v26.props.screenWidth;
    local v30 = (v26.props.containerWidth - l_leftPadding_1) - l_rightPadding_0;
    if l_screenWidth_1 < 600 then
        return v30;
    else
        return 300;
    end;
end;
v17.init = function(v31)
    v31.moreButtonRef = v2.createRef();
    local l_openContextualMenu_0 = v31.props.openContextualMenu;
    v31.onActivated = function()
        local l_appTheme_0 = v31.props.appTheme;
        local l_universeId_0 = v31.props.universeId;
        if not v31.props.isDisabled then
            l_openContextualMenu_0(l_universeId_0, l_appTheme_0, v31:getMoreMenuPosition(), (v31:getMoreMenuWidth()));
            return ;
        else
            return ;
        end;
    end;
end;
v17.render = function(v35)
    return l_withStyle_0(function(v36)
        return v35:renderWithStyle(v36);
    end);
end;
v17.renderWithStyle = function(v37, v38)
    local l_Theme_0 = v38.Theme;
    return v2.createElement(l_ImageSetButton_0, {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v14, 
        Image = l_Images_0["component_assets/circle_17"], 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v16, 
        ImageTransparency = (v37.props.isLoading or v37.props.isDisabled) and 0.5 or l_Theme_0.BackgroundDefault.Transparency, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 1, 
        ClipsDescendants = false, 
        [v2.Event.Activated] = v37.onActivated, 
        [v2.Ref] = v37.moreButtonRef
    }, {
        Icon = v2.createElement(l_ImageSetLabel_0, {
            Size = v15, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/actions/friends/friendsplaying"], 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color
        })
    });
end;
local function _(v40)
    local v41 = true;
    if v40 ~= v5.NotStarted then
        v41 = v40 == v5.Fetching;
    end;
    return v41;
end;
local function _(v43, v44, v45)
    local v46;
    if v43 == v5.Failed then
        v46 = not v45;
        if v46 then
            goto label0;
        end;
    end;
    v46 = true;
    if v44 ~= v4.GameDetailMore then
        v46 = v44 == v4.GameDetailsPlayWithFriends;
    end;
    ::label0::;
    return v46;
end;
return v3.connect(function(v48, v49)
    local v50 = l_ApiFetchGameDetails_0.GetFetchingStatus(v48, v49.universeId);
    local l_OverlayType_0 = v48.CentralOverlay.OverlayType;
    local v52 = v48.Games[v49.universeId];
    local v53 = {
        screenWidth = v48.ScreenSize.X
    };
    local v54 = true;
    if v50 ~= v5.NotStarted then
        v54 = v50 == v5.Fetching;
    end;
    v53.isLoading = v54;
    if v50 == v5.Failed then
        v54 = not v52;
        if v54 then
            goto label1;
        end;
    end;
    v54 = true;
    if l_OverlayType_0 ~= v4.GameDetailMore then
        v54 = l_OverlayType_0 == v4.GameDetailsPlayWithFriends;
    end;
    ::label1::;
    v53.isDisabled = v54;
    return v53;
end, function(v55)
    return {
        openContextualMenu = function(v56, v57, v58, v59)
            v55(v7(v56, v57, v58, v59));
        end
    };
end)((v13(v17)));
