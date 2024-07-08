local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
return function()
    return l_status_0 and l_result_0;
end;
