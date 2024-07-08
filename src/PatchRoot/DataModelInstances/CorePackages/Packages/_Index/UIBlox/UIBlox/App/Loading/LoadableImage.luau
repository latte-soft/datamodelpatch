local v0 = nil;
pcall(function()
    v0 = game:GetService("RbxAnalyticsService");
end);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_0.ShimmerPanel);
local v9 = require(l_Parent_0.Enum.DebugProps);
local v10 = require(l_Parent_0.Enum.LoadingStrategy);
local v11 = require(l_Parent_1.Core.Style.withStyle);
local v12 = require(l_Parent_1.App.ImageSet.Images);
local v13 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v14 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v15 = require(l_Parent_1.App.Context.ContentProvider);
local v16 = v5.PureComponent:extend("LoadableImage");
v16.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    BackgroundColor3 = v6.optional(v6.Color3), 
    BackgroundTransparency = v6.optional(v6.number), 
    cornerRadius = v6.optional(v6.UDim), 
    Image = v6.optional(v6.union(v6.string, v14)), 
    ImageColor3 = v6.optional(v6.Color3), 
    ImageTransparency = v6.optional(v6.number), 
    ImageRectOffset = v6.optional(v6.union(v6.Vector2, v6.table)), 
    ImageRectSize = v6.optional(v6.union(v6.Vector2, v6.table)), 
    LayoutOrder = v6.optional(v6.integer), 
    loadingImage = v6.optional(v6.union(v6.string, v6.table)), 
    loadingStrategy = v6.optional(v10.isEnumValue), 
    loadingTimeout = v6.optional(v6.numberPositive), 
    renderOnLoading = v6.optional(v6.callback), 
    renderOnFailed = v6.optional(v6.callback), 
    MaxSize = v6.optional(v6.Vector2), 
    MinSize = v6.optional(v6.Vector2), 
    onLoaded = v6.optional(v6.callback), 
    Position = v6.optional(v6.UDim2), 
    ScaleType = v6.optional(v6.enum(Enum.ScaleType)), 
    Size = v6.UDim2, 
    useShimmerAnimationWhileLoading = v6.optional(v6.boolean), 
    showFailedStateWhenLoadingFailed = v6.optional(v6.boolean), 
    ZIndex = v6.optional(v6.integer), 
    shouldHandleReloads = v6.optional(v6.boolean), 
    contentProvider = v6.union(v6.instanceOf("ContentProvider"), v6.table), 
    [v9.forceLoading] = v6.optional(v6.boolean), 
    [v9.forceFailed] = v6.optional(v6.boolean)
});
v16.defaultProps = {
    BackgroundTransparency = 0, 
    cornerRadius = UDim.new(0, 0), 
    MaxSize = Vector2.new(math.huge, math.huge), 
    MinSize = Vector2.new(0, 0), 
    useShimmerAnimationWhileLoading = false, 
    showFailedStateWhenLoadingFailed = false, 
    loadingStrategy = v10.Default, 
    loadingTimeout = 30, 
    shouldHandleReloads = false
};
v16.init = function(v17)
    v17.currentImageLoadIndex = 0;
    v17:setState({
        eagerRetrying = false
    });
    v17.imageRef = v5.createRef();
    v17._isMounted = false;
end;
v16.renderShimmer = function(v18, v19, v20)
    return v5.createElement("Frame", {
        AnchorPoint = v18.props.AnchorPoint, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v19.PlaceHolder.Color, 
        BackgroundTransparency = v19.PlaceHolder.Transparency, 
        LayoutOrder = v18.props.LayoutOrder, 
        Position = v18.props.Position, 
        Size = v18.props.Size, 
        ZIndex = v18.props.ZIndex
    }, {
        Shimmer = v5.createElement(v8, {
            Size = UDim2.new(1, 0, 1, 0), 
            cornerRadius = v18.props.cornerRadius
        }), 
        UISizeConstraint = v20, 
        UICorner = v5.createElement("UICorner", {
            CornerRadius = v18.props.cornerRadius
        }) or nil
    });
