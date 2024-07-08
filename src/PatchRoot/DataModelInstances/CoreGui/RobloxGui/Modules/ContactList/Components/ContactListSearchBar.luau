local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.ContactList.dependencies);
local l_UIBlox_0 = v5.UIBlox;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local v12 = nil;
local v13 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v13 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v12 = v5.Hooks.useLocalization;
end;
local v14 = {
    searchBarHeight = 36, 
    searchText = ""
};
return function(v15)
    local v16 = v2.Dictionary.join(v14, v15);
    local v17 = l_useStyle_0();
    local l_Font_0 = v17.Font;
    local l_Theme_0 = v17.Theme;
    local v20, v21 = v3.useState(false);
    local v24 = v3.useCallback(function(v22, v23)
        if v23 == "Text" then
            v16.onSearchChanged(v22.Text);
        end;
    end, {
        v16.onSearchChanged
    });
    local _ = nil;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -48, 0, v16.searchBarHeight), 
        BackgroundColor3 = l_Theme_0.UIMuted.Color, 
        BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
        LayoutOrder = v16.layoutOrder
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        UIStroke = v3.createElement("UIStroke", {
            Color = l_Colors_0.Pumice, 
            Thickness = 1
        }), 
        SearchImage = v3.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/search_small"], 
            ImageColor3 = if not v20 then Color3.fromHex("#696A6B") else l_Colors_0.White, 
            Size = UDim2.fromOffset(16, 16)
        }), 
        TextBox = v3.createElement("TextBox", {
            Size = UDim2.new(1, -20, 1, 0), 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            ClipsDescendants = true, 
            Font = l_Font_0.Body.Font, 
            LayoutOrder = 2, 
            PlaceholderColor3 = Color3.fromHex("#696A6B"), 
            PlaceholderText = if not l_GetFFlagIrisUseLocalizationProvider_0() then v13:FormatByKey("Feature.Call.Prompt.SearchFriends") else v12({
                searchFriendsLabel = "Feature.Call.Prompt.SearchFriends"
            }).searchFriendsLabel, 
            Text = v16.searchText, 
            TextColor3 = l_Colors_0.White, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v3.Event.Changed] = v24, 
            [v3.Event.Focused] = function()
                v21(true);
                v16.onFocused();
            end, 
            [v3.Event.FocusLost] = function()
                v21(false);
            end
        })
    });
end;
