local l_Flags_0 = script.Parent.Flags;
local v1 = require(l_Flags_0.GetFFlagLuaAppBootcampExample);
local _ = require(l_Flags_0.FFlagLuaAppBootcampIntroMOBLUAPP3345);
local v3 = require(l_Flags_0.FFlagLuaAppBootcampIntroUABOOTCAMP1);
local v4 = require(l_Flags_0.FFlagLuaAppBootcampIntroUABOOTCAMP4);
local v5 = {};
if v1() then
    table.insert(v5, "Bootcamp example flag is on");
end;
if v3 then
    table.insert(v5, "Hello world, this is IndeliblePlatypus");
end;
if v4 then
    table.insert(v5, "Hello world, this is QuirkySquid");
end;
return v5;
