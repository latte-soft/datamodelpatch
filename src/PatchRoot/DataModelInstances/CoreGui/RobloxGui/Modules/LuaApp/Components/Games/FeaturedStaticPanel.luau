local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v4 = require(l_CorePackages_0.Packages.Dash);
local l_ExperienceFooter_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).ExperienceFooter;
local v6 = require(l_Modules_0.LuaApp.Components.Common.ItemTileCreatorName);
return function(v7)
    local v8 = l_useStyle_0();
    local l_Font_0 = v8.Font;
    local l_Theme_0 = v8.Theme;
    local v11 = v7.padding or 0;
    local v12 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v11), 
            PaddingLeft = if not v7.hasBackground then nil else UDim.new(0, v11), 
            PaddingRight = if not v7.hasBackground then nil else UDim.new(0, v11), 
            PaddingBottom = if not v7.hasBackground then nil else UDim.new(0, v11)
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v11)
        }), 
        Title = if not not v7.title and string.len(v7.title) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v12), 
            BackgroundTransparency = 1, 
            Text = v7.title, 
            Font = l_Font_0.Header2.Font, 
            TextSize = v12, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }) else nil, 
        Footer = v2.createElement(l_ExperienceFooter_0, (v4.join(v7.footerData, {
            size = UDim2.new(0, 132, 0, v12), 
            layoutOrder = 2, 
            isStatsOnly = true
        }))), 
        CreatorName = if not v7.creatorName then nil else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v12), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Text = v2.createElement(v6, {
                name = v7.creatorName, 
                hasVerifiedBadge = v7.creatorVerified, 
                creatorId = v7.creatorId
            })
        }), 
        Description = if not not v7.description and string.len(v7.description) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v12 * 3), 
            BackgroundTransparency = 1, 
            Text = v7.description, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 4
        }) else nil
    });
end;
