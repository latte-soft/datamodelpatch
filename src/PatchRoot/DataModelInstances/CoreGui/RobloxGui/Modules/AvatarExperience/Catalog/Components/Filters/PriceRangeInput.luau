local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(script.Parent.FilterTextBox);
local v10 = {
    minPrice = v8.MinPriceFilter, 
    maxPrice = v8.MaxPriceFilter
};
return function(v11)
    local v12 = v2.join(v10, v11);
    local v13 = l_useStyle_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local v16 = l_useLocalization_0({
        min = "Feature.Catalog.Label.Filter.PriceMin", 
        max = "Feature.Catalog.Label.Filter.PriceMax"
    });
    local v17 = UDim.new(0.5, -13);
    local v19 = v3.useCallback(function(v18)
        if v12.setMinPrice then
            v12.setMinPrice(tonumber(v18) or v8.MinPriceFilter);
        end;
    end, {
        v12.setMinPrice
    });
    local v21 = v3.useCallback(function(v20)
        if v12.setMaxPrice then
            v12.setMaxPrice(tonumber(v20) or v8.MaxPriceFilter);
        end;
    end, {
        v12.setMaxPrice
    });
    local v22 = v3.useRef(nil);
    local v23 = v3.useRef(nil);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, -12, 0, 30)
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        MinPriceTextBox = v3.createElement(v9, {
            text = if v8.MinPriceFilter < v12.minPrice then tostring(v12.minPrice) else "", 
            placeholderText = v16.min, 
            onTextChanged = v19, 
            onFocused = v12.onFocused, 
            width = v17, 
            layoutOrder = 1, 
            textBoxRef = v22, 
            NextSelectionRight = v23
        }), 
        Dash = v3.createElement(l_StyledTextLabel_0, {
            size = UDim2.fromOffset(26, 30), 
            text = "\226\128\147", 
            colorStyle = {
                Color = l_Theme_0.TextEmphasis.Color, 
                Transparency = l_Theme_0.TextEmphasis.Transparency
            }, 
            fontStyle = l_Font_0.Header2, 
            textXAlignment = Enum.TextXAlignment.Center, 
            layoutOrder = 2
        }), 
        MaxPriceTextBox = v3.createElement(v9, {
            text = if v12.maxPrice < v8.MaxPriceFilter then tostring(v12.maxPrice) else "", 
            placeholderText = v16.max, 
            onTextChanged = v21, 
            onFocused = v12.onFocused, 
            width = v17, 
            layoutOrder = 3, 
            textBoxRef = v23, 
            NextSelectionLeft = v22
        })
    });
end;
