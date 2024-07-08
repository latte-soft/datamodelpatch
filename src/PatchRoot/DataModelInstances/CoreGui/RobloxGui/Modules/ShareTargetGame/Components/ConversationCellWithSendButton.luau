local v0 = require(game:GetService("CorePackages").Workspace.Packages.AppChat);
local v1 = require(script:FindFirstAncestor("ShareTargetGame").dependencies);
local l_Roact_0 = v1.Roact;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_Text_0 = v1.Text;
local l_UIBlox_0 = v1.UIBlox;
local v6 = if not l_SocialLibraries_0.Flags.getFFlagDeprecatedSocialLibrariesCells() then l_SocialLibraries_0.Components.Cells.ConversationCell else v0.Components.Cells.ConversationCell;
local v7 = require(script.Parent.SendButton);
return function(v8)
    local v9 = v8.failedText or "";
    local v10 = v8.sendingText or "";
    local v11 = v8.sendText or "";
    local v12 = v8.sentText or "";
    local v13 = v8.isLoading or false;
    local l_conversation_0 = v8.conversation;
    local l_onSendButtonActivated_0 = v8.onSendButtonActivated;
    return l_UIBlox_0.Style.withStyle(function(v16)
        local l_Font_0 = v16.Font;
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = v16.Theme.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = v16.Theme.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v8.Visible, 
            LayoutOrder = v8.LayoutOrder
        }, {
            content = l_Roact_0.createElement(v6, {
                style = v16, 
                conversation = l_conversation_0, 
                subTitleText = v8.subTitleText, 
                secondaryTitleText = v8.secondaryTitleText, 
                childWidth = ((l_Text_0.GetTextWidth(v11, l_Font_0.CaptionBody.Font, l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize) + 14) + 24) + 12, 
                Size = UDim2.new(1, 0, 1, 0), 
                isLoading = v13
            }, {
                rightAlignedComponent = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    padding = l_Roact_0.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    layout = l_Roact_0.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    sendButton = l_Roact_0.createElement(v7, {
                        sendText = v11, 
                        sentText = v12, 
                        sendingText = v10, 
                        sentStatus = v8.sentStatus, 
                        failedText = v9, 
                        isLoading = v13, 
                        conversation = l_conversation_0, 
                        onActivated = function()
                            return l_onSendButtonActivated_0(l_conversation_0);
                        end
                    })
                })
            })
        });
    end);
end;
