local v0 = require(script.Parent.IsPrefetchOneCopyEnabled);
game:DefineFastFlag("ApolloClientFetchExperiences3", false);
return function()
    return game:GetFastFlag("ApolloClientFetchExperiences3") and not v0();
end;
