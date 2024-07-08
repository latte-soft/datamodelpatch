local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_CallbackInputBox_0 = l_SocialLibraries_0.Components.CallbackInputBox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useStyle_0 = v1.useStyle;
local l_useLocalization_0 = v1.useLocalization;
local v13 = l_Images_0["icons/common/search"];
local v14 = l_Images_0["icons/actions/edit/clear_small"];
ContactsListSearchBar = function(v15)
    local v16 = l_useLocalization_0({
        searchContacts = v10.SEARCH_CONTACTS
    });
    local v17 = l_useStyle_0();
    local v18, v19 = l_React_0.useState(false);
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = v17.Theme.BackgroundMuted.Transparency, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v17.Theme.BackgroundMuted.Color, 
        Size = UDim2.new(1, 0, 0, v15.height), 
        LayoutOrder = v15.layoutOrder
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        BorderRadius = l_Roact_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        Border = l_React_0.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = if not v18 then v17.Theme.Divider.Color else v17.Theme.SecondaryOnHover.Color, 
            Transparency = if not v18 then v17.Theme.Divider.Transparency else v17.Theme.SecondaryOnHover.Transparency, 
            Thickness = 1
        }), 
        padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 13), 
            PaddingRight = UDim.new(0, 13)
        }), 
        icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            Image = v13, 
            ImageColor3 = v17.Theme.IconEmphasis.Color, 
            LayoutOrder = 1
        }), 
        searchBarWrapper = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -l_IconSize_0.Small, 0, v15.height)
        }, {
            searchBar = l_Roact_0.createElement(l_CallbackInputBox_0, {
                clearIcon = v14, 
                clearIconColor3 = v17.Theme.IconEmphasis.Color, 
                clearIconTransparency = v17.Theme.IconEmphasis.Transparency, 
                clearButtonSize = l_IconSize_0.Small, 
                clearButtonDisabled = false, 
                focusChangedCallback = v19, 
                inputTextColor3 = v17.Theme.TextEmphasis.Color, 
                inputTextTransparency = v17.Theme.TextEmphasis.Transparency, 
                placeholderText = v16.searchContacts, 
                placeholderTextColor3 = v17.Theme.TextMuted.Color, 
                placeholderTextTransparency = v17.Theme.TextMuted.Transparency, 
                inputTextXAlignment = Enum.TextXAlignment.Left, 
                textChangedCallback = v15.textChangeCallback
            })
        })
    });
end;
return ContactsListSearchBar;
