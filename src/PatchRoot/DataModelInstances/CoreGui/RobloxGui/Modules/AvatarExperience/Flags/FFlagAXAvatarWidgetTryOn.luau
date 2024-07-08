local v0 = require(script.Parent.FFlagAXAvatarWidgetData);
game:DefineFastFlag("AXAvatarWidgetTryOn4", false);
return function()
    return v0() and game:GetFastFlag("AXAvatarWidgetTryOn4");
end;
