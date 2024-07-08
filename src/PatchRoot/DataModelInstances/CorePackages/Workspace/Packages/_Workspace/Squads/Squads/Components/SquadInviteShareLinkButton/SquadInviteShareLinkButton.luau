local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_React_0 = v2.React;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_UIBlox_0 = v2.UIBlox;
local l_ExternalContentSharingProtocol_0 = v2.ExternalContentSharingProtocol;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v11 = require(l_script_FirstAncestor_0.Common.Constants);
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
local v13 = Vector2.new(28, 28);
return function(v14)
    local v15, v16 = l_React_0.useState(false);
    local v17, v18 = l_React_0.useState(false);
    local v19 = l_useStyle_0();
    local v20 = l_useLocalization_0({
        shareSquadLinkText = "Feature.Squads.Label.ShareInviteLinkWithFriends", 
        copiedText = "Feature.SocialShare.Label.Copied"
    });
    return l_Roact_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 62), 
        Active = not v15 and not v17, 
        AutoButtonColor = not v15 and not v17, 
        BackgroundColor3 = v19.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = (v15 or v17) and 0.5 or 0, 
        LayoutOrder = v14.layoutOrder, 
        [l_Roact_0.Event.Activated] = function()
            v16(true);
            if l_ExternalContentSharingProtocol_0 then
                l_ExternalContentSharingProtocol_0:shareUrl({
                    url = v14.shareLinkUrl, 
                    context = ""
                });
                if l_isSubjectToDesktopPolicies_0() then
                    v18(true);
                    delay(1, function()
                        v18(false);
                    end);
                end;
            end;
            v16(false);
        end
    }, {
        UIPadding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12)
        }), 
        UIStroke = l_Roact_0.createElement("UIStroke", {
            Color = v19.Theme.Divider.Color, 
            Thickness = 1, 
            Transparency = 0.8
        }), 
        UICorner = l_Roact_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        ShareIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(v13.X, v13.Y), 
            BackgroundTransparency = 1, 
            Image = l_Images_0[v11.SHARE_ICON], 
            ImageTransparency = (v15 or v17) and 0.5 or 0, 
            LayoutOrder = 0
        }), 
        TextContainer = l_Roact_0.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            TextContainerLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CopiedText = if not v17 then nil else l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, -v13.X - 12, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = v19.Font.Header2.Font, 
                Text = v20.copiedText, 
                TextColor3 = v19.Theme.TextEmphasis.Color, 
                TextSize = 16, 
                TextTransparency = 0.5, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Title = if v17 then nil else l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, -v13.X - 12, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = v19.Font.Header2.Font, 
                LayoutOrder = 0, 
                Text = v20.shareSquadLinkText, 
                TextColor3 = v19.Theme.TextEmphasis.Color, 
                TextSize = 16, 
                TextTransparency = (v15 or v17) and 0.5 or 0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Link = if v17 then nil else l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, -v13.X - 12, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = v19.Font.CaptionBody.Font, 
                LayoutOrder = 1, 
                Text = v14.shareLinkUrl, 
                TextColor3 = v19.Theme.TextDefault.Color, 
                TextSize = 12, 
                TextTransparency = (v15 or v17) and 0.5 or 0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
