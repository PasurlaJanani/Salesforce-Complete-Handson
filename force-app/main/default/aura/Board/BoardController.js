({
    doInit : function(component, event, helper) {

        console.log("doInit method is called for intialization");
        //get the game mode
        const gameMode=component.get("v.Mode");
        let column = 0;
        console.log("gameMode is "+gameMode)
        //get the number of columns based on the game mode
        if(gameMode && gameMode==="hard")
        {
            column=6;
        }
        else if(gameMode==="medium"){
            column=4;
            console.log("column is "+column)
        }else{
            column=3;
        }
        //get the block size
        let blocksize=12/column;
        console.log("blocksize is "+blocksize);
        component.set("v.blockSize",blocksize);
        //build a list of 100 words
        const words=helper.getWords(column*column);
        component.set("v.Words",words);
       //get winword
       const winword=helper.getWinWord(words);
       component.set("v.winWord",winword);
    },
    doRender : function(component, event, helper) {

        console.log("doRender method is called for  rendering");

    }
})