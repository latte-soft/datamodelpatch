local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v8 = require(l_Modules_0.LuaApp.FitChildren);
local v9 = require(l_Modules_0.LuaApp.Components.Generic.ScrollingAppCarousel);
local l_LoadingStateContainer_0 = v4.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_IconWithTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).IconWithTooltip;
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppGameCarouselUseAutoSizing);
local l_getFFlagUpdateFriendCarousel10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagUpdateFriendCarousel10ft;
local l_GetFFlagLuaAppSortSubtitlesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortSubtitlesEnabled;
local v25 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
local v26 = v3.PureComponent:extend("CarouselWidget");
v26.getDerivedStateFromProps = function(v27, v28)
    if v27.fetchingStatus == nil then
        return ;
    else
        local v29 = l_RetrievalStatus_0.fromRawValue(v27.fetchingStatus);
        local l_wasLoaded_0 = v28.wasLoaded;
        if v29 == l_RetrievalStatus_0.Done then
            l_wasLoaded_0 = true;
        elseif not (v29 ~= l_RetrievalStatus_0.Failed) or v29 == l_RetrievalStatus_0.NotStarted then
            l_wasLoaded_0 = false;
        elseif not (not (v29 == l_RetrievalStatus_0.Fetching) or not l_wasLoaded_0) then
            v29 = l_RetrievalStatus_0.Done;
        end;
        return {
            wasLoaded = l_wasLoaded_0, 
            dataStatus = v29
        };
    end;
end;
v26.init = function(v31)
    v31.state = {
        wasLoaded = false, 
        dataStatus = l_RetrievalStatus_0.NotStarted
    };
end;
v26.didMount = function(v32)
    v32:setState({
        wasLoaded = false, 
        dataStatus = l_RetrievalStatus_0.fromRawValue(v32.props.fetchingStatus)
    });
