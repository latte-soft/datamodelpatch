local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local _ = require(l_script_FirstAncestor_0.types);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_EmojiTextLabel_0 = v2.Core.Text.EmojiTextLabel;
local l_Emoji_0 = v2.App.Emoji.Enum.Emoji;
return function(v7)
    local v8 = l_useStyle_0();
    local v9 = if not v7.host.hasVerifiedBadge then nil else l_Emoji_0.Verified;
    local v10, v11 = v1.useState(0);
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UserImage = v1.createElement("ImageLabel", {
            LayoutOrder = 1, 
            BackgroundColor3 = v8.Theme.Badge.Color, 
            BackgroundTransparency = v8.Theme.Badge.Transparency, 
            Image = string.format("rbxthumb://type=%s&id=%i&w=150&h=150", v7.host.hostType == "group" and "GroupIcon" or "AvatarHeadShot", v7.host.hostId), 
            Size = UDim2.fromOffset(v10, v10)
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        EmojiName = v1.createElement(l_EmojiTextLabel_0, {
            Text = v7.host.hostName, 
            LayoutOrder = 2, 
            emoji = v9, 
            fontStyle = v8.Font.Header2, 
            colorStyle = v8.Theme.TextEmphasis, 
            [v1.Change.AbsoluteSize] = v1.useCallback(function(v12)
                v11(v12.TextSize);
            end, {
                v11
            })
        }), 
        EmojiToArrowMargin = if not v9 then nil else v1.createElement("Frame", {
            LayoutOrder = 3, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v10 - 4, 0)
        })
    });
end;
