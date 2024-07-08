local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.Parent.LuauPolyfill).Array;
local l_parse_0 = require(l_Parent_1.language.parser).parse;
local _ = require(l_Parent_1.type.schema);
local l_buildSchema_0 = require(l_Parent_1.utilities.buildASTSchema).buildSchema;
local v6 = require(l_Parent_0.validate);
local l_validate_0 = v6.validate;
local l_validateSDL_0 = v6.validateSDL;
local v9 = l_buildSchema_0("  interface Being {\n    name(surname: Boolean): String\n  }\n\n  interface Mammal {\n    mother: Mammal\n    father: Mammal\n  }\n\n  interface Pet implements Being {\n    name(surname: Boolean): String\n  }\n\n  interface Canine implements Mammal & Being {\n    name(surname: Boolean): String\n    mother: Canine\n    father: Canine\n  }\n\n  enum DogCommand {\n    SIT\n    HEEL\n    DOWN\n  }\n\n  type Dog implements Being & Pet & Mammal & Canine {\n    name(surname: Boolean): String\n    nickname: String\n    barkVolume: Int\n    barks: Boolean\n    doesKnowCommand(dogCommand: DogCommand): Boolean\n    isHouseTrained(atOtherHomes: Boolean = true): Boolean\n    isAtLocation(x: Int, y: Int): Boolean\n    mother: Dog\n    father: Dog\n  }\n\n  type Cat implements Being & Pet {\n    name(surname: Boolean): String\n    nickname: String\n    meows: Boolean\n    meowsVolume: Int\n    furColor: FurColor\n  }\n\n  union CatOrDog = Cat | Dog\n\n  interface Intelligent {\n    iq: Int\n  }\n\n  type Human implements Being & Intelligent {\n    name(surname: Boolean): String\n    pets: [Pet]\n    relatives: [Human]\n    iq: Int\n  }\n\n  type Alien implements Being & Intelligent {\n    name(surname: Boolean): String\n    numEyes: Int\n    iq: Int\n  }\n\n  union DogOrHuman = Dog | Human\n\n  union HumanOrAlien = Human | Alien\n\n  enum FurColor {\n    BROWN\n    BLACK\n    TAN\n    SPOTTED\n    NO_FUR\n    UNKNOWN\n  }\n\n  input ComplexInput {\n    requiredField: Boolean Boolean Int\n    stringField: String\n    booleanField: Boolean\n    stringListField: [String]\n  }\n\n  type ComplicatedArgs {\n    # TODO List\n    # TODO Coercion\n    # TODO NotNulls\n    intArgField(intArg: Int): String\n    nonNullIntArgField(nonNullIntArg: Int String\n    stringArgField(stringArg: String): String\n    booleanArgField(booleanArg: Boolean): String\n    enumArgField(enumArg: FurColor): String\n    floatArgField(floatArg: Float): String\n    idArgField(idArg: ID): String\n    stringListArgField(stringListArg: [String]): String\n    stringListNonNullArgField(stringListNonNullArg: [String String\n    complexArgField(complexArg: ComplexInput): String\n    multipleReqs(req1: Int Int String\n    nonNullFieldWithDefault(arg: Int String\n    multipleOpts(opt1: Int = 0, opt2: Int = 0): String\n    multipleOptAndReq(req1: Int Int Int = 0, opt2: Int = 0): String\n  }\n\n  type QueryRoot {\n    human(id: ID): Human\n    alien: Alien\n    dog: Dog\n    cat: Cat\n    pet: Pet\n    catOrDog: CatOrDog\n    dogOrHuman: DogOrHuman\n    humanOrAlien: HumanOrAlien\n    complicatedArgs: ComplicatedArgs\n  }\n\n  schema {\n    query: QueryRoot\n  }\n\n  directive @onQuery on QUERY\n  directive @onMutation on MUTATION\n  directive @onSubscription on SUBSCRIPTION\n  directive @onField on FIELD\n  directive @onFragmentDefinition on FRAGMENT_DEFINITION\n  directive @onFragmentSpread on FRAGMENT_SPREAD\n  directive @onInlineFragment on INLINE_FRAGMENT\n  directive @onVariableDefinition on VARIABLE_DEFINITION\n");
local function v15(v10, v11, v12, v13)
    return v10((l_Array_0.map(l_validate_0(v11, l_parse_0(v13), {
        v12
    }), function(v14)
        return {
            message = v14.message, 
            locations = v14.locations
        };
    end)));
end;
return {
    testSchema = v9, 
    expectValidationErrorsWithSchema = v15, 
    expectValidationErrors = function(v16, v17, v18)
        return v15(v16, v9, v17, v18);
    end, 
    expectSDLValidationErrors = function(v19, v20, v21, v22)
        return v19((l_Array_0.map(l_validateSDL_0(l_parse_0(v22), v20, {
            v21
        }), function(v23)
            return {
                message = v23.message, 
                locations = v23.locations
            };
        end)));
    end
};
