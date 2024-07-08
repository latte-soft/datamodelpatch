local v0 = require(script.Parent.Parent.dependencies);
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_Cell_0 = l_UIBlox_0.App.Table.Cell;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useDesignTokens_0 = v0.Style.useDesignTokens;
return function(v9)
    local v10 = l_useStyle_0();
    local v11 = l_useDesignTokens_0();
    local function v12()
        if v9.userInteractionEnabled then
            v9.onAccountSelection();
        end;
    end;
    local function v13()
        return l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v11.Global.Opacity_0
        }, {
            VerticalLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TitleText = if not not v9.titleContent and v9.titleContent ~= "" then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v9.titleContent, 
                fontStyle = v10.Font.Header2, 
                colorStyle = v10.Theme.TextEmphasis, 
                layoutOrder = 0
            }) else nil, 
            SubtitleText = if not not v9.subtitleContent and v9.subtitleContent ~= "" then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v9.subtitleContent, 
                fontStyle = v10.Font.Body, 
                colorStyle = v10.Theme.TextEmphasis, 
                layoutOrder = 1
            }) else nil
        });
    end;
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v11.Global.Size_800), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v10.Theme.BackgroundDefault.Color, 
        BorderColor3 = v10.Theme.BackgroundDefault.Color
    }, {
        Cell = l_React_0.createElement(l_Cell_0, {
            BorderColor3 = v10.Theme.BackgroundDefault.Color, 
            onActivated = v12, 
            head = (function()
                return l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v11.Global.Opacity_0, 
                    BorderColor3 = v10.Theme.BackgroundDefault.Color
                }, {
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    Layout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v11.Global.Space_150)
                    }), 
                    AvatarThumbnail = v9.renderImage(), 
                    Names = v13()
                });
            end)(), 
            tail = (function()
                if v9.iconKey and v9.iconKey ~= nil then
                    return (l_React_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromOffset(28, 28), 
                        Image = l_Images_0[v9.iconKey], 
                        ImageColor3 = v9.iconColor or v10.Theme.Success.Color, 
                        BackgroundTransparency = 1
                    }));
                else
                    return l_React_0.createElement("Frame", {
                        BorderSizePixel = 0
                    });
                end;
            end)(), 
            userInteractionEnabled = v9.userInteractionEnabled, 
            size = UDim2.new(1, 0, 0, v11.Global.Size_800)
        })
    });
end;
