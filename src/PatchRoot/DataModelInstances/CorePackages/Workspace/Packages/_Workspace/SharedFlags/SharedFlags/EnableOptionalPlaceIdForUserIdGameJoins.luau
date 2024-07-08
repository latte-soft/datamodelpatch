game:DefineFastFlag("EnableOptionalPlaceIdForUserIdGameJoins", false);
game:DefineFastFlag("EnableOptionalPlaceIdForUserIdGameJoinsTesting", false);
return function()
    if not game:GetFastFlag("EnableOptionalPlaceIdForUserIdGameJoinsTesting") then
        return game:GetFastFlag("EnableOptionalPlaceIdForUserIdGameJoins") and game:GetEngineFeature("JoinByUserTakesOptionalPlaceId");
    else
        return true;
    end;
end;
