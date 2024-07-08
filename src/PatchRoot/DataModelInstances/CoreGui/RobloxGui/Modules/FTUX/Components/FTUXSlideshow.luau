local v0 = require(game:GetService("CorePackages").Packages.React);
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Resources.FTUXSlideshowData);
local v3 = require(l_Parent_0.Resources.FTUXConstants);
local _ = require(l_Parent_0.Enums.PlatformEnum);
local v5 = require(l_Parent_0.Components.Slideshow.Header);
local v6 = require(l_Parent_0.Components.Slideshow.Stepper);
local v7 = require(l_Parent_0.Components.Slideshow.Title);
local v8 = require(l_Parent_0.Components.Slideshow.Description);
local v9 = require(l_Parent_0.Components.Slideshow.EndItem);
local v10 = require(l_Parent_0.Events.EventHandler);
return function(v11)
    local v12, v13 = v0.useState(1);
    local l_platform_0 = v11.platform;
    local v15 = v2[l_platform_0];
    local l_PanelConstants_0 = v3[l_platform_0].PanelConstants;
    local v17 = v15[v12];
    local l_CONTENT_HEIGHT_RATIO_0 = l_PanelConstants_0.CONTENT_HEIGHT_RATIO;
    local l_FOOTER_HEIGHT_RATIO_0 = l_PanelConstants_0.FOOTER_HEIGHT_RATIO;
    local v20 = l_PanelConstants_0.CONTENT_PADDING / l_PanelConstants_0.SLIDESHOW_FRAME_WIDTH;
    local v21 = 1 - 2 * v20;
    local v22 = v0.useCallback(function()
        v13(v12 + 1);
    end, {
        v12
    });
    v0.useEffect(function()
        v10.StartEvents(l_platform_0, v12, v22);
        return function()
            v10.StopEvents(l_platform_0, v12);
        end;
    end, {
        v12
    });
    return v0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        UICorner = v0.createElement("UICorner", {
            CornerRadius = UDim.new(0.05, 0)
        }), 
        SlideshowLayout = v0.createElement("UIListLayout", {
            Padding = UDim.new(0.05, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v0.createElement(v5, {
            platform = l_platform_0
        }), 
        ContentFrame = v0.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, l_CONTENT_HEIGHT_RATIO_0, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        }, {
            Content = v0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(v21, 0, 1, 0), 
                Position = UDim2.new(v20, 0, 0, 0)
            }, {
                ContentLayout = v0.createElement("UIListLayout", {
                    Padding = UDim.new(0.05, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Title = v0.createElement(v7, {
                    platform = l_platform_0, 
                    currentIndex = v12
                }), 
                Description = v0.createElement(v8, {
                    platform = l_platform_0, 
                    currentIndex = v12
                }), 
                ImageFrame = v0.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1.2, 0, 0.4, 0), 
                    Position = UDim2.new(0, 0, 0, 0)
                }, {
                    Image = v0.createElement("ImageLabel", {
                        Image = v17.image, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        LayoutOrder = 3, 
                        ScaleType = Enum.ScaleType.Fit
                    })
                })
            })
        }), 
        FooterFrame = v0.createElement("Frame", {
            LayoutOrder = 3, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, l_FOOTER_HEIGHT_RATIO_0, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        }, {
            Footer = v0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(v21, 0, 1, 0), 
                Position = UDim2.new(v20, 0, 0, 0)
            }, {
                ContentLayout = v0.createElement("UIListLayout", {
                    Padding = v12 ~= #v15 and UDim.new(0.2, 0) or UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Stepper = v0.createElement(v6, {
                    layoutOrder = 1, 
                    numberActivated = v12, 
                    numberOfSteps = #v15
                }, {}), 
                EndItem = v0.createElement(v9, {
                    platform = l_platform_0, 
                    currentIndex = v12, 
                    increaseCurrentIndex = v22
                })
            })
        })
    });
end;
