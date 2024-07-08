local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.t);
local v2 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
return v1.union(v1.strictInterface({
    BaseSize = v1.numberMinExclusive(0), 
    Title = v2, 
    Header1 = v2, 
    Header2 = v2, 
    SubHeader1 = v2, 
    Body = v2, 
    CaptionHeader = v2, 
    CaptionSubHeader = v2, 
    CaptionBody = v2, 
    Footer = v2
}), (v1.strictInterface({
    BaseSize = v1.numberMinExclusive(0), 
    Title = v2, 
    Header1 = v2, 
    Header2 = v2, 
    SubHeader1 = v2, 
    Body = v2, 
    CaptionHeader = v2, 
    CaptionSubHeader = v2, 
    CaptionBody = v2, 
    Footer = v2, 
    HeadingLarge = v2, 
    HeadingSmall = v2, 
    TitleLarge = v2, 
    BodyLarge = v2, 
    CaptionLarge = v2, 
    BodySmall = v2, 
    CaptionSmall = v2
})));
