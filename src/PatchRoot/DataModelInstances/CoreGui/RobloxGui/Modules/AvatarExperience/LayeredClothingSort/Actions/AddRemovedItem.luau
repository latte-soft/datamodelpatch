return require(game:GetService("CorePackages").Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        removedAssetId = v0, 
        removedAssetTypeId = v1
    };
end);
