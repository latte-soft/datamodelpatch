local v0 = require(script.Parent.FFlagAXAvatarWidgetData);
game:DefineFastFlag("AXRefactorTryOnItems4", false);
return function()
    return v0() and game:GetFastFlag("AXRefactorTryOnItems4");
end;
