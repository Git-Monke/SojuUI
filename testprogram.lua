os.loadAPI("SojuUI")

local Term = SojuUI.newDevice({
    ["framerate"] = 20,
})

local TestFrame = Term:newFrame("testFrame", {
    ["width"] = 30,
    ["height"] = 15,
    ["x"] = 5,
    ["y"] = 3
})
local TestScreen = TestFrame:newScreen("testScreen", {
    ["backgroundColor"] = colors.gray
})
local NewInstance = TestScreen:newInstance("testInstance", "label", {
    ["backgroundColor"] = colors.green,
    ["width"] = 20,
    ["height"] = 3,
    ["y"] = 1,
    ["x"] = 2,
    ["text"] = "MONKE IS EPIC",
})

local SecondaryFrame = Term:newFrame("secondaryFrame", {
    ["width"] = 20,
    ["height"] = 11,
    ["x"] = 25,
    ["y"] = 6,
    ["z"] = -1
})
local Screen = SecondaryFrame:newScreen("test", {
    ["backgroundColor"] = colors.white
})
local AnotherScreen = SecondaryFrame:newScreen("2", {
    ["backgroundColor"] = colors.red
})
local newLabel = Screen:newInstance("newLabel", "button", {
    ["text"] = "Click me!",
    ["width"] = 16,
    ["height"] = 1,
    ["x"] = 2,
    ["y"] = 6
})
local anotherLabel = AnotherScreen:newInstance("anotherLabel", "button", {
    ["text"] = "New screen!",
    ["width"] = 13,
    ["height"] = 3,
    ["x"] = 2,
    ["y"] = 6
})
newLabel.onClick = function ()
    SecondaryFrame:setScreen(AnotherScreen)
end
anotherLabel.onClick = function ()
    SecondaryFrame:setScreen(Screen)
end

TestFrame:setScreen(TestScreen);
SecondaryFrame:setScreen(Screen);

local i = 0;

-- This will be run 20 times per second
function main()
    i = i + 1;
    NewInstance.x = NewInstance.x + math.sin(i / 4)
end

SojuUI.beginTasks(main);