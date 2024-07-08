local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_script_FirstAncestor_0.Common.formatDate);
local v8 = require(l_script_FirstAncestor_0.Common.getEventTimerStatus);
local v9 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
local v10 = require(l_script_FirstAncestor_0.Hooks.useRefImpression);
local v11 = require(script.Parent.EventRowCounter);
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local v17 = l_Images_0["icons/actions/favoriteOn"];
local v18 = l_Images_0["icons/status/games/people-playing_small"];
local v19 = utf8.char(8226);
local v20 = UDim.new(0, 12);
local v21 = UDim.new(0, 4);
local v22 = {
    shouldTruncateText = true, 
    maxDescriptionLines = 2
};
return function(v23)
    local v24 = v2.Dictionary.join(v22, v23);
    local v25 = v3.createRef();
    local v26 = v8(v24.virtualEvent, DateTime.now());
    local v27 = l_useStyle_0();
    v10(v25, function()
        if v24.onImpression then
            v24.onImpression();
        end;
    end);
    local v28 = l_useLocalization_0({
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        joinEvent = "Feature.VirtualEvents.JoinEvent"
    });
    local v29 = v3.useMemo(function()
        return v9(v24.virtualEvent);
    end, l_dependencyArray_0(v24.virtualEvent));
    local v31 = v3.useCallback(function()
        local v30 = nil;
        v30 = v24.virtualEvent.userRsvpStatus ~= "going" and "going" or "notGoing";
        if v24.onRsvpChanged then
            v24.onRsvpChanged(v30);
        end;
    end, l_dependencyArray_0(v24.onRsvpChanged));
    local v32 = v3.useCallback(function()
        if v24.onJoinEvent then
            v24.onJoinEvent();
        end;
    end, l_dependencyArray_0(v24.onJoinEvent));
    local v33 = v3.useMemo(function()
        if not (v26 ~= "Ongoing") or v26 == "ElapsedImminent" then
            return v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                layoutOrder = 3, 
                text = v28.joinEvent, 
                fontStyle = v27.Font.CaptionHeader, 
                size = UDim2.new(1, 0, 0, 28), 
                onActivated = v32
            });
        elseif v24.virtualEvent.userRsvpStatus ~= "going" then
            return v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                layoutOrder = 3, 
                text = v28.notifyMe, 
                fontStyle = v27.Font.CaptionHeader, 
                size = UDim2.new(1, 0, 0, 28), 
                onActivated = v31
            });
        else
            return v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                layoutOrder = 3, 
                text = v28.unfollowEvent, 
                fontStyle = v27.Font.CaptionHeader, 
                size = UDim2.new(1, 0, 0, 28), 
                onActivated = v31
            });
        end;
    end, l_dependencyArray_0(v24.virtualEvent, v26, v32, v31));
    local v34 = v27.Font.BaseSize * v27.Font.Header2.RelativeSize;
    local v35 = if not v24.shouldTruncateText then math.huge else ((v24.maxDescriptionLines * v27.Font.BaseSize) * v27.Font.CaptionBody.RelativeSize) * 1.4;
    local l_experienceDetails_0 = v24.virtualEvent.experienceDetails;
    local l_rsvpCounters_0 = v24.virtualEvent.rsvpCounters;
    local v38 = if not not l_rsvpCounters_0 and l_rsvpCounters_0.going then l_rsvpCounters_0.going else 0;
    local v39 = if not not l_experienceDetails_0 and l_experienceDetails_0.playing then l_experienceDetails_0.playing else 0;
    local v40 = true;
    if v26 ~= "Ongoing" then
        v40 = v26 == "ElapsedImminent";
    end;
    return v3.createElement("ImageButton", {
        Size = UDim2.fromScale(1, 0), 
        AutoButtonColor = false, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        BackgroundColor3 = v27.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v27.Theme.BackgroundUIDefault.Transparency, 
        ref = v25, 
        [v3.Event.Activated] = v24.onTileActivated
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v20
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = v20, 
            PaddingRight = v20, 
            PaddingBottom = v20, 
            PaddingLeft = v20
        }), 
        BorderRadius = v3.createElement("UICorner", {
            CornerRadius = v20
        }), 
        BorderColor = v3.createElement("UIStroke", {
            Color = v27.Theme.Divider.Color, 
            Transparency = v27.Theme.Divider.Transparency, 
            Thickness = 1
        }), 
        Header = v3.createElement("Frame", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v21
            }), 
            Title = v3.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v24.virtualEvent.title, 
                fontStyle = v27.Font.Header2, 
                colorStyle = v27.Theme.TextEmphasis, 
                automaticSize = if not v24.shouldTruncateText then Enum.AutomaticSize.XY else Enum.AutomaticSize.X, 
                size = if not v24.shouldTruncateText then nil else UDim2.fromOffset(0, v34), 
                textTruncate = Enum.TextTruncate.AtEnd, 
                fluidSizing = not v24.shouldTruncateText and true or false, 
                richText = not v24.shouldTruncateText and true or false
            }), 
            Info = v3.createElement("Frame", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = v21
                }), 
                Date = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v7(v29.startDate), 
                    automaticSize = Enum.AutomaticSize.XY, 
                    fontStyle = v27.Font.CaptionBody, 
                    colorStyle = v27.Theme.TextDefault
                }), 
                Stats = if not (v38 <= 0) or v39 > 0 then v3.createElement(v3.Fragment, {}, {
                    Separator = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 2, 
                        text = v19, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        fontStyle = v27.Font.CaptionBody, 
                        colorStyle = v27.Theme.TextDefault
                    }), 
                    InterestedCount = if not v38 or v40 then nil else v3.createElement(v11, {
                        layoutOrder = 3, 
                        icon = v17, 
                        counter = v38
                    }), 
                    PlayCount = if not not v39 and v40 then v3.createElement(v11, {
                        layoutOrder = 4, 
                        icon = v18, 
                        counter = v39
                    }) else nil
                }) else nil
            })
        }), 
        Description = v3.createElement("Frame", {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            SizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(math.huge, v35)
            }), 
            Label = v3.createElement(l_StyledTextLabel_0, {
                text = v24.virtualEvent.description, 
                automaticSize = Enum.AutomaticSize.XY, 
                size = UDim2.fromScale(1, 0), 
                fontStyle = v27.Font.CaptionBody, 
                colorStyle = v27.Theme.TextDefault, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textYAlignment = Enum.TextYAlignment.Top, 
                fluidSizing = false, 
                richText = false, 
                lineHeight = 1.4
            })
        }), 
        CallToAction = v33
    });
end;
