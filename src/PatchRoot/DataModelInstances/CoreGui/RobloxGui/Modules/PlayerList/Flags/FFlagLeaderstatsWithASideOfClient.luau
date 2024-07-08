if game:GetEngineFeature("CoreAttributes") then
    return game:DefineFastFlag("LeaderstatsWithASideOfClient", false);
else
    return false;
end;
