function openMain() 
    {
    window.open("http://kevlakclothes-developer-edition.ap8.force.com/", "_self");
    }
function openProduct(id)
    {
        window.open("https://kevlakclothes-developer-edition.ap8.force.com/Home?Id=" + id, "_self");
    }
function findProduct()
    {
        var srch = document.getElementById("fnd").value;
        if(srch != ''){
        window.open("https://kevlakclothes-developer-edition.ap8.force.com/Search?q=" + srch, "_self");
         }
    }