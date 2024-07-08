local l_GuiService_0 = game:GetService("GuiService");
local v1 = require(script.Parent.GetImageSetData);
local v2 = require(script.Parent.GetImageSetPathPattern);
local _ = require(script.Parent.types);
return function(v4, v5)
    local v6 = v1(v5 or l_GuiService_0:GetResolutionScale())[v4];
    if v6 == nil then
        return nil;
    else
        return {
            Image = v2(v6.ImageSet), 
            ImageRectSize = v6.ImageRectSize, 
            ImageRectOffset = v6.ImageRectOffset
        };
    end;
end;
