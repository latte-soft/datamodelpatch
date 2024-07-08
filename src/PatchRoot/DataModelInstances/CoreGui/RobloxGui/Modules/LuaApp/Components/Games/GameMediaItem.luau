local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_SpringAnimatedItem_0 = v3.Utility.SpringAnimatedItem;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v6 = require(l_Modules_0.LuaApp.Components.LoadableImage);
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v8 = v2.PureComponent:extend("GameMediaItem");
v8.init = function(v9)
    v9.state = {
        loaded = v6.isLoaded(v9.props.Image)
    };
    v9.isMounted = false;
    v9.onImageLoaded = function()
        if not (not (v9.state.loaded == false) or not v9.isMounted) then
            v9:setState({
                loaded = true
            });
            if v9.props.onImageLoaded then
                v9.props.onImageLoaded();
            end;
        end;
    end;
end;
v8.didMount = function(v10)
    v10.isMounted = true;
end;
v8.willUnmount = function(v11)
    v11.isMounted = false;
end;
v8.render = function(v12)
    local l_Size_0 = v12.props.Size;
    local l_Position_0 = v12.props.Position;
    local l_LayoutOrder_0 = v12.props.LayoutOrder;
    local l_BackgroundColor3_0 = v12.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v12.props.BackgroundTransparency;
    local l_Image_0 = v12.props.Image;
    local l_ImageTransparency_0 = v12.props.ImageTransparency;
    local l_isVideo_0 = v12.props.isVideo;
    local l_videoIconColor_0 = v12.props.videoIconColor;
    local l_animationSettings_0 = v12.props.animationSettings;
    local l_onActivated_0 = v12.props.onActivated;
    local l_loaded_0 = v12.state.loaded;
    local v25 = l_ImageTransparency_0 ~= 1;
    local v26 = v25 and not l_loaded_0;
    local v27 = l_isVideo_0 and v25;
    local v28 = not not l_isVideo_0 and Enum.ScaleType.Crop or Enum.ScaleType.Stretch;
    local l_createElement_0 = v2.createElement;
    local v30 = "Frame";
    local v31 = {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        BorderSizePixel = 0
    };
    local v33 = {
        MediaImage = not not v26 and v2.createElement(v6, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_Image_0, 
            ImageTransparency = l_ImageTransparency_0, 
            ScaleType = v28, 
            ZIndex = 1, 
            useShimmerAnimationWhileLoading = true, 
            onLoaded = v12.onImageLoaded
        }) or v2.createElement(l_SpringAnimatedItem_0.AnimatedImageLabel, {
            regularProps = {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = l_Image_0, 
                ScaleType = v28, 
                ZIndex = 1
            }, 
            animatedValues = {
                transparency = l_ImageTransparency_0
            }, 
            mapValuesToProps = function(v32)
                return {
                    ImageTransparency = v32.transparency
                };
            end, 
            springOptions = l_animationSettings_0
        }), 
        VideoIconBackground = v27 and v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Image = "rbxasset://textures/ui/LuaApp/graphic/playBtnBackground.png", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            VideoIcon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 1), 
                Size = UDim2.new(0, 60, 0, 45), 
                Position = UDim2.new(1, -10, 1, -10), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = l_GetImageData_0("LuaApp/buttons/buttonPill") or "LuaApp/buttons/buttonPill", 
                ImageColor3 = l_videoIconColor_0, 
                ImageTransparency = 0.5
            }, {
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(0, 26, 0, 26), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_GetImageData_0("LuaApp/icons/GameDetails/play") or "LuaApp/icons/GameDetails/play", 
                    ImageColor3 = l_videoIconColor_0, 
                    ScaleType = Enum.ScaleType.Fit
                })
            })
        })
    };
    local v34 = false;
    if l_onActivated_0 ~= nil then
        v34 = v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = "", 
            ZIndex = 3, 
            [v2.Event.Activated] = l_onActivated_0
        });
    end;
    v33.ItemActivationButton = v34;
    return l_createElement_0(v30, v31, v33);
end;
return v8;
