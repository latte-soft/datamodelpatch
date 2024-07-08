local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.Common.memoize);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v8 = require(l_CorePackages_0.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_DeviceType_0 = v13.DeviceType;
local l_UiMode_0 = v13.UiMode;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v17 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameMedia);
local v18 = require(l_Modules_0.LuaApp.Thunks.OpenYouTubeVideo);
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.openYouTubeVideo);
local v20 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v21 = require(script.Parent.ExperienceDetailsFullscreenNavigationBindings);
local v22 = require(l_Modules_0.LuaApp.Constants);
local v23 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_MediaGalleryPreview_0 = v4.App.Container.MediaGalleryPreview;
local l_MediaGalleryHorizontal_0 = v4.App.Container.MediaGalleryHorizontal;
local l_MediaGalleryFullScreen_0 = v4.App.Container.MediaGalleryFullScreen;
local l_CrossFadeAnimatedView_0 = v4.App.Container.CrossFadeAnimatedView;
local l_MediaGalleryExpandableView_0 = v4.App.Container.MediaGalleryExpandableView;
local l_GetFFlagEnableMediaGalleryDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMediaGalleryDesignTokens;
local v32 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local v33 = require(script.Parent.Flags.FFlagEDPMediaAddLocalization10ft);
local l_FFlagLogYouTubeInteractionInApp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLogYouTubeInteractionInApp;
local l_GetFFlagEDPContextRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEDPContextRedesign;
local v36 = {
    view = "view", 
    play = "play"
};
local v37 = v2.PureComponent:extend("ExperienceMediaGallery");
v37.validateProps = v5.interface({
    universeId = v5.string, 
    isFullscreen = v5.optional(v5.boolean), 
    fullscreenShowIndex = v5.optional(v5.integer), 
    onPreviewActivated = v5.optional(v5.callback), 
    deviceType = v5.optional(v5.string), 
    tokens = if not l_GetFFlagEnableMediaGalleryDesignTokens_0() then nil else v5.optional(v5.table), 
    uiMode = v5.optional(v5.string), 
    isFullscreenState = v5.optional(v5.boolean), 
    onSelectionGained = v5.optional(v5.callback), 
    mediaGalleryGainFocused = v5.optional(v5.callback), 
    expandableAreaHeightOffset = v5.optional(v5.number), 
    nextIndex = v5.optional(v5.number), 
    isCrossFade = v5.optional(v5.boolean), 
    currentIndex = v5.optional(v5.number), 
    setCurrentIndex = v5.optional(v5.callback), 
    setCrossFade = v5.optional(v5.callback), 
    exitFullscreen = v5.optional(v5.callback)
});
v37.defaultProps = {
    isFullscreen = false, 
    fullscreenShowIndex = 1, 
    isFullscreenState = false, 
    expandableAreaHeightOffset = 592, 
    nextIndex = 1
};
v37.init = function(v38)
    local v39, v40 = v2.createBinding(0);
    v38.containerHeight = v39;
    v38.updateContainerHeight = v40;
    v38.containerSize = v38.containerHeight:map(function(v41)
        return UDim2.new(1, 0, 0, v41);
    end);
    v38.onResize = function(v42)
        local l_Offset_0 = l_MediaGalleryPreview_0:calcSizesFromWidth(v42.AbsoluteSize.X, 5).contentSize.Y.Offset;
        if l_Offset_0 ~= v38.containerHeight:getValue() then
            v38.updateContainerHeight(l_Offset_0);
        end;
    end;
    v38.processMediaEntry = function(v44, v45)
        local l_assetTypeId_0 = v44.assetTypeId;
        local v47 = nil;
        if l_assetTypeId_0 == v22.GameMediaImageType.YouTubeVideo then
            if v45 then
                v47 = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", v44.videoHash);
            else
                return nil;
            end;
        else
            v47 = "http://www.roblox.com/asset/?id=" .. tostring(v44.imageId);
        end;
        return {
            mediaType = v44.assetTypeId, 
            imageId = v47, 
            videoTitle = v44.videoTitle, 
            videoHash = v44.videoHash
        };
    end;
    v38.generateDefaultEntry = function(v48)
        return {
            mediaType = v22.GameMediaImageType.Image, 
            imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v48, 640, 360)
        };
    end;
    v38.selectGameMediaEntries = v6(function(v49, v50, v51, v52, v53)
        if v49 then
            local v54 = {
                unpack(v49, 1, v50)
            };
            local v55 = {};
            for _, v57 in ipairs(v54) do
                local v58 = v38.processMediaEntry(v57, v53);
                if v58 then
                    if v58.mediaType == v22.GameMediaImageType.YouTubeVideo then
                        table.insert(v55, 1, v58);
                    else
                        table.insert(v55, v58);
                    end;
                end;
            end;
            return v55;
        elseif v52 == v23.Done then
            return {
                [1] = v38.generateDefaultEntry(v51)
            };
        else
            return {};
        end;
    end);
    v38.getEntries = function()
        return v38.selectGameMediaEntries(v38.props.gameMediaEntries, 10, v38.props.placeId, v38.props.gameMediaFetchingStatus, v38.props.showVideoThumbnails);
    end;
    v38.getItemsFromEntries = v6(function(v59)
        return v8.List.map(v59, function(v60)
            return {
                imageId = v60.imageId, 
                isVideo = v60.mediaType == v22.GameMediaImageType.YouTubeVideo
            };
        end);
    end);
    v38.performOpenYouTubeVideo = function(v61, v62)
        local l_guiService_0 = v38.props.guiService;
        local l_openYouTubeVideo_0 = v38.props.openYouTubeVideo;
        local l_eventIngest_0 = v38.props.eventIngest;
        local l_universeId_0 = v38.props.universeId;
        local l_videoHash_0 = v61.videoHash;
        local l_videoTitle_0 = v61.videoTitle;
        if not (not (l_videoHash_0 and #l_videoHash_0 > 0) or not l_videoTitle_0) and #l_videoTitle_0 > 0 then
            if not l_FFlagLogYouTubeInteractionInApp_0 then
                l_openYouTubeVideo_0(l_guiService_0, l_videoHash_0, l_videoTitle_0, v62, l_eventIngest_0);
            else
                l_openYouTubeVideo_0(l_guiService_0, l_videoHash_0, l_videoTitle_0, v62, l_eventIngest_0, l_universeId_0, v36.play);
                return ;
            end;
        end;
    end;
    v38.openVideoItem = function(v69)
        local l_openLeaveRobloxAlertUIBlox_0 = v38.props.openLeaveRobloxAlertUIBlox;
        local l_showYouTubeAgeAlert_0 = v38.props.showYouTubeAgeAlert;
        local v72 = v38.getEntries()[v69];
        local function v73()
            v38.performOpenYouTubeVideo(v72, "gameDetailsAccordianImage");
        end;
        if not l_showYouTubeAgeAlert_0 then
            v38.performOpenYouTubeVideo(v72, "gameDetailsAccordianImage");
            return ;
        else
            l_openLeaveRobloxAlertUIBlox_0(v73);
            return ;
        end;
    end;
    if v38.props.uiMode == l_UiMode_0.TenFoot then
        v38.getConsoleItemsFromEntries = v6(function(v74)
            return v8.List.filter(v74, function(v75)
                return v75.mediaType ~= v22.GameMediaImageType.YouTubeVideo;
            end);
        end);
    end;
    if l_FFlagLogYouTubeInteractionInApp_0 then
        v38.logMediaItemsContainVideo = function(v76)
            local l_eventIngest_1 = v38.props.eventIngest;
            local l_universeId_1 = v38.props.universeId;
            local v80 = v8.List.filter(if not (v38.props.uiMode == l_UiMode_0.TenFoot) then v38.getEntries() else {}, function(v79)
                return v79.mediaType == v22.GameMediaImageType.YouTubeVideo;
            end)[1];
            if v80 then
                v19(l_eventIngest_1, v76, v80.videoTitle, v80.videoHash, l_universeId_1, v36.view);
            end;
        end;
    end;
    if not (not l_FFlagLogYouTubeInteractionInApp_0 or v38.props.isFullscreen) and v38.props.gameMediaFetchingStatus == v23.Done then
        v38.logMediaItemsContainVideo("gameDetailsAccordianImage");
    end;
end;
if l_FFlagLogYouTubeInteractionInApp_0 then
    v37.didUpdate = function(v81, v82, _)
        if (not v81.props.isFullscreen and v82.gameMediaFetchingStatus ~= v23.Done) and v81.props.gameMediaFetchingStatus == v23.Done then
            v81.logMediaItemsContainVideo("gameDetailsAccordianImage");
        end;
    end;
end;
v37.renderWithLocalization = function(v84, v85)
    local v86 = v84.getEntries();
    local v87 = if v84.props.uiMode == l_UiMode_0.TenFoot then v84.getConsoleItemsFromEntries(v86) else v84.getItemsFromEntries(v86);
    if #v87 <= 0 then
        return nil;
    else
        return not not v84.props.isFullscreen and v84:renderFullscreen(v87) or v84:renderPreview(v87, v85);
    end;
end;
v37.render = function(v88)
    if not v33 then
        return v88:renderWithLocalization();
    else
        return l_withLocalization_0({
            titleText = "Feature.GameDetails.Heading.Media"
        })(function(v89)
            return v88:renderWithLocalization(v89);
        end);
    end;
end;
v37.renderPreview = function(v90, v91, v92)
    if v90.props.deviceType == l_DeviceType_0.Tablet then
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 100), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Change.AbsoluteSize] = v90.onResize
        }, {
            MediaGalleryHorizontal = v2.createElement(l_MediaGalleryHorizontal_0, {
                layoutMode = "Carousel", 
                items = v91, 
                onPreviewActivated = v90.props.onPreviewActivated, 
                onVideoPlayActivated = v90.openVideoItem
            })
        });
    elseif l_GetFFlagEDPContextRedesign_0() and v90.props.deviceType == l_DeviceType_0.Phone then
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Change.AbsoluteSize] = v90.onResize
        }, {
            MediaGalleryHorizontal = v2.createElement(l_MediaGalleryHorizontal_0, {
                layoutMode = "Gallery", 
                items = v91, 
                onPreviewActivated = v90.props.onPreviewActivated, 
                onVideoPlayActivated = v90.openVideoItem, 
                borderRadius = UDim.new(0, 0), 
                itemPadding = 0
            })
        });
    elseif v90.props.uiMode == l_UiMode_0.TenFoot then
        local v93 = nil;
        v93 = if not v90.props.isFullscreenState then l_CursorKind_0.RoundedRect else l_CursorKind_0.Invisible;
        return l_withStyle_0(function(v94)
            return v2.createElement(v21.OnNavigateBackWrapper, {
                onNavigateBack = v90.props.exitFullscreen
            }, v2.createElement(l_MediaGalleryExpandableView_0, {
                items = v91, 
                titleText = if not not v33 and v92 then v92.titleText else nil, 
                showCursor = not v90.props.isFullscreenState, 
                selectionCursor = v93, 
                styleProps = if not v32 then nil else {
                    titleFont = v94.Tokens.Semantic.Typography.Header
                }, 
                exitFullscreen = not v90.props.isFullscreenState and function()
                end or v90.props.exitFullscreen, 
                onActivated = v90.props.onPreviewActivated, 
                onSelectionGained = function(v95)
                    local v96 = "";
                    if v91[v95] then
                        v96 = string.split(v91[v95].imageId, "=")[2];
                    end;
                    v90.props.onSelectionGained(v95, v96);
                end, 
                mediaGalleryGainFocused = v90.props.mediaGalleryGainFocused, 
                groupTransparency = 0, 
                expandableAreaHeightOffset = v90.props.expandableAreaHeightOffset, 
                animationConfig = if not not l_GetFFlagEnableMediaGalleryDesignTokens_0() and v90.props.tokens then v90.props.tokens.animationConfig else nil
            }));
        end);
    else
        return v2.createElement("Frame", {
            Size = v90.containerSize, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v2.Change.AbsoluteSize] = v90.onResize
        }, {
            MediaGalleryPreview = v2.createElement(l_MediaGalleryPreview_0, {
                items = v91, 
                numberOfThumbnails = 5, 
                onPreviewActivated = v90.props.onPreviewActivated, 
                onVideoPlayActivated = v90.openVideoItem
            })
        });
    end;
