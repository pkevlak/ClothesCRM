function openAlert() 
    {
        var string = document.getElementById("j_id0:j_id9:j_id10:mailid").value;
        var span = ".";
        if(string.includes(span)){
            alert("We got your request");
                }
    }
    function findProduct()
    {
        var srch = document.getElementById("fnd").value;
        if(srch != ''){
        window.open("https://kevlakclothes-developer-edition.ap8.force.com/Search?q=" + srch, "_self");
         }
    }
    function openMain() 
    {
    window.open("http://kevlakclothes-developer-edition.ap8.force.com", "_self");
    }