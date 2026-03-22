({
    startGame: function(component, event, helper) {
     //access the combobox component
        let gameModeComboBox = component.find("gameMode");
        //access the value of the combobox
        let selectedValue = gameModeComboBox.get("v.value");
        //update the selectedmode attribute
        component.set("v.selectedMode", selectedValue);
        console.log("startGame button is clicked.The game mode is "+selectedValue);
        // alert("startGame button is clicked.The game mode is "+selectedValue);

    },
    reshuffleBoard: function(component, event, helper) {
        console.log("Reshuffle board button is clicked");

    }
})