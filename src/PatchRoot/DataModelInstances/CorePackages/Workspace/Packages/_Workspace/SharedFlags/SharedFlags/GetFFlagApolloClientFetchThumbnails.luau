local v0 = require(script.Parent.IsPrefetchOneCopyEnabled);
game:DefineFastFlag("ApolloClientFetchThumbnails4", false);
return function()
    return game:GetFastFlag("ApolloClientFetchThumbnails4") and not v0();
end;
