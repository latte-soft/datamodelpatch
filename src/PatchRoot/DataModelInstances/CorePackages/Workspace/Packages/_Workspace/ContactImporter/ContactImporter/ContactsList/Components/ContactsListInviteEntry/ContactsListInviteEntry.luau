local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_React_0 = v1.React;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_NativeUtilProtocol_0 = v1.NativeUtilProtocol;
local l_SMSProtocol_0 = v1.SMSProtocol;
local l_Dash_0 = v1.Dash;
local l_useStyle_0 = v1.useStyle;
local l_useLocalization_0 = v1.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagContactsListEntryUpdatedTruncationFix);
local v16 = require(script.Parent.sendInviteLink);
local v17 = {
    nativeUtilProtocol = l_NativeUtilProtocol_0.default, 
    smsProtocol = l_SMSProtocol_0.default
};
ContactsListInviteEntry = function(v18)
    local v19 = l_Dash_0.join(v17, v18);
    local v20 = l_useLocalization_0({
        invite = v8.INVITE_BUTTON_TEXT
    });
    local v21 = l_useStyle_0();
    local v22 = v16({
        address = v19.phoneNumber, 
        deviceContactId = v19.deviceContactId, 
        nativeUtilProtocol = l_NativeUtilProtocol_0.default, 
        smsProtocol = l_SMSProtocol_0.default
    });
    local v23, v24 = l_React_0.useState(0);
    return l_Roact_0.createElement("Frame", {
        Name = v19.deviceContactId, 
        Size = UDim2.new(1, 0, 0, 72), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        entryContent = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 26), 
                PaddingBottom = UDim.new(0, 26)
            }), 
            contactNameLabel = if not v15() then l_Roact_0.createElement(l_StyledTextLabel_0, {
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v21.Theme.TextEmphasis, 
                fontStyle = v21.Font.Header2, 
                lineHeight = 1, 
                text = v19.contactName, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Bottom
            }) else l_Roact_0.createElement(l_StyledTextLabel_0, {
                size = UDim2.new(1, v23, 0, 20), 
                colorStyle = v21.Theme.TextEmphasis, 
                fontStyle = v21.Font.Header2, 
                lineHeight = 1, 
                text = v19.contactName, 
                fluidSizing = false, 
                richText = false, 
                textWrapped = false, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Bottom, 
                textTruncate = Enum.TextTruncate.AtEnd
            }), 
            sendInviteButton = if v19.hasSentRequest then l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                position = UDim2.new(1, -1, 0.5, 0), 
                anchorPoint = Vector2.new(1, 0.5), 
                standardSize = l_StandardButtonSize_0.XSmall, 
                isDisabled = true, 
                text = v20.invite, 
                onActivated = l_Dash_0.noop, 
                [l_React_0.Change.AbsoluteSize] = function(v25)
                    if v15() then
                        v24(0 - (v25.AbsoluteSize.X + 10));
                    end;
                end
            }) else l_Roact_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                position = UDim2.new(1, -1, 0.5, 0), 
                anchorPoint = Vector2.new(1, 0.5), 
                standardSize = l_StandardButtonSize_0.XSmall, 
                fitContent = true, 
                text = v20.invite, 
                isDisabled = v22.isLoading, 
                onActivated = v22.sendInvite, 
                [l_React_0.Change.AbsoluteSize] = function(v26)
                    if v15() then
                        v24(0 - (v26.AbsoluteSize.X + 10));
                    end;
                end
            })
        }), 
        divider = if not v19.hasDivider then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v21.Theme.Divider.Color, 
            BackgroundTransparency = v21.Theme.Divider.Transparency
        })
    });
end;
return ContactsListInviteEntry;
