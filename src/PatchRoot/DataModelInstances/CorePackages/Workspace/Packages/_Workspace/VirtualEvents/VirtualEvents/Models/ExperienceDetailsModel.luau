return {
    mock = function(v0)
        return {
            id = v0 or -1, 
            rootPlaceId = -2, 
            name = "Experience name", 
            description = "Experience description", 
            sourceName = "Source name", 
            sourceDescription = "Source description", 
            creator = {
                id = -3, 
                name = "CreatorName", 
                type = "User", 
                isRNVAccount = false, 
                hasVerifiedBadge = false
            }, 
            price = 0, 
            allowedGearGenres = {}, 
            allowedGearCategories = {}, 
            isGenreEnforced = false, 
            copyingAllowed = false, 
            playing = 0, 
            visits = 0, 
            maxPlayers = 10, 
            created = DateTime.now():ToIsoDate(), 
            updated = DateTime.now():ToIsoDate(), 
            studioAccessToApisAllowed = false, 
            universeAvatarType = "MorphR6", 
            genre = "", 
            isAllGenre = false, 
            isFavoritedByUser = false, 
            favoritedCount = 0
        };
    end
};
