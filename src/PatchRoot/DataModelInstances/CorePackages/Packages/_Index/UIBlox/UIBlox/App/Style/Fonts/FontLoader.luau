local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.Parent.Parent.Cryo);
local v3 = require(l_Parent_0.Gotham);
local _ = require(l_Parent_1.StyleTypes);
local v5 = {
    BASE_SIZE = 16, 
    FACTOR = 1.26
};
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8)
    local v9 = {
        _enableFontNameMapping = v7, 
        _tokens = v8
    };
    setmetatable(v9, v6);
    return v9;
end;
v6.loadFont = function(v10)
    if v10._enableFontNameMapping ~= true then
        return v3;
    else
        local l__tokens_0 = v10._tokens;
        local l_BASE_SIZE_0 = v5.BASE_SIZE;
        local v13 = {
            BaseSize = l_BASE_SIZE_0 * v5.FACTOR, 
            HeadingLarge = {
                Font = Enum.Font.BuilderSansBold, 
                RelativeSize = l__tokens_0.Global.Size_350 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_300 / l_BASE_SIZE_0
            }, 
            HeadingSmall = {
                Font = Enum.Font.BuilderSansBold, 
                RelativeSize = l__tokens_0.Global.Size_250 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0
            }, 
            TitleLarge = {
                Font = Enum.Font.BuilderSansBold, 
                RelativeSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0
            }, 
            BodyLarge = {
                Font = Enum.Font.BuilderSans, 
                RelativeSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0
            }, 
            CaptionLarge = {
                Font = Enum.Font.BuilderSansMedium, 
                RelativeSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
            }, 
            BodySmall = {
                Font = Enum.Font.BuilderSans, 
                RelativeSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
            }, 
            CaptionSmall = {
                Font = Enum.Font.BuilderSansMedium, 
                RelativeSize = l__tokens_0.Global.Size_125 / l_BASE_SIZE_0, 
                RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
            }
        };
        return v2.Dictionary.join(v10:mapLegacyFont(v13, l_BASE_SIZE_0), v13);
    end;
end;
v6.mapLegacyFont = function(_, v15, v16)
    return {
        Title = {
            Font = v15.HeadingLarge.Font, 
            RelativeSize = 28 / v16, 
            RelativeMinSize = 24 / v16
        }, 
        Header1 = {
            Font = v15.HeadingSmall.Font, 
            RelativeSize = 20 / v16, 
            RelativeMinSize = 16 / v16
        }, 
        Header2 = {
            Font = v15.TitleLarge.Font, 
            RelativeSize = 16 / v16, 
            RelativeMinSize = 12 / v16
        }, 
        SubHeader1 = {
            Font = v15.TitleLarge.Font, 
            RelativeSize = 16 / v16, 
            RelativeMinSize = 12 / v16
        }, 
        Body = {
            Font = v15.BodyLarge.Font, 
            RelativeSize = 16 / v16, 
            RelativeMinSize = 12 / v16
        }, 
        CaptionHeader = {
            Font = v15.CaptionLarge.Font, 
            RelativeSize = 12 / v16, 
            RelativeMinSize = 9 / v16
        }, 
        CaptionSubHeader = {
            Font = v15.CaptionLarge.Font, 
            RelativeSize = 12 / v16, 
            RelativeMinSize = 9 / v16
        }, 
        CaptionBody = {
            Font = v15.BodySmall.Font, 
            RelativeSize = 12 / v16, 
            RelativeMinSize = 9 / v16
        }, 
        Footer = {
            Font = v15.CaptionSmall.Font, 
            RelativeSize = 10 / v16, 
            RelativeMinSize = 8 / v16
        }
    };
end;
return v6;
