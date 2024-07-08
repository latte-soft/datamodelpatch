local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.withLocalization);
local v4 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v5 = require(l_Modules_0.LuaApp.Components.GenericIconButtonUIBlox);
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local v7 = require(l_Modules_0.Common.RoactRodux);
local v8 = UDim2.new(0, 44, 0, 44);
local v9 = UDim2.new(0, 37, 0, 37);
local v10 = v2.PureComponent:extend("SwapToSourceButton");
v10.init = function(v11)
    v11.onActivated = function()
        if v11.props.onSwapToSource ~= nil then
            v11.props.onSwapToSource();
        end;
    end;
end;
v10.render = function(v12)
    local l_layoutOrder_0 = v12.props.layoutOrder;
    local l_padding_0 = v12.props.padding;
    local l_font_0 = v12.props.font;
    local l_textColor_0 = v12.props.textColor;
    local l_textSize_0 = v12.props.textSize;
    local l_showSource_0 = v12.props.showSource;
    return v3({
        swapToSourceText = "Feature.GameDetails.Action.SwapToSource", 
        swapToTranslatedText = {
            "Feature.GameDetails.Action.SwapToTranslation"; 
            userLanguage = v12.props.nativeLocaleName
        }
    })(function(v19)
        return v2.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 20, 0, 0), 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_padding_0 / 2)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2 * l_padding_0), 
                PaddingBottom = UDim.new(0, 2 * l_padding_0), 
                PaddingLeft = UDim.new(0, l_padding_0), 
                PaddingRight = UDim.new(0, l_padding_0)
            }), 
            SwapToSourceButton = v2.createElement(v5, {
                LayoutOrder = 1, 
                Size = v8, 
                iconImage = l_Images_0["icons/common/refresh"], 
                iconSize = v9, 
                onActivated = v12.onActivated, 
                isLoading = false, 
                isDisabled = false
            }), 
            SwapToSourceTextLabel = v2.createElement(v4, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = not not l_showSource_0 and v19.swapToTranslatedText or v19.swapToSourceText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = l_font_0, 
                TextSize = l_textSize_0, 
                TextColor3 = l_textColor_0
            })
        });
    end);
end;
return (v7.connect(function(v20, _)
    return {
        nativeLocaleName = v20.NativeLocaleName or ""
    };
end)(v10));
