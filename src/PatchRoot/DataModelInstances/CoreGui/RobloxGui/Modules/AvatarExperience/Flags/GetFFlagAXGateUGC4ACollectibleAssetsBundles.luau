local v0 = require(script.Parent.GetFFlagAXLimitedBundlesHandleNewData);
game:DefineFastFlag("AXGateUGC4ACollectibleAssetsBundles", false);
return function()
    return game:GetFastFlag("AXGateUGC4ACollectibleAssetsBundles") and not v0();
end;
