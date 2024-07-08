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
    local v11 = math.max(v7.contentRows or 1, 2);
    local v12 = math.max(0, v11 - 2);
    local v13 = v11 > 3;
    local v14 = v11 == 2;
    local v15 = v7.padding or 0;
    local v16 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v17 = v2.createElement(l_ExperienceFooter_0, (v4.join(v7.footerData, {
        size = UDim2.new(0, 132, 0, v16), 
        position = if v13 or v14 then UDim2.new(1, 0, 0, 0) else nil, 
        anchorPoint = if v13 or v14 then Vector2.new(1, 0) else nil, 
        isStatsOnly = true
    })));
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = if not v7.hasBackground then nil else UDim.new(0, v15), 
            PaddingRight = UDim.new(0, v15), 
            PaddingTop = UDim.new(0, (math.max(v15, 8))), 
            PaddingBottom = UDim.new(0, v15)
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        TitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Title = if not not v7.title and string.len(v7.title) > 0 then v2.createElement("TextLabel", {
                Size = UDim2.new(1, not v13 and 0 or -132, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v7.title, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v16, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }) else nil, 
            InlineFooter = if not v13 then nil else v17
        }), 
        SubtitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            CreatorName = if not v7.creatorName then nil else v2.createElement("Frame", {
                Size = UDim2.new(1, not v14 and 0 or -132, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Text = v2.createElement(v6, {
                    name = v7.creatorName, 
                    hasVerifiedBadge = v7.creatorVerified, 
                    creatorId = v7.creatorId
                })
            }), 
            InlineFooter = if not v14 then nil else v17
        }), 
        BodyFrame = if v12 > 0 then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v16 * v12), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = 3
        }, {
            ExperienceInfo = if v12 > 1 then v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v7.description, 
                Font = l_Font_0.Body.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }) else v17
        }) else nil
    });
end;
