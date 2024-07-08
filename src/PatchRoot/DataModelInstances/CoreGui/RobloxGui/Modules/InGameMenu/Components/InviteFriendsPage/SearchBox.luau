local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Assets);
local v9 = require(l_Parent_0.Localization.withLocalization);
local v10 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v12 = l_Roact_0.PureComponent:extend("SearchBox");
v12.validateProps = l_t_0.strictInterface({
    Size = l_t_0.UDim2, 
    Position = l_t_0.UDim2, 
    AnchorPoint = l_t_0.Vector2, 
    searchUpdated = l_t_0.callback, 
    searchCleared = l_t_0.callback, 
    itemRef = l_t_0.optional(l_t_0.table)
});
v12.init = function(v13)
    v13.state = {
        searchText = ""
    };
end;
v12.renderWithSelectionCursor = function(v14, v15)
    return v9({
        searchPlaceholder = "CoreScripts.InGameMenu.InviteFriends.Search"
    })(function(v16)
        return l_withStyle_0(function(v17)
            local l_TextEmphasis_0 = v17.Theme.TextEmphasis;
            local l_Body_0 = v17.Font.Body;
            local v20 = nil;
            local v21 = nil;
            v20 = v14.state.searchText ~= "";
            v21 = 49;
            if v20 then
                v21 = v21 + 46;
            end;
            return l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Size = v14.props.Size, 
                Position = v14.props.Position, 
                AnchorPoint = v14.props.AnchorPoint, 
                Image = v8.Images.RoundedRect.Image, 
                ImageColor3 = v17.Theme.BackgroundUIContrast.Color, 
                ImageTransparency = v17.Theme.BackgroundUIContrast.Transparency, 
                ScaleType = v8.Images.RoundedRect.ScaleType, 
                SliceCenter = v8.Images.RoundedRect.SliceCenter
            }, {
                Border = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v8.Images.RoundedRectBorder.Image, 
                    SliceCenter = v8.Images.RoundedRectBorder.SliceCenter, 
                    ScaleType = v8.Images.RoundedRectBorder.ScaleType, 
                    ImageColor3 = v17.Theme.Divider.Color, 
                    ImageTransparency = v17.Theme.Divider.Transparency
                }), 
                SearchIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(0, 22, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v8.Images.SearchIcon, 
                    ImageColor3 = v17.Theme.IconEmphasis.Color
                }), 
                TextBox = l_Roact_0.createElement("TextBox", {
                    Size = UDim2.new(1, -v21, 1, 0), 
                    Position = UDim2.new(0, 44, 0, 0), 
                    PlaceholderText = "", 
                    Text = v14.state.searchText, 
                    ClearTextOnFocus = false, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextColor3 = l_TextEmphasis_0.Color, 
                    TextTransparency = l_TextEmphasis_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v17.Font.BaseSize, 
                    TextWrapped = false, 
                    SelectionImageObject = v15(l_CursorKind_0.InputFields), 
                    [l_Roact_0.Change.Text] = function(v22)
                        if v14.state.searchText ~= v22.Text then
                            v14:setState({
                                searchText = v22.Text
                            });
                            v14.props.searchUpdated(v22.Text);
                        end;
                    end, 
                    [l_Roact_0.Ref] = v14.props.itemRef
                }), 
                PlaceholderText = l_Roact_0.createElement(v10, {
                    themeKey = "TextEmphasis", 
                    fontKey = "Body", 
                    Text = v16.searchPlaceholder, 
                    Size = UDim2.new(1, -44, 1, 0), 
                    Position = UDim2.new(0, 44, 0, 0), 
                    TextTransparency = 0.5, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ZIndex = 2, 
                    Visible = v14.state.searchText == ""
                }), 
                ClearButton = l_Roact_0.createElement("TextButton", {
                    Size = UDim2.fromOffset(32, 32), 
                    Position = UDim2.new(1, -7, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Visible = v20, 
                    SelectionImageObject = v15(l_CursorKind_0.SmallPill), 
                    Selectable = true, 
                    [l_Roact_0.Event.Activated] = function()
                        v14:setState({
                            searchText = ""
                        });
                        v14.props.searchCleared();
                    end
                }, {
                    UIPadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 7), 
                        PaddingRight = UDim.new(0, 7), 
                        PaddingTop = UDim.new(0, 7), 
                        PaddingBottom = UDim.new(0, 7)
                    }), 
                    ClearImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Image = v8.Images.ClearIcon, 
                        ImageColor3 = v17.Theme.IconEmphasis.Color, 
                        Selectable = false
                    })
                })
            });
        end);
    end);
end;
v12.render = function(v23)
    return l_withSelectionCursorProvider_0(function(v24)
        return v23:renderWithSelectionCursor(v24);
    end);
end;
return v12;
