local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_Functional_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Functional;
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v12 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenYouTubeVideo);
local v15 = require(l_Modules_0.LuaApp.Analytics.Events.openYouTubeVideo);
local l_AccordionView_0 = v4.AccordionView;
local v17 = require(l_Modules_0.LuaApp.Components.Games.GameMediaItem);
local v18 = require(l_Modules_0.LuaApp.Components.LoadableImage);
local v19 = require(l_Modules_0.LuaApp.Components.GenericIconButton);
local v20 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v21 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v22 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameMedia);
local l_FFlagLogYouTubeInteractionInApp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLogYouTubeInteractionInApp;
local v24 = {
    view = "view", 
    play = "play"
};
local function v29(v25, v26)
    local l_assetTypeId_0 = v25.assetTypeId;
    local v28 = nil;
    if l_assetTypeId_0 == v7.GameMediaImageType.YouTubeVideo then
        if v26 then
            v28 = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", v25.videoHash);
        else
            return nil;
        end;
    else
        v28 = "http://www.roblox.com/asset/?id=" .. tostring(v25.imageId);
    end;
    return {
        mediaType = v25.assetTypeId, 
        imageId = v28, 
        videoTitle = v25.videoTitle, 
        videoHash = v25.videoHash
    };
end;
local function _(v30)
    return {
        mediaType = v7.GameMediaImageType.Image, 
        imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v30, 768, 432)
    };
end;
local v42 = v8(function(v32, v33, v34, v35, v36)
    if v32 then
        local v37 = {
            unpack(v32, 1, v33)
        };
        local v38 = {};
        for _, v40 in ipairs(v37) do
            local v41 = v29(v40, v36);
            if v41 then
                table.insert(v38, v41);
            end;
        end;
        return v38;
    elseif v35 == v12.Done then
        return {
            [1] = {
                mediaType = v7.GameMediaImageType.Image, 
                imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v34, 768, 432)
            }
        };
    else
        return {};
    end;
end);
local v43 = v5.PureComponent:extend("GameMediaAccordionView");
v43.init = function(v44)
    v44.isMounted = false;
    v44.state = {
        firstImageLoaded = v18.isLoaded(v44.props.firstImageId)
    };
    v44.performOpenYouTubeVideo = function(v45, v46)
        local l_guiService_0 = v44.props.guiService;
        local l_openYouTubeVideo_0 = v44.props.openYouTubeVideo;
        local l_eventIngest_0 = v44.props.eventIngest;
        local l_universeId_0 = v44.props.universeId;
        local l_videoHash_0 = v45.videoHash;
        local l_videoTitle_0 = v45.videoTitle;
        if not (not (l_videoHash_0 and #l_videoHash_0 > 0) or not l_videoTitle_0) and #l_videoTitle_0 > 0 then
            if not l_FFlagLogYouTubeInteractionInApp_0 then
                l_openYouTubeVideo_0(l_guiService_0, l_videoHash_0, l_videoTitle_0, v46, l_eventIngest_0);
            else
                l_openYouTubeVideo_0(l_guiService_0, l_videoHash_0, l_videoTitle_0, v46, l_eventIngest_0, l_universeId_0, v24.play);
                return ;
            end;
        end;
    end;
    if l_FFlagLogYouTubeInteractionInApp_0 then
        v44.logMediaItemsContainVideo = function(v53)
            local l_eventIngest_1 = v44.props.eventIngest;
            local l_universeId_1 = v44.props.universeId;
            local v57 = l_Functional_0.Filter(v44.props.gameMediaEntries or {}, function(v56)
                return v56.mediaType == v7.GameMediaImageType.YouTubeVideo;
            end)[1];
            if v57 then
                v15(l_eventIngest_1, v53, v57.videoTitle, v57.videoHash, l_universeId_1, v24.view);
            end;
        end;
    end;
    v44.openItem = function(v58)
        if v58.mediaType == v7.GameMediaImageType.YouTubeVideo then
            local l_openLeaveRobloxAlertUIBlox_0 = v44.props.openLeaveRobloxAlertUIBlox;
            local l_showYouTubeAgeAlert_0 = v44.props.showYouTubeAgeAlert;
            local function v61()
                v44.performOpenYouTubeVideo(v58, "gameDetailsAccordianImage");
            end;
            if not l_showYouTubeAgeAlert_0 then
                v44.performOpenYouTubeVideo(v58, "gameDetailsAccordianImage");
            else
                l_openLeaveRobloxAlertUIBlox_0(v61);
                return ;
            end;
        end;
    end;
    v44.onImageLoaded = function(v62)
        if not (not (v62 == 1 and v44.state.firstImageLoaded == false) or not v44.isMounted) then
            v44:setState({
                firstImageLoaded = true
            });
        end;
    end;
    if l_FFlagLogYouTubeInteractionInApp_0 and v44.props.gameMediaFetchingStatus == v12.Done then
        v44.logMediaItemsContainVideo("gameDetailsAccordianImage");
    end;
end;
v43.renderItem = function(v63, v64, v65, v66)
    local l_GameMediaAccordion_0 = v63.props.appTheme.GameMediaAccordion;
    return v5.createElement(v17, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_GameMediaAccordion_0.Item.BackgroundColor, 
        BackgroundTransparency = l_GameMediaAccordion_0.Item.BackgroundTransparency, 
        Image = v64.imageId, 
        ImageTransparency = v65, 
        isVideo = v64.mediaType == v7.GameMediaImageType.YouTubeVideo, 
        videoIconColor = l_GameMediaAccordion_0.VideoIconColor, 
        animationSettings = v66, 
        onImageLoaded = function()
            v63.onImageLoaded((l_Functional_0.Find(v63.props.gameMediaEntries, v64)));
        end, 
        onActivated = function()
            v63.openItem(v64);
        end
    });
end;
v43.render = function(v68)
    local l_GameMediaAccordion_1 = v68.props.appTheme.GameMediaAccordion;
    local l_gameMediaEntries_0 = v68.props.gameMediaEntries;
    local l_LayoutOrder_0 = v68.props.LayoutOrder;
    local l_width_0 = v68.props.width;
    local v73 = not not v68.state.firstImageLoaded and l_GameMediaAccordion_1.FakeItem.Loaded or l_GameMediaAccordion_1.FakeItem.Loading;
    local l_withNewThemeProvider_0 = v68.props.withNewThemeProvider;
    if #l_gameMediaEntries_0 > 0 then
        return v5.createElement(l_AccordionView_0, {
            items = l_gameMediaEntries_0, 
            itemWidth = l_width_0, 
            itemHeight = l_width_0 * 0.5611940298507463, 
            renderItem = function(...)
                return v68:renderItem(...);
            end, 
            placeholderColor = v73.Color, 
            placeholderBaseTransparency = v73.BaseTransparency, 
            collapseButtonSize = 44, 
            renderCollapseButton = function(v75)
                return v5.createElement(v19, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    iconSize = UDim2.new(0, 36, 0, 36), 
                    iconImage = "LuaApp/icons/GameDetails/collapse", 
                    onActivated = v75, 
                    withNewThemeProvider = l_withNewThemeProvider_0
                });
            end, 
            LayoutOrder = l_LayoutOrder_0, 
            maxItemsInCompactView = 3
        });
    else
        return nil;
    end;