end;
v37.renderFullscreen = function(v97, v98)
    return l_withStyle_0(function(v99)
        if v97.props.uiMode == l_UiMode_0.TenFoot then
            return v2.createElement(l_CrossFadeAnimatedView_0, {
                items = v98, 
                crossAnim = {
                    currentIndex = v97.props.currentIndex, 
                    nextIndex = v97.props.nextIndex, 
                    setCurrentIndex = v97.props.setCurrentIndex, 
                    isCrossFade = v97.props.isCrossFade, 
                    setCrossFade = v97.props.setCrossFade
                }, 
                overlayTransparency = 1
            });
        else
            local l_Theme_0 = v99.Theme;
            return v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                BorderSizePixel = 0
            }, {
                Fullscreen = v2.createElement(l_MediaGalleryFullScreen_0, {
                    items = v98, 
                    showIndex = v97.props.fullscreenShowIndex, 
                    onVideoPlayActivated = v97.openVideoItem
                })
            });
        end;
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v101, _)
    return {
        showYouTubeAgeAlert = v101.getShowYouTubeAgeAlert(), 
        showVideoThumbnails = v101.getShowVideoThumbnails()
    };
end)((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    eventIngest = v12
})((v3.connect(function(v103, v104)
    local l_showVideoThumbnails_0 = v104.showVideoThumbnails;
    local v106 = v17.GetFetchingStatus(v103, v104.universeId);
    local v107 = v103.GameDetails[v104.universeId];
    local v108 = v103.Games[v104.universeId];
    return {
        showVideoThumbnails = l_showVideoThumbnails_0, 
        gameMediaFetchingStatus = v106, 
        gameMediaEntries = v103.GameMedia[v104.universeId], 
        placeId = not not v107 and v107.rootPlaceId or v108 and v108.placeId
    };
end, function(v109)
    return {
        openLeaveRobloxAlertUIBlox = function(v110)
            v109(v20(v110));
        end, 
        openYouTubeVideo = function(v111, v112, v113, v114, v115, v116, v117)
            if not l_FFlagLogYouTubeInteractionInApp_0 then
                return v109(v18(v111, v112, v113, v114, v115));
            else
                return v109(v18(v111, v112, v113, v114, v115, v116, v117));
            end;
        end
    };
end)(v37))))));