end;
v16.defaultRenderOnFail = function(v21, v22, v23)
    local l_cornerRadius_0 = v21.props.cornerRadius;
    local v25 = v12["icons/status/imageunavailable"];
    local v26 = v25.ImageRectSize / v12.ImagesResolutionScale;
    return v5.createElement("Frame", {
        AnchorPoint = v21.props.AnchorPoint, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v22.PlaceHolder.Color, 
        BackgroundTransparency = v22.PlaceHolder.Transparency, 
        LayoutOrder = v21.props.LayoutOrder, 
        Position = v21.props.Position, 
        Size = v21.props.Size, 
        ZIndex = v21.props.ZIndex
    }, {
        EmptyIcon = v5.createElement(v13.Label, {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = v25, 
            ImageColor3 = v22.UIDefault.Color, 
            ImageTransparency = v22.UIDefault.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v26.X, 0, v26.Y)
        }, {
            UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v5.createElement("UICorner", {
                CornerRadius = l_cornerRadius_0
            }) or nil
        }), 
        UISizeConstraint = v23, 
        UICorner = l_cornerRadius_0 ~= UDim.new(0, 0) and v5.createElement("UICorner", {
            CornerRadius = l_cornerRadius_0
        }) or nil
    });
end;
v16.isImageNonNil = function(v27)
    local v28 = false;
    if v27.props.Image ~= v5.None then
        v28 = v27.props.Image ~= nil;
    end;
    return v28;
end;
v16.getCurrentImageAssetFetchStatus = function(v29, v30)
    local v31 = v30[v29:getAssetFetchStatusStateKey(v29.currentImageLoadIndex)];
    if v31 == nil then
        v31 = Enum.AssetFetchStatus.None;
    end;
    return v31;
end;
v16.isLoadingComplete = function(v32, v33)
    local v34 = v32:getCurrentImageAssetFetchStatus(v33);
    if not (v34 ~= Enum.AssetFetchStatus.None) or v34 == Enum.AssetFetchStatus.Loading then
        return false;
    elseif not (not (v34 ~= Enum.AssetFetchStatus.Failure) or v34 == Enum.AssetFetchStatus.TimedOut) or not v33.eagerRetrying then
        return true;
    else
        return false;
    end;
end;
v16.render = function(v35)
    local l_AnchorPoint_0 = v35.props.AnchorPoint;
    local l_LayoutOrder_0 = v35.props.LayoutOrder;
    local l_Size_0 = v35.props.Size;
    local l_Position_0 = v35.props.Position;
    local l_BackgroundColor3_0 = v35.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v35.props.BackgroundTransparency;
    local l_cornerRadius_1 = v35.props.cornerRadius;
    local l_ScaleType_0 = v35.props.ScaleType;
    local l_ZIndex_0 = v35.props.ZIndex;
    local l_Image_0 = v35.props.Image;
    local l_ImageTransparency_0 = v35.props.ImageTransparency;
    local l_ImageRectOffset_0 = v35.props.ImageRectOffset;
    local l_ImageRectSize_0 = v35.props.ImageRectSize;
    local l_ImageColor3_0 = v35.props.ImageColor3;
    local l_MaxSize_0 = v35.props.MaxSize;
    local l_MinSize_0 = v35.props.MinSize;
    local l_renderOnLoading_0 = v35.props.renderOnLoading;
    local l_renderOnFailed_0 = v35.props.renderOnFailed;
    local l_loadingImage_0 = v35.props.loadingImage;
    local l_loadingStrategy_0 = v35.props.loadingStrategy;
    local l_useShimmerAnimationWhileLoading_0 = v35.props.useShimmerAnimationWhileLoading;
    local l_showFailedStateWhenLoadingFailed_0 = v35.props.showFailedStateWhenLoadingFailed;
    local v58 = v35:isImageNonNil() and v35:isLoadingComplete(v35.state);
    local v59 = v35:getCurrentImageAssetFetchStatus(v35.state);
    local v60 = v59 ~= Enum.AssetFetchStatus.None;
    local v61 = v59 == Enum.AssetFetchStatus.Failure;
    local v62 = false;
    if v35.props[v9.forceLoading] then
        v58 = false;
    end;
    if v35.props[v9.forceFailed] then
        v61 = true;
    end;
    if not ((l_MaxSize_0.X == math.huge and l_MaxSize_0.Y == math.huge) and l_MinSize_0.X == 0) or l_MinSize_0.Y ~= 0 then
        v62 = true;
    end;
    local v63 = v62 and v5.createElement("UISizeConstraint", {
        MaxSize = l_MaxSize_0, 
        MinSize = l_MinSize_0
    });
    return v11(function(v64)
        local l_Theme_0 = v64.Theme;
        if not v61 or not l_renderOnFailed_0 then
            if not v61 or not l_showFailedStateWhenLoadingFailed_0 then
                if not (v58 or not l_renderOnLoading_0) and l_loadingStrategy_0 ~= v10.Default then
                    return l_renderOnLoading_0();
                elseif not (v58 or not l_useShimmerAnimationWhileLoading_0) and l_loadingStrategy_0 ~= v10.Default then
                    return v35:renderShimmer(l_Theme_0, v63);
                else
                    local v66 = v58 or l_loadingStrategy_0 == v10.Default;
                    local v67 = nil;
                    if not (v58 or not l_renderOnLoading_0) and l_loadingStrategy_0 == v10.Default then
                        v67 = l_renderOnLoading_0();
                    end;
                    local v68 = nil;
                    if not (not (not (v58 or not l_useShimmerAnimationWhileLoading_0) and l_loadingStrategy_0 == v10.Default) or not v60) then
                        v68 = v35:renderShimmer(l_Theme_0, v63);
                    end;
                    return v5.createElement(v13.Label, {
                        AnchorPoint = l_AnchorPoint_0, 
                        BackgroundColor3 = l_BackgroundColor3_0 or l_Theme_0.PlaceHolder.Color, 
                        BackgroundTransparency = l_BackgroundTransparency_0 or l_Theme_0.PlaceHolder.Transparency, 
                        BorderSizePixel = 0, 
                        Image = not not v66 and l_Image_0 or l_loadingImage_0, 
                        ImageTransparency = l_ImageTransparency_0, 
                        ImageRectOffset = l_ImageRectOffset_0, 
                        ImageRectSize = l_ImageRectSize_0, 
                        ImageColor3 = not not v66 and l_ImageColor3_0 or nil, 
                        LayoutOrder = l_LayoutOrder_0, 
                        Position = l_Position_0, 
                        ScaleType = l_ScaleType_0, 
                        Size = l_Size_0, 
                        ZIndex = l_ZIndex_0, 
                        [v5.Ref] = v35.imageRef
                    }, {
                        UISizeConstraint = v63, 
                        UICorner = l_cornerRadius_1 ~= UDim.new(0, 0) and v5.createElement("UICorner", {
                            CornerRadius = l_cornerRadius_1
                        }) or nil, 
                        OnLoading = v67, 
                        Shimmer = v68
                    });
                end;
            else
                return v35:defaultRenderOnFail(l_Theme_0, v63);
            end;
        else
            return l_renderOnFailed_0();
        end;
    end);
