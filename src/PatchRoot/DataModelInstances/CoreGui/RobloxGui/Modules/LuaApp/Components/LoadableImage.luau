local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v4 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local l_Decal_0 = Instance.new("Decal");
local v6 = {};
local v7 = v2.PureComponent:extend("LoadableImage");
v7.defaultProps = {
    useShimmerAnimationWhileLoading = false, 
    ScaleType = Enum.ScaleType.Stretch
};
v7.init = function(v8)
    v8.state = {
        loaded = v6[v8.props.Image]
    };
    v8._isMounted = false;
end;
v7.render = function(v9)
    local l_Size_0 = v9.props.Size;
    local l_Position_0 = v9.props.Position;
    local l_BorderSizePixel_0 = v9.props.BorderSizePixel;
    local l_BackgroundColor3_0 = v9.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v9.props.BackgroundTransparency;
    local l_ScaleType_0 = v9.props.ScaleType;
    local l_ZIndex_0 = v9.props.ZIndex;
    local l_Image_0 = v9.props.Image;
    local l_loadingImage_0 = v9.props.loadingImage;
    local l_useShimmerAnimationWhileLoading_0 = v9.props.useShimmerAnimationWhileLoading;
    local l_loaded_0 = v9.state.loaded;
    if l_loaded_0 or not l_useShimmerAnimationWhileLoading_0 then
        return v2.createElement("ImageLabel", {
            Position = l_Position_0, 
            BorderSizePixel = l_BorderSizePixel_0, 
            BackgroundColor3 = l_BackgroundColor3_0, 
            BackgroundTransparency = l_BackgroundTransparency_0, 
            ScaleType = l_ScaleType_0, 
            ZIndex = l_ZIndex_0, 
            Size = l_Size_0, 
            Image = not not l_loaded_0 and l_Image_0 or l_loadingImage_0
        });
    else
        return v2.createElement(v4.Consumer, {
            render = function(v21)
                local l_ShimmerPanel_0 = v21.ShimmerPanel;
                return v2.createElement("Frame", {
                    Position = l_Position_0, 
                    BorderSizePixel = l_BorderSizePixel_0, 
                    BackgroundColor3 = l_ShimmerPanel_0.Color, 
                    BackgroundTransparency = l_ShimmerPanel_0.Transparency, 
                    ZIndex = l_ZIndex_0, 
                    Size = l_Size_0
                }, {
                    Shimmer = v2.createElement(v3, {
                        Size = UDim2.new(1, 0, 1, 0)
                    })
                });
            end
        });
    end;
end;
v7.shouldLoadImage = function(_, v24)
    local v25 = false;
    if v24 ~= nil then
        v25 = false;
        if v24 ~= "" then
            v25 = not v6[v24];
        end;
    end;
    return v25;
end;
v7.didUpdate = function(v26, v27)
    if v27.Image ~= v26.props.Image then
        v26:_loadImage();
    end;
end;
v7.didMount = function(v28)
    v28._isMounted = true;
    v28:_loadImage();
end;
v7.willUnmount = function(v29)
    v29._isMounted = false;
end;
v7._loadImage = function(v30)
    local l_Image_1 = v30.props.Image;
    if not v30:shouldLoadImage(l_Image_1) then
        if not (not v6[l_Image_1] or v30.state.loaded) then
            v30:setState({
                loaded = true
            });
        end;
        return ;
    else
        if v30.state.loaded then
            v30:setState({
                loaded = false
            });
        end;
        spawn(function()
            l_Decal_0.Texture = l_Image_1;
            l_ContentProvider_0:PreloadAsync({
                l_Decal_0
            });
            v6[l_Image_1] = true;
            if v30._isMounted then
                v30:setState({
                    loaded = true
                });
                if v30.props.onLoaded then
                    v30.props.onLoaded();
                end;
            end;
        end);
        return ;
    end;
end;
v7._mockPreloadDone = function(v32)
    v6[v32] = true;
end;
v7.isLoaded = function(v33)
    if not (v33 ~= v2.None and v33 ~= nil) or v33 == "" then
        return false;
    else
        return v6[v33] ~= nil;
    end;
end;
return v7;
