game:DefineFastFlag("LuaAppRefactorExperienceInfoTable2", false);
game:DefineFastFlag("LuaAppRefactorExperienceInfoTable3", false);
return function()
    return game:GetFastFlag("LuaAppRefactorExperienceInfoTable2") or game:GetFastFlag("LuaAppRefactorExperienceInfoTable3");
end;