end;
v26.render = function(v33)
    local l_layoutOrder_0 = v33.props.layoutOrder;
    local l_onSeeAll_0 = v33.props.onSeeAll;
    local l_title_0 = v33.props.title;
    local l_items_0 = v33.props.items;
    local l_fetchingStatus_0 = v33.props.fetchingStatus;
    local l_onRetry_0 = v33.props.onRetry;
    local l_carouselHeight_0 = v33.props.carouselHeight;
    local l_canvasWidth_0 = v33.props.canvasWidth;
    local l_onChangeCanvasPosition_0 = v33.props.onChangeCanvasPosition;
    local l_onRefCallback_0 = v33.props.onRefCallback;
    local l_index_0 = v33.props.index;
    local l_itemCount_0 = v33.props.itemCount;
    local l_itemWidth_0 = v33.props.itemWidth;
    local l_itemPadding_0 = v33.props.itemPadding;
    local l_carouselMargin_0 = v33.props.carouselMargin;
    local l_showSeeAll_0 = v33.props.showSeeAll;
    local l_designTokens_0 = v33.props.designTokens;
    local l_showTooltip_0 = v33.props.showTooltip;
    local l_onActivateTooltip_0 = v33.props.onActivateTooltip;
    local l_tooltipHoverText_0 = v33.props.tooltipHoverText;
    local l_deviceType_0 = v33.props.deviceType;
    local l_screenSize_0 = v33.props.screenSize;
    local function v70(v56, v57)
        local l_Theme_0 = v56.Theme;
        local l_Font_0 = v56.Font;
        local v60 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v61 = v3.createElement(v9, {
            items = l_items_0, 
            index = l_index_0, 
            itemCount = l_itemCount_0, 
            itemWidth = l_itemWidth_0, 
            itemPadding = l_itemPadding_0, 
            carouselMargin = l_carouselMargin_0, 
            carouselHeight = l_carouselHeight_0, 
            canvasWidth = l_canvasWidth_0, 
            onChangeCanvasPosition = l_onChangeCanvasPosition_0, 
            onRefCallback = l_onRefCallback_0
        });
        local v62 = v3.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Font = if not l_getFFlagUpdateFriendCarousel10ft_0() then l_Font_0.Header1.Font else l_designTokens_0.headerFont, 
            Text = l_title_0, 
            TextSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then v60 else l_designTokens_0.headerTextSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY
        });
        local v63 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Title = v62, 
            SeeAllArrow = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 16, 0, 16), 
                BackgroundTransparency = 1, 
                Image = l_GetImageData_0("LuaApp/icons/navigation/pushRight_small") or "LuaApp/icons/navigation/pushRight_small", 
                ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                ImageTransparency = l_Theme_0.TextEmphasis.Transparency, 
                LayoutOrder = 2
            }) else l_showSeeAll_0 and v3.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 16, 0, 16), 
                BackgroundTransparency = 1, 
                Image = l_GetImageData_0("LuaApp/icons/navigation/pushRight_small") or "LuaApp/icons/navigation/pushRight_small", 
                ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                ImageTransparency = l_Theme_0.TextEmphasis.Transparency, 
                LayoutOrder = 2
            }) or nil
        };
        local v64 = (l_GetFFlagLuaAppSortSubtitlesEnabled_0() and v33.props.subtitle) and v33.props.subtitle ~= "";
        local v65 = if not not l_GetFFlagLuaAppSortSubtitlesEnabled_0() and l_getFFlagUpdateFriendCarousel10ft_0() then l_designTokens_0.subtitleTextSize else v56.Font.BaseSize * v56.Font.CaptionLarge.RelativeSize;
        local v66 = nil;
        if not (not v64 or not v25) then
            if type(v33.props.subtitle) == "string" then
                v66 = v3.createElement("TextLabel", {
                    Text = v33.props.subtitle, 
                    Size = UDim2.new(1, 0, 0, v65), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = v65, 
                    TextXAlignment = Enum.TextXAlignment.Left
                });
            elseif type(v33.props.subtitle) == "table" then
                v66 = v33.props.subtitle;
            end;
        end;
        local v67 = if not v64 then v63 else {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            TitleWrapper = v3.createElement("Frame", {
                Size = UDim2.new(), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, v63), 
            Subtitle = if not v25 then v3.createElement("TextLabel", {
                Text = v33.props.subtitle, 
                Size = UDim2.new(1, 0, 0, v65), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Font = l_Font_0.Body.Font, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = v65, 
                TextXAlignment = Enum.TextXAlignment.Left
            }) else v66
        };
        local v68 = nil;
        v68 = if not l_showSeeAll_0 then if l_GetFFlagLuaAppSortSubtitlesEnabled_0() then if v22() then v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v67) else v3.createElement(v8.FitFrame, {
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v67) else v62 else if v22() then v3.createElement("ImageButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            SelectionImageObject = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else v57(l_CursorKind_0.InputButton), 
            [v3.Event.Activated] = l_onSeeAll_0
        }, v67) else v3.createElement(v8.FitTextButton, {
            Text = "", 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            SelectionImageObject = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else v57(l_CursorKind_0.InputButton), 
            [v3.Event.Activated] = l_onSeeAll_0
        }, v67);
        local v69 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            Header = if not l_showTooltip_0 then v68 else v3.createElement("Frame", {
                Size = UDim2.new(0, l_screenSize_0.X - 48, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = if l_deviceType_0 == l_DeviceType_0.Desktop then v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }) else nil, 
                HeaderText = v68, 
                CarouselTooltip = v3.createElement(l_IconWithTooltip_0, {
                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                    onActivateTooltip = l_onActivateTooltip_0, 
                    anchorPoint = Vector2.new(1, 0), 
                    position = if l_deviceType_0 == l_DeviceType_0.Desktop then nil else UDim2.new(1, 0, 0, 0), 
                    layoutOrder = 2, 
                    hoverText = l_tooltipHoverText_0, 
                    triggerPointName = "CarouselTooltip"
                })
            }), 
            CarouselFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_carouselHeight_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                CarouselContent = not not l_fetchingStatus_0 and v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = v33.state.dataStatus, 
                    onRetry = l_onRetry_0, 
                    renderOnLoading = function()
                        return nil;
                    end, 
                    renderOnLoaded = function()
                        return v61;
                    end
                }) or v61
            })
        };
        if not v22() then
            return v3.createElement(v8.FitFrame, {
                fitAxis = v8.FitAxis.Height, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            }, v69);
        else
            return v3.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            }, v69);
        end;
    end;
    if not l_getFFlagUpdateFriendCarousel10ft_0() then
        return l_withStyle_0(v70);
    else
        return l_withStyle_0(function(v71)
            return l_withSelectionCursorProvider_0(function(v72)
                return v70(v71, v72);
            end);
        end);
    end;
end;
return function(v73)
    local v74 = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_useUiModeInfo_0();
    local v75 = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_useStyle_0();
    return v3.createElement(v26, (v2.Dictionary.join(v73, {
        designTokens = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_useDesignTokens_0(function(v76)
            if v74.uiMode == l_UiMode_0.TenFoot then
                return {
                    headerFont = v76.Semantic.Typography.Header.Font, 
                    headerTextSize = v76.Semantic.Typography.Header.FontSize, 
                    subtitleTextSize = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then nil else v76.Semantic.Typography.Subheader.FontSize
                };
            else
                return {
                    headerFont = v75.Font.Header1.Font, 
                    headerTextSize = v75.Font.BaseSize * v75.Font.Header1.RelativeSize, 
                    subtitleTextSize = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then nil else v75.Font.BaseSize * v75.Font.CaptionLarge.RelativeSize
                };
            end;
        end), 
        showSeeAll = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else v73.showSeeAll and v74.uiMode ~= l_UiMode_0.TenFoot, 
        screenSize = l_useSelector_0(function(v77)
            return v77.ScreenSize;
        end)
    })));
end;