end;
v16.maybeCallOnLoaded = function(v69, v70)
    if v69.props.onLoaded then
        local v71 = v69:isLoadingComplete(v70);
        local v72 = v69:isLoadingComplete(v69.state);
        if not (v71 or not v72) then
            v69.props.onLoaded();
        end;
    end;
end;
v16.didUpdate = function(v73, v74, v75)
    if v74.Image ~= v73.props.Image then
        v73:loadImage();
    end;
    v73:maybeCallOnLoaded(v75);
end;
v16.didMount = function(v76)
    v76._isMounted = true;
    v76:loadImage();
end;
v16.willUnmount = function(v77)
    v77._isMounted = false;
    v77:dropConnections();
end;
v16.isTerminalStatus = function(_, v79)
    local v80 = true;
    if v79 ~= Enum.AssetFetchStatus.Success then
        v80 = true;
        if v79 ~= Enum.AssetFetchStatus.Failure then
            v80 = v79 == Enum.AssetFetchStatus.TimedOut;
        end;
    end;
    return v80;
end;
v16.getImageUri = function(v81)
    if not v81.props.Image then
        return nil;
    elseif typeof(v81.props.Image) == "string" then
        return v81.props.Image;
    else
        return v81.props.Image.Image;
    end;
end;
v16.awaitImageLoaded = function(v82, v83, v84)
    if not v82:isTerminalStatus(v84) then
        local v85 = v82:getImageUri();
        local function v87(v86)
            v82:updateAssetFetchStatusForImageLoadIndex(v86, v83, v85);
            v82:maybeReportCounter("Await", v86);
            if not (not v82:isTerminalStatus(v86) or not v82.awaitImageLoadedConnection) then
                v82.awaitImageLoadedConnection:Disconnect();
                v82.awaitImageLoadedConnection = nil;
            end;
        end;
        if v85 == "" then
            local l_Success_0 = Enum.AssetFetchStatus.Success;
            v82:updateAssetFetchStatusForImageLoadIndex(l_Success_0, v83, v85);
            v82:maybeReportCounter("Await", l_Success_0);
            if not (not v82:isTerminalStatus(l_Success_0) or not v82.awaitImageLoadedConnection) then
                v82.awaitImageLoadedConnection:Disconnect();
                v82.awaitImageLoadedConnection = nil;
            end;
            return ;
        else
            v82.awaitImageLoadedConnection = v82.props.contentProvider:GetAssetFetchStatusChangedSignal(v85):Connect(v87);
            return ;
        end;
    else
        return ;
    end;
