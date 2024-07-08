local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.getPaymentFromPlatform);
local v2 = require(l_Parent_0.Utils.getPaymentFromPlatformLegacy);
local v3 = require(l_Parent_0.Utils.getHasAmazonUserAgent);
local v4 = require(l_Parent_0.Utils.getHasQuestUserAgent);
local v5 = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local v6 = require(l_Parent_0.Flags.GetFFlagEnableQuestPaymentPlatformType);
return function(v7)
    local v8 = v3();
    local v9 = v5();
    if not v6() then
        return v2(v7, v9, v8);
    else
        return v1(v7, v9, v8, (v4()));
    end;
end;
