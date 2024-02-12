let Req = new XMLHttpRequest();
let array = [];

Req.open("GET", "http://127.0.0.1:8000/api/productname");
Req.onreadystatechange = function () {
    if (Req.readyState == 4) {
        if (Req.status == 200) {
            let jsObject = JSON.parse(Req.response);
            jsObject.data.forEach((element) => {
                array.push(element.name);
            });
        }
    }
};
Req.send("");

let resultsBox = document.querySelector(".sugg_container");
let inputBox = document.getElementById("search");

inputBox.onkeyup = function ()
{
    let form = document.getElementById('submit_search');
    let result = [];
    let input = inputBox.value;
    if (input.length) {
        result = array.filter((keyword) => {
            return keyword.toLowerCase().startsWith(input.toLowerCase());
        });
        console.log(result);
    }
    display(result);
};

function display(result) {
    const content = result.map((list) => {
        return "<li class='list_item' onclick=selectInput(this)>" + list + "</li>";
    });
    resultsBox.innerHTML = "<ul class='list'>" + content.join('') + "</ul>";
}

function selectInput(list){
    inputBox.value = list.innerHTML;
    form.submit();
}
