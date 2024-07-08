local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v10 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v11 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v12 = v2.PureComponent:extend("UserAgreementsSecondPrompt");
v12.validateProps = v5.strictInterface({
    agreements = v5.array(v5.strictInterface({
        id = v5.string, 
        agreementType = v5.string, 
        clientType = v5.string, 
        displayUrl = v5.string, 
        regulationType = v5.string
    })), 
    agreementsListItems = v5.table, 
    screenSize = v5.Vector2, 
    showFirstPrompt = v5.callback
});
v12.init = function(v13)
    v13.onAck = function()
        v13.props.showFirstPrompt(v13.props.agreements);
    end;
    v13.renderMiddleContent = function(v14, v15)
        local l_Theme_0 = v15.Theme;
        local l_Font_0 = v15.Font;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Agreements = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Prefix = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    PrefixText = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v14.bodyTextPart1, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    })
                }), 
                AgreementsList = v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, v13.props.agreementsListItems), 
                Suffix = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12)
                    }), 
                    PrefixText = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v14.bodyTextPart2, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    })
                })
            })
        });
    end;
end;
v12.render = function(v18)
    local l_screenSize_0 = v18.props.screenSize;
    return l_withStyle_0(function(v20)
        return v4({
            title = "Luobu.Authentication.UserAgreementsSecondPrompt.Title", 
            bodyTextPart1 = "Luobu.Authentication.UserAgreementsSecondPrompt.BodyText.Part1", 
            bodyTextPart2 = "Luobu.Authentication.UserAgreementsSecondPrompt.BodyText.Part2", 
            buttonText = "Luobu.Authentication.UserAgreementsSecondPrompt.Button.Acknowledge"
        })(function(v21)
            return v2.createElement(l_InteractiveAlert_0, {
                title = v21.title, 
                middleContent = function()
                    return v18.renderMiddleContent(v21, v20);
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v18.onAck, 
                                text = v21.buttonText
                            }
                        }
                    }
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = l_screenSize_0
            });
        end);
    end);
end;
return (v3.connect(function(v22)
    return {
        screenSize = v22.ScreenSize
    };
end, function(v23)
    return {
        showFirstPrompt = function(v24)
            v23(v11(v10.UserAgreementsPrompt, {
                agreements = v24, 
                context = v10.UserAgreementsSecondPrompt
            }));
        end
    };
end)(v12));
