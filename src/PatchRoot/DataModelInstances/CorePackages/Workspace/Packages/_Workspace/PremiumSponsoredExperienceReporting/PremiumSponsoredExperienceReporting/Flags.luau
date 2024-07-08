game:DefineFastString("PremiumSponsoredExperienceInstances", "");
game:DefineFastInt("PremiumSponsoredExperienceWaitTimeSeconds", 5);
return {
    GetFStringPremiumSponsoredExperienceInstances = function()
        return game:GetFastString("PremiumSponsoredExperienceInstances");
    end, 
    GetFIntPremiumSponsoredExperienceWaitTimeSeconds = function()
        return game:GetFastInt("PremiumSponsoredExperienceWaitTimeSeconds");
    end
};