end;
v43.didUpdate = function(v76, v77, _)
    if v77.firstImageId ~= v76.props.firstImageId then
        local v79 = v18.isLoaded(v76.props.firstImageId);
        if v79 ~= v76.state.firstImageLoaded then
            v76:setState({
                firstImageLoaded = v79
            });
        end;
    end;
    if (l_FFlagLogYouTubeInteractionInApp_0 and v77.gameMediaFetchingStatus ~= v12.Done) and v76.props.gameMediaFetchingStatus == v12.Done then
        v76.logMediaItemsContainVideo("gameDetailsAccordianImage");
    end;
end;
v43.didMount = function(v80)
    v80.isMounted = true;
end;
v43.willUnmount = function(v81)
    v81.isMounted = false;
end;
return (l_RoactAppPolicy_0.connect(function(v82, _)
    return {
        showYouTubeAgeAlert = v82.getShowYouTubeAgeAlert(), 
        showVideoThumbnails = v82.getShowVideoThumbnails()
    };
end)((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    eventIngest = v20
})((v6.connect(function(v84, v85)
    local l_showVideoThumbnails_0 = v85.showVideoThumbnails;
    local v87 = nil;
    local v88 = v22.GetFetchingStatus(v84, v85.universeId);
    v87 = v42(v84.GameMedia[v85.universeId], 10, v85.placeId, v88, l_showVideoThumbnails_0);
    local l_None_0 = v5.None;
    if v87 ~= nil and v87[1] ~= nil then
        l_None_0 = v87[1].imageId;
    end;
    return {
        gameMediaEntries = v87, 
        gameMediaFetchingStatus = if not l_FFlagLogYouTubeInteractionInApp_0 then nil else v88, 
        firstImageId = l_None_0
    };
end, function(v90)
    return {
        openLeaveRobloxAlertUIBlox = function(v91)
            v90(v13(v91));
        end, 
        openYouTubeVideo = function(v92, v93, v94, v95, v96, v97, v98)
            if not l_FFlagLogYouTubeInteractionInApp_0 then
                return v90(v14(v92, v93, v94, v95, v96));
            else
                return v90(v14(v92, v93, v94, v95, v96, v97, v98));
            end;
        end
    };
end)((v21(v43))))))));
