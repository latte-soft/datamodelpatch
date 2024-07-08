local v0 = require(script:FindFirstAncestor("AppChat").Parent.Cryo);
return function(v1)
    return {
        Theme = v0.Dictionary.join(v1.Theme, {
            TextDefault = {
                Color = v1.Theme.TextEmphasis.Color, 
                Transparency = v1.Theme.TextEmphasis.Transparency
            }
        }), 
        Font = v0.Dictionary.join(v1.Font, {
            Body = {
                Font = v1.Font.Header1.Font, 
                RelativeSize = v1.Font.Body.RelativeSize, 
                RelativeMinSize = v1.Font.Body.RelativeMinSize
            }, 
            CaptionBody = {
                Font = v1.Font.Header1.Font, 
                RelativeSize = v1.Font.CaptionBody.RelativeSize, 
                RelativeMinSize = v1.Font.CaptionBody.RelativeMinSize
            }
        })
    };
end;
