local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Util.debounce);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Cryo);
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v9 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_mapTypographyVariantToFontEnum_0 = require(l_CorePackages_0.Workspace.Packages.Style).mapTypographyVariantToFontEnum;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
return function(v13)
    local v15 = l_useDesignTokens_0(function(v14)
        return {
            textStyles = {
                Font = l_mapTypographyVariantToFontEnum_0(v14.Semantic.Typography.Body), 
                TextSize = v14.Global.FontSize_200, 
                TextColor3 = v14.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v14.Semantic.Color.Text.Emphasis.Transparency
            }, 
            Search = v14.LuaApps.Search, 
            cornerRadius = v14.Semantic.Radius.Small, 
            leftPadding = v14.Global.Space_200, 
            backgroundColor = v14.Semantic.Color.Background.Default.Color3, 
            placeholderColor = v14.Semantic.Color.Text.Default.Color3, 
            iconColor = v14.Semantic.Color.Icon.Default.Color3, 
            iconTransparency = v14.Semantic.Color.Icon.Default.Transparency
        };
    end);
    local v16 = v13.placeholderText or v9({
        searchPlaceholder = "CommonUI.Controls.Action.Search"
    }).searchPlaceholder;
    local v17 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset);
    local l_onSubmitSearch_0 = v13.onSubmitSearch;
    return v3.createElement("Frame", {
        Size = UDim2.new(v15.Search.SearchHeadingScale, 0, 0, v15.Search.SearchBoxHeight), 
        Position = UDim2.fromScale(1 - v15.Search.SearchHeadingScale, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v13.layoutOrder
    }, {
        SearchBox = v3.createElement("TextBox", v5.Dictionary.join(v15.textStyles, {
            ClearTextOnFocus = false, 
            Position = UDim2.new(0, 0, 0, 0), 
            PlaceholderText = v16, 
            Size = UDim2.new(1, 0, 0, v15.Search.SearchBoxHeight), 
            Text = "", 
            BackgroundColor3 = v15.backgroundColor, 
            PlaceholderColor3 = v15.placeholderColor, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            SelectionImageObject = v17, 
            [v3.Event.Focused] = v13.onFocused, 
            [v3.Event.FocusLost] = l_onSubmitSearch_0, 
            [v3.Change.Text] = v2(function(v19)
                l_onSubmitSearch_0(v19);
            end, 0.25), 
            ref = v13.textBoxRef
        }), {
            SearchIcon = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                ImageColor3 = v15.iconColor, 
                ImageTransparency = v15.iconTransparency, 
                Position = UDim2.new(0, -v15.Search.SearchBoxIconSize - v15.leftPadding, 0.5, 0), 
                Size = UDim2.fromOffset(v15.Search.SearchBoxIconSize, v15.Search.SearchBoxIconSize), 
                Image = l_Images_0["icons/common/search"]
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, v15.cornerRadius)
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v15.Search.SearchBoxIconPaddingVertical), 
                PaddingLeft = UDim.new(0, v15.Search.SearchBoxIconPaddingLeft + v15.leftPadding), 
                PaddingRight = UDim.new(0, v15.Search.SearchBoxIconPaddingRight), 
                PaddingTop = UDim.new(0, v15.Search.SearchBoxIconPaddingVertical)
            })
        })
    });
end;
