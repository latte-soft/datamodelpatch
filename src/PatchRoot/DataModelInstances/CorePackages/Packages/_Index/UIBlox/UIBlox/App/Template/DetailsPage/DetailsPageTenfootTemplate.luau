local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_2.Cryo);
local l_AnimatedFlatList_0 = require(l_Parent_2.VirtualizedList).AnimatedFlatList;
local v5 = require(l_Parent_0.DetailsPageHeader);
local v6 = require(l_Parent_0.getPlatformConfig);
local v7 = require(l_Parent_0.Hooks.useDetailsPageRenderItems);
local v8 = require(l_Parent_0.Hooks.useAnimateFullscreen);
local v9 = require(l_Parent_0.DetailsPageRenderItem);
local v10 = require(l_Parent_1.Dialog.Overlay.Overlay);
local v11 = require(l_Parent_1.Loading.LoadableImage);
local _ = require(l_Parent_1.Style.Constants);
local _ = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Types);
local v15 = require(l_Parent_2.React);
local v16 = {
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }, 
    itemPadding = 36, 
    safeAreaSize = Vector2.new(96, 144), 
    trailingWhitespace = 3000
};
return function(v17)
    local l_v16_0 = v16;
    if v17.tokens then
        l_v16_0 = v3.Dictionary.join(l_v16_0, v17.tokens);
    end;
    local v19, v20 = v15.useState(true);
    local v21 = v15.useMemo(function()
        return v6(v17.deviceType);
    end, {
        v17.deviceType
    });
    local v22 = v15.useRef(nil);
    local v23, v24 = v15.useState(Vector2.new(0, 0));
    local v26 = v15.useCallback(function(v25)
        v24(v25.AbsoluteSize);
    end, {});
    v15.useEffect(function()
        if v22.current then
            v24(v22.current.AbsoluteSize);
        end;
    end, {});
    local v27 = if not v17.thumbnailHeight then v21.thumbnailHeight else v17.thumbnailHeight;
    local v28 = if v17.headerBarBackgroundHeight ~= nil then v17.headerBarBackgroundHeight else v21.headerBarBackgroundHeight;
    local v29 = if not v17.sideMargin then v21.sideMargin else v17.sideMargin;
    local v30 = not (v17.isFullscreen == nil) and v17.isFullscreen;
    local l_renderFullscreenContent_0 = v17.renderFullscreenContent;
    local v32, v33 = v8(v30, l_renderFullscreenContent_0, l_v16_0.animationConfig);
    local v34 = v7(v17.componentList, v15.useMemo(function()
        return v15.createElement(v5, {
            thumbnailImageUrl = v17.thumbnailImageUrl, 
            thumbnailAspectRatio = v17.thumbnailAspectRatio, 
            thumbnailHeight = v27, 
            titleText = v17.titleText, 
            subTitleText = v17.subTitleText, 
            renderInfoContent = v17.renderInfoContent, 
            actionBarProps = v17.actionBarProps, 
            sideMargin = v29, 
            headerBarBackgroundHeight = v28, 
            deviceType = v17.deviceType, 
            thumbnailShadowHeight = l_v16_0.thumbnailShadowHeight, 
            gradientHeight = l_v16_0.headerGradientHeight, 
            actionBarHeight = l_v16_0.actionBarHeight, 
            actionBarWidth = l_v16_0.actionBarWidth, 
            itemPadding = l_v16_0.thumbnailMargin, 
            bottomMargin = l_v16_0.headerBottomMargin
        });
    end, {
        v17.thumbnailImageUrl, 
        v17.thumbnailAspectRatio, 
        v27, 
        v17.titleText, 
        v17.subTitleText, 
        v17.renderInfoContent, 
        v17.actionBarProps, 
        v29, 
        v28, 
        v17.deviceType, 
        l_v16_0.thumbnailShadowHeight, 
        l_v16_0.headerGradientHeight, 
        l_v16_0.thumbnailMargin, 
        l_v16_0.headerBottomMargin
    }), v23, l_v16_0.safeAreaSize);
    return v15.createElement("Frame", {
        [v15.Change.AbsoluteSize] = v26, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v22
    }, {
        BackgroundImage = v15.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            BackgroundImage = v15.createElement(v11, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v17.bannerImageUrl, 
                ScaleType = Enum.ScaleType.Crop
            })
        }), 
        Overlay = v15.createElement(v10, {
            ZIndex = 2, 
            showGradient = v19, 
            gradientDirection = "topRight"
        }), 
        Content = v15.createElement(l_AnimatedFlatList_0, {
            onSelectedIndexChanged = v15.useCallback(function(v35)
                if v34[v35].showCornerGradient == false then
                    v20(false);
                    return ;
                else
                    v20(true);
                    return ;
                end;
            end, {
                v34
            }), 
            animated = true, 
            initialNumToRender = #v34, 
            data = v34, 
            renderItem = v15.useCallback(function(v36)
                return v15.createElement(v9, {
                    item = v36.item, 
                    itemPadding = l_v16_0.itemPadding, 
                    safeArea = l_v16_0.safeAreaSize
                });
            end, {
                l_v16_0.itemPadding, 
                l_v16_0.safeAreaSize
            }), 
            ItemSeparatorComponent = v15.useCallback(function()
                return v15.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_v16_0.itemPadding), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                });
            end, {
                l_v16_0.itemPadding
            }), 
            ListFooterComponent = v15.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v16_0.trailingWhitespace), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListHeaderComponent = v15.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_v16_0.safeAreaSize.Y), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            viewOffset = l_v16_0.safeAreaSize.Y, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                ScrollingEnabled = false, 
                Selectable = false, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ZIndex = 3
            }, 
            animationConfig = l_v16_0.animationConfig, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            overrideAutomaticCanvasSize = true
        }), 
        Fullscreen = v15.createElement("CanvasGroup", {
            Size = UDim2.fromScale(1, 1), 
            GroupTransparency = v33, 
            BorderSizePixel = 0, 
            ZIndex = 4
        }, {
            FullscreenContent = if not v32 then nil else l_renderFullscreenContent_0()
        })
    });
end;