end;
v16.maybeReportCounter = function(_, v90, v91)
    pcall(function()
        v0:ReportCounter("UIBlox_LoadableImage_" .. v90 .. "_" .. tostring(v91));
    end);
end;
v16.preloadImageWithRetryLogic = function(v92, v93)
    local v94 = v92:getImageUri();
    local v95 = 0;
    local l_None_0 = Enum.AssetFetchStatus.None;
    while true do
        if v92._isMounted then
            if v95 > 0 then
                task.wait(1.5 * math.pow(2, v95 - 1));
            end;
            v92.props.contentProvider:PreloadAsync({
                v94
            }, function(_, v98)
                local v99 = v92:getImageUri();
                if v92._isMounted and v99 == v94 then
                    v92:maybeReportCounter("PreloadAsync", v98);
                    l_None_0 = v98;
                    v92:updateAssetFetchStatusForImageLoadIndex(v98, v93, v94);
                end;
            end);
            local v100 = v92:getImageUri();
            if not v92._isMounted or v100 ~= v94 then
                return ;
            else
                if l_None_0 ~= Enum.AssetFetchStatus.Success then
                    v95 = v95 + 1;
                    if not (l_None_0 == Enum.AssetFetchStatus.Failure and v95 > 3) and (not (l_None_0 == Enum.AssetFetchStatus.TimedOut) or v95 <= 5) then
                        v92:setState({
                            eagerRetrying = true
                        });
                        continue;
                    end;
                end;
                v92:setState({
                    eagerRetrying = false
                });
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v16.getAssetFetchStatusStateKey = function(_, v102)
    return "assetFetchStatus_" .. tostring(v102);
end;
v16.updateAssetFetchStatusForImageLoadIndex = function(v103, v104, v105, _)
    v103:setState({
        [v103:getAssetFetchStatusStateKey(v105)] = v104
    });
end;
v16.dropConnections = function(v107)
    if v107.listenForReloadsConnection then
        v107.listenForReloadsConnection:Disconnect();
        v107.listenForReloadsConnection = nil;
    end;
    if v107.awaitImageLoadedConnection then
        v107.awaitImageLoadedConnection:Disconnect();
        v107.awaitImageLoadedConnection = nil;
    end;
end;
v16.loadImage = function(v108)
    local v109 = v108.currentImageLoadIndex + 1;
    v108.currentImageLoadIndex = v109;
    local v110 = v108:getImageUri();
    local l_loadingStrategy_1 = v108.props.loadingStrategy;
    v108:dropConnections();
    if v110 == nil then
        v108:updateAssetFetchStatusForImageLoadIndex(Enum.AssetFetchStatus.Success, v109, v110);
        v108:setState({
            eagerRetrying = false
        });
        return ;
    else
        local l_AssetFetchStatus_0 = v108.props.contentProvider:GetAssetFetchStatus(v110);
        v108:maybeReportCounter("InitialStatus", l_AssetFetchStatus_0);
        v108:updateAssetFetchStatusForImageLoadIndex(l_AssetFetchStatus_0, v109, v110);
        if v108.props.shouldHandleReloads then
            v108.listenForReloadsConnection = v108.props.contentProvider:GetAssetFetchStatusChangedSignal(v110):Connect(function(v113, _)
                v108:maybeReportCounter("Reloads", v113);
                v108:updateAssetFetchStatusForImageLoadIndex(v113, v109, v110);
            end);
        end;
        if l_loadingStrategy_1 == v10.Eager then
            task.spawn(function()
                v108:preloadImageWithRetryLogic(v109);
            end);
            return ;
        else
            if l_loadingStrategy_1 == v10.Default then
                v108:awaitImageLoaded(v109, l_AssetFetchStatus_0);
            end;
            return ;
        end;
    end;
end;
return function(v115)
    return v5.createElement(v15.Consumer, {
        render = function(v116)
            return v5.createElement(v16, (v7.Dictionary.join(v115, {
                contentProvider = v116
            })));
        end
    });
end;
