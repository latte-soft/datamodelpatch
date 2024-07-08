local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_1.RobloxTranslator);
local v8 = v2.PureComponent:extend("WheelText");
v8.getWheelText = function(v9)
    local l_currentEmotes_0 = v9.props.emotesPage.currentEmotes;
    local l_locale_0 = v9.props.locale;
    local l_numberEmotesLoaded_0 = v9.props.emotesPage.numberEmotesLoaded;
    if next(l_currentEmotes_0) == nil then
        if l_StarterPlayer_0.UserEmotesEnabled and l_numberEmotesLoaded_0 == 0 then
            return v7:FormatByKeyForLocale(v6.LocalizationKeys.NoEmotesEquipped, l_locale_0);
        else
            return v7:FormatByKeyForLocale(v6.LocalizationKeys.EmotesDisabled, l_locale_0);
        end;
    else
        local v13 = l_currentEmotes_0[v9.props.emotesWheel.focusedSegmentIndex];
        if not v13 then
            return v7:FormatByKeyForLocale(v6.LocalizationKeys.SelectAnEmote, l_locale_0);
        else
            return v13;
        end;
    end;
end;
v8.render = function(v14)
    local v15 = v6.Layouts[v14.props.layout];
    return v2.createElement("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(v6.InnerCircleSizeRatio, -v6.TextPadding, v6.InnerCircleSizeRatio, -v6.TextPadding), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Text = v14:getWheelText(), 
        TextScaled = true, 
        TextSize = v15.MiddleTextSize, 
        TextColor3 = v6.Colors.White, 
        Font = v15.MiddleTextFont, 
        ZIndex = 5
    }, {
        TextSizeConstraint = v2.createElement("UITextSizeConstraint", {
            MaxTextSize = v15.MiddleTextSize
        })
    });
end;
return v3.connect(function(v16)
    return {
        emotesWheel = v16.emotesWheel, 
        emotesPage = v16.emotesPage, 
        layout = v16.layout, 
        locale = v16.locale
    };
end, nil)(v8);
