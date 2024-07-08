game:DefineFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist", "");
return {
    isWhitelistedUserId = function(v0)
        for v1 in string.gmatch(game:GetFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist"), "[^,]+") do
            if tostring(v0) == v1 then
                return true;
            end;
        end;
        return false;
    end
};
