local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.UIBlox);
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local l_Dark_0 = v3.App.Style.Constants.ThemeName.Dark;
local v6 = require(l_CorePackages_0.Packages.Promise);
local v7 = require(script.Parent.SelfViewTooltipFTUX);
return function(v8)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "SelfViewTooltipOnOpenGui";
    l_ScreenGui_0.DisplayOrder = -1;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v10 = v1.mount(v1.createElement(l_AppStyleProvider_0, {
        style = {
            themeName = l_Dark_0
        }
    }, {
        frame = v1.createElement("Frame", {
            Position = v8.position, 
            Size = v8.size, 
            BackgroundTransparency = 0, 
            AnchorPoint = v8.anchorPoint, 
            Visible = false
        }, {
            aspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = v8.aspectRatio, 
                AspectType = "ScaleWithParentSize", 
                DominantAxis = "Width"
            }), 
            sizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = v8.maxSize, 
                MinSize = v8.minSize
            }), 
            bottomButtonsMock = v1.createElement("Frame", {
                Position = v8.bottomButtonsFramePosition, 
                Size = v8.bottomButtonsFrameSize, 
                Visible = false, 
                BackgroundTransparency = 0
            }, {
                tooltip = v1.createElement(v7, {
                    fallbackText = v8.fallbackText, 
                    translationKey = v8.translationKey, 
                    tooltipLifetime = v8.tooltipLifetime
                })
            })
        })
    }), l_ScreenGui_0, "SelfViewTooltipOnOpenGui");
    local function v11()
        pcall(function()
            v1.unmount(v10);
        end);
    end;
    v6.delay(v8.tooltipLifetime + 5):andThen(function()
        pcall(function()
            v1.unmount(v10);
        end);
    end);
    return {
        instance = v10, 
        unmount = v11
    };
end;
