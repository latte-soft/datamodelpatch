local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useNavigation_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local v7 = require(script.Parent.SelectableTextLabel);
local v8 = UDim.new(0, 24);
local v9 = UDim.new(0, 8);
local v10 = UDim.new(0, 2);
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useStyle_0 = v2.Core.Style.useStyle;
local function v17(v16)
    return v16.ScreenSize;
end;
return function(v18)
    local v19 = l_useStyle_0();
    local v20 = l_useSelector_0(v17);
    local v21 = l_useNavigation_0();
    local v22 = v1.useMemo(function()
        return l_UrlBuilder_0.virtualevents.appsflyer({
            eventId = v18.virtualEventId
        });
    end, {
        v18.virtualEventId
    });
    local v23 = l_useLocalization_0({
        title = "Feature.VirtualEvents.ShareModalTitle", 
        body = "Feature.VirtualEvents.ShareModalBody", 
        copyLink = "Feature.VirtualEvents.ShareModalLinkCopy", 
        callToAction = "Feature.VirtualEvents.ShareModalCallToAction"
    });
    return v1.createElement(l_PartialPageModal_0, {
        title = v23.title, 
        screenSize = v20, 
        contentPadding = v8, 
        onCloseClicked = v1.useCallback(function()
            v21.goBack();
            if v18.onClose then
                v18.onClose();
            end;
        end, {
            v18, 
            v21
        })
    }, {
        Wrapper = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v8
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = v8
            }), 
            Body = v1.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v23.body, 
                fontStyle = v19.Font.Body, 
                colorStyle = v19.Theme.TextMuted, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fluidSizing = false
            }), 
            Deeplink = v1.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = v8
                }), 
                Field = v1.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.fromScale(0.8, 0) - UDim2.fromOffset(v8.Offset, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundColor3 = v19.Theme.UIMuted.Color
                }, {
                    Corner = v1.createElement("UICorner", {
                        CornerRadius = v10
                    }), 
                    Border = v1.createElement("UIStroke", {
                        Color = v19.Theme.UIDefault.Color
                    }), 
                    Padding = v1.createElement("UIPadding", {
                        PaddingTop = v9, 
                        PaddingRight = v9, 
                        PaddingBottom = v9, 
                        PaddingLeft = v9
                    }), 
                    Label = v1.createElement(v7, {
                        fontStyle = v19.Font.Body, 
                        colorStyle = v19.Theme.TextMuted, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Text = v22
                    })
                }), 
                Action = v1.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    layoutOrder = 2, 
                    text = v23.copyLink, 
                    size = UDim2.new(0.2, 0, 0, 32), 
                    onActivated = v1.useCallback(function()
                        if v18.onCopy then
                            v18.onCopy(v22);
                        end;
                    end, {
                        v22
                    })
                })
            })
        })
    });
end;
