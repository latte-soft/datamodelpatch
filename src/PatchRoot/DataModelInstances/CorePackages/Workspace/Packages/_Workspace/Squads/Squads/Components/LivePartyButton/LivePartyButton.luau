local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Components.FacePile);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v7 = Color3.fromRGB(60, 100, 250);
local v8 = Color3.fromRGB(17, 19, 22);
local function v9()
end;
return function(v10)
    local v11 = l_useStyle_0();
    local v12 = 24 * math.min(6, #v10.users) - 10 * (math.min(6, #v10.users) - 1);
    return l_React_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 54), 
        BackgroundColor3 = v7, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        [l_React_0.Event.Activated] = v9
    }, {
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        Icon = l_React_0.createElement("ImageLabel", {
            Size = UDim2.fromOffset(32, 32), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/player.png", 
            ImageColor3 = Color3.fromRGB(255, 255, 255), 
            LayoutOrder = 1
        }), 
        Body = l_React_0.createElement("Frame", {
            Size = UDim2.new(1, -56 - v12, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TitleText = l_React_0.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v11.Theme.TextEmphasis, 
                fluidSizing = false, 
                fontStyle = v11.Font.CaptionHeader, 
                layoutOrder = 1, 
                lineHeight = 1, 
                size = UDim2.fromScale(1, 0), 
                text = not v10.isCurrentParty and "Live Party" or "You are in a party", 
                textWrapped = false, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left
            }), 
            ActionText = l_React_0.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v11.Theme.TextEmphasis, 
                fluidSizing = false, 
                fontStyle = v11.Font.Footer, 
                layoutOrder = 2, 
                lineHeight = 1, 
                size = UDim2.fromScale(1, 0), 
                text = not v10.isCurrentParty and "Tap to join" or "Return to party", 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textWrapped = false, 
                textXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        LivePartyFacePile = l_React_0.createElement(v1, {
            avatarSize = 24, 
            borderColor = v8, 
            borderWidth = 2, 
            faceCount = #v10.users, 
            facePileWidth = UDim.new(0, v12), 
            layoutOrder = 3, 
            overlapOffset = 10, 
            reverse = true, 
            users = v10.users
        })
    });
end;
